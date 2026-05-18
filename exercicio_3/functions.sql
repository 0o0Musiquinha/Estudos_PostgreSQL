--Function's session
CREATE OR REPLACE FUNCTION exercicio3.is_valid_cpf(p_cpf TEXT) 
RETURNS BOOLEAN AS $$
DECLARE
    v_sum INT := 0;
    v_digit INT;
    v_i INT;
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

    -- Cálculo de validação do primeiro dígito verificador
    FOR v_i IN 1..9 LOOP
        v_sum := v_sum + (SUBSTRING(p_cpf FROM v_i FOR 1)::INT * (11 - v_i));
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Verifica se o primeiro dígito calculado bate com o do CPF informado
    IF v_digit != SUBSTRING(p_cpf FROM 10 FOR 1)::INT THEN
        RETURN FALSE;
    END IF;

    -- Cálculo de validação do segundo dígito verificador
    v_sum := 0;
    FOR v_i IN 1..10 LOOP
        v_sum := v_sum + (SUBSTRING(p_cpf FROM v_i FOR 1)::INT * (12 - v_i));
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Verifica se o segundo dígito calculado bate com o do CPF informado
    IF v_digit != SUBSTRING(p_cpf FROM 11 FOR 1)::INT THEN
        RETURN FALSE;
    END IF;

    -- Se passou em todas as checagens, o documento é válido
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

CREATE OR REPLACE FUNCTION exercicio3.is_valid_cnpj_alpha(v_cnpj TEXT) 
RETURNS BOOLEAN AS $$
DECLARE
    v_sum INT;
    v_digit INT;
    v_i INT;
    v_char_val INT;
    -- Pesos oficiais para o primeiro e segundo dígito verificador
    v_weights_1 INT[] := ARRAY[5,4,3,2,9,8,7,6,5,4,3,2];
    v_weights_2 INT[] := ARRAY[6,5,4,3,2,9,8,7,6,5,4,3,2];
BEGIN
    -- 1. Valida o tamanho exato de 14 caracteres
    IF LENGTH(v_cnpj) != 14 THEN
        RETURN FALSE;
    END IF;

    -- 2. Os dois últimos caracteres devem ser estritamente numéricos
    IF SUBSTRING(v_cnpj FROM 13 FOR 2) ~ '[^0-9]' THEN
        RETURN FALSE;
    END IF;

    -- 3. Cálculo do Primeiro Dígito Verificador
    v_sum := 0;
    FOR v_i IN 1..12 LOOP
        -- Regra Oficial: Código ASCII do caractere menos 48
        v_char_val := ASCII(SUBSTRING(v_cnpj FROM v_i FOR 1)) - 48;
        v_sum := v_sum + (v_char_val * v_weights_1[v_i]);
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Valida se o primeiro dígito bate com a posição 13
    IF v_digit != SUBSTRING(v_cnpj FROM 13 FOR 1)::INT THEN
        RETURN FALSE;
    END IF;

    -- 4. Cálculo do Segundo Dígito Verificador
    v_sum := 0;
    FOR v_i IN 1..13 LOOP
        v_char_val := ASCII(SUBSTRING(v_cnpj FROM v_i FOR 1)) - 48;
        v_sum := v_sum + (v_char_val * v_weights_2[v_i]);
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Valida se o segundo dígito bate com a posição 14
    IF v_digit != SUBSTRING(v_cnpj FROM 14 FOR 1)::INT THEN
        RETURN FALSE;
    END IF;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;