--Validação de CPF
CREATE OR REPLACE FUNCTION exercicio3.is_valid_cpf(p_cpf TEXT) 
RETURNS BOOLEAN AS $$
DECLARE
    v_sum INT := 0;
    v_digit INT;
    v_i INT;
    v_cpf_array INT[11];
BEGIN
    -- O CPF deve conter exatamente 11 dígitos
    IF LENGTH(p_cpf) != 11 THEN
        RETURN FALSE;
    END IF;

	-- O CPF deve conter somente número
	IF p_cpf ~ '^[^0-9]$' THEN
		RETURN FALSE;
	END IF;

    -- Rejeita CPFs com todos os dígitos iguais (ex: 111.111.111-11)
    IF p_cpf IN (
        '00000000000', '11111111111', '22222222222', '33333333333', '44444444444',
        '55555555555', '66666666666', '77777777777', '88888888888', '99999999999'
    ) THEN
        RETURN FALSE;
    END IF;

    FOR v_1 IN 1..11 LOOP
        v_cpf_array := array_append(SUBSTRING(p_cpf FROM v_i FOR 1)::INT)
    END LOOP;

    -- Cálculo de validação do primeiro dígito verificador
    FOR v_i IN 1..9 LOOP
        v_sum := v_sum + (v_cpf_array[v_i] * (11 - v_i));
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Verifica se o primeiro dígito calculado bate com o do CPF informado
    IF v_digit != v_cpf_array[10] THEN
        RETURN FALSE;
    END IF;

    -- Cálculo de validação do segundo dígito verificador
    v_sum := 0;
    FOR v_i IN 1..10 LOOP
        v_sum := v_sum + (v_cpf_array[v_i] * (12 - v_i));
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Verifica se o segundo dígito calculado bate com o do CPF informado
    IF v_digit != v_cpf_array[11]::INT THEN
        RETURN FALSE;
    END IF;

    -- Se passou em todas as checagens, o documento é válido
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

CREATE OR REPLACE FUNCTION exercicio3.is_valid_cnpj_alpha(p_cnpj TEXT) 
RETURNS BOOLEAN AS $$
DECLARE
    v_sum INT;
    v_digit INT;
    v_i INT;
    v_char_val INT;
    v_cnpj_array INT[14];
    -- Pesos oficiais para o primeiro e segundo dígito verificador
    v_weights_1 INT[] := ARRAY[5,4,3,2,9,8,7,6,5,4,3,2];
    v_weights_2 INT[] := ARRAY[6,5,4,3,2,9,8,7,6,5,4,3,2];
BEGIN
    -- 1. Valida o tamanho exato de 14 caracteres
    IF LENGTH(v_cnpj) != 14 THEN
        RETURN FALSE;
    END IF;

    -- Rejeita CPFs com todos os dígitos iguais (ex: 111.111.111-11)
    IF p_cnpj IN (
        '00000000000000', '11111111111111', '22222222222222', '33333333333333', '44444444444444',
        '55555555555555', '66666666666666', '77777777777777', '88888888888888', '99999999999999'
    ) THEN
        RETURN FALSE;
    END IF;

    -- 2. Destrincha o cnpj em um array
    FOR v_1 IN 1..14 LOOP
        v_cnpj_array := array_append(SUBSTRING(p_cnpj FROM v_i FOR 1)::INT)
    END LOOP;

    -- 3. Os dois últimos caracteres devem ser estritamente numéricos
    IF v_cnpj_array[13] ~ '[^0-9]' and v_cnpj_array[14] ~ '[^0-9]' THEN
        RETURN FALSE;
    END IF;

    -- 4. Cálculo do Primeiro Dígito Verificador
    v_sum := 0;
    FOR v_i IN 1..12 LOOP
        -- Regra Oficial: Código ASCII do caractere menos 48
        v_char_val := ASCII(v_cnpj_array[v_i]) - 48;
        v_sum := v_sum + (v_char_val * v_weights_1[v_i]);
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Valida se o primeiro dígito bate com a posição 13
    IF v_digit != v_cnpj_array[13] THEN
        RETURN FALSE;
    END IF;

    -- 5. Cálculo do Segundo Dígito Verificador
    v_sum := 0;
    FOR v_i IN 1..13 LOOP
        v_char_val := ASCII(v_cnpj_array[v_i]) - 48;
        v_sum := v_sum + (v_char_val * v_weights_2[v_i]);
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Valida se o segundo dígito bate com a posição 14
    IF v_digit != v_cnpj_array[14] THEN
        RETURN FALSE;
    END IF;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

--Gerar automaticamente códigos para produtos
CREATE OR REPLACE FUNCTION exercicio3.product_code_generator()
RETURNS TEXT AS $$
DECLARE
	v_i INT;
	v_alphanumeric TEXT := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	v_code TEXT;
	v_condition INT = 0;
BEGIN
	WHILE v_condition = 0 LOOP
		v_code := 'PRD-';
		FOR i IN 1..15 LOOP
			v_code := v_code || SUBSTRING(v_alphanumeric, FLOOR(random() * 36)::INT + 1, 1);
		END LOOP;
		IF NOT EXISTS (SELECT 1 FROM exercicio3.t_products WHERE code = v_code) THEN
			v_condition := 1;
		END IF;
	END LOOP;
	RETURN v_code;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

--Gerar automaticamente códigos para pedidos
CREATE OR REPLACE FUNCTION exercicio3.order_code_generator()
RETURNS TEXT AS $$
DECLARE
	v_i INT;
	v_alphanumeric TEXT := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	v_date TIMESTAMPTZ := CURRENT_TIMESTAMP(0);
	v_code TEXT;
	v_condition INT := 0;
BEGIN
	WHILE v_condition = 0 LOOP
		v_code := 'PED-' || TO_CHAR(v_date, 'YYYY') || TO_CHAR(v_date, 'MM') || TO_CHAR(v_date, 'DD') || '-';
		FOR i IN 1..15 LOOP
			v_code := v_code || SUBSTRING(v_alphanumeric, FLOOR(random() * 36)::INT + 1, 1);
		END LOOP; 

		IF NOT EXISTS (SELECT 1 FROM exercicio3.t_orders WHERE code = v_code) THEN
			v_condition := 1;
		END IF;
	END LOOP;
	RETURN v_code;
END;
$$ LANGUAGE plpgsql IMMUTABLE;