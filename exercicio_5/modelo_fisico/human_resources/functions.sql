CREATE OR REPLACE FUNCTION exercicio5_hr.is_valid_pis(p_pis TEXT) 
RETURNS BOOLEAN AS $$
DECLARE
    v_sum INT := 0;
    v_digit INT;
    v_i INT;
    v_pis_array INT[11];
    -- Pesos oficiais para multiplação do PIS
    v_weights INT[] := ARRAY[3,2,9,8,7,6,5,4,3,2];
BEGIN
    -- O PIS deve conter exatamente 11 dígitos
    IF LENGTH(p_pis) != 11 THEN
        RETURN FALSE;
    END IF;

	-- O PIS deve conter somente número
	IF p_pis ~ '^[^0-9]$' THEN
		RETURN FALSE;
	END IF;

    -- Rejeita PIS com todos os dígitos iguais (ex: 111.111.111-11)
    IF p_pis IN (
        '00000000000', '11111111111', '22222222222', '33333333333', '44444444444',
        '55555555555', '66666666666', '77777777777', '88888888888', '99999999999'
    ) THEN
        RETURN FALSE;
    END IF;

    FOR v_1 IN 1..11 LOOP
        v_pis_array := array_append(SUBSTRING(p_pis FROM v_i FOR 1))::INT;
    END LOOP;

    -- Cálculo de validação do dígito verificador
    FOR v_i IN 1..10 LOOP
        v_sum := v_sum + (v_pis_array[v_i] * v_weights[v_1]);
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Verifica se o dígito calculado bate com o do PIS informado
    IF v_digit != v_pis_array[11] THEN
        RETURN FALSE;
    END IF;

    -- Se passou em todas as checagens, o documento é válido
    RETURN TRUE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;