CREATE OR REPLACE FUNCTION exercicio5_hr.is_valid_pis(p_pis TEXT) 
RETURNS BOOLEAN AS $$
DECLARE
    v_sum SMALLINT := 0;
    v_digit SMALLINT;
    v_i SMALLINT;
    -- Inicializa o array vazio para evitar que as operações resultem em NULL
    v_pis_array SMALLINT[] := ARRAY[]::SMALLINT[];
    -- Pesos oficiais para multiplicação do PIS
    v_weights SMALLINT[] := ARRAY[3,2,9,8,7,6,5,4,3,2];
BEGIN
    -- O PIS deve conter exatamente 11 dígitos
    IF LENGTH(p_pis) != 11 THEN
        RETURN FALSE;
    END IF;

    -- Garante que a string inteira contenha apenas números de 0 a 9
    IF NOT p_pis ~ '^[0-9]{11}$' THEN
        RETURN FALSE;
    END IF;

    -- Rejeita PIS com todos os dígitos iguais
    IF p_pis IN (
        '00000000000', '11111111111', '22222222222', '33333333333', '44444444444',
        '55555555555', '66666666666', '77777777777', '88888888888', '99999999999'
    ) THEN
        RETURN FALSE;
    END IF;

    -- Fatiar a string
    FOR v_i IN 1..11 LOOP
        v_pis_array := array_append(v_pis_array, SUBSTRING(p_pis FROM v_i FOR 1)::SMALLINT);
    END LOOP;

    -- Cálculo de validação do dígito verificador
    FOR v_i IN 1..10 LOOP
        v_sum := v_sum + (v_pis_array[v_i] * v_weights[v_i]);
    END LOOP;
    
    v_digit := 11 - (v_sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Verifica se o dígito calculado bate com o do PIS informado
    IF v_digit != v_pis_array[11] THEN
        RETURN FALSE;
    END IF;


    RETURN TRUE;
END;
$$ LANGUAGE plpgsql IMMUTABLE;