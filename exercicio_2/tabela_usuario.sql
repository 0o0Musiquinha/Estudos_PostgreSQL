CREATE SCHEMA IF NOT EXISTS exercicio2;

-- Caso necessário
DROP TABLE IF EXISTS exercicio2.t_user

CREATE TABLE IF NOT EXISTS exercicio2.t_user(
	id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(SEQUENCE NAME exercicio2_t_user_seq),
	name VARCHAR(120) NOT NULL,
	cpf VARCHAR(11),
--	cnpj VARCHAR(),
	email VARCHAR(254) NOT NULL,
	age SMALLINT,
	password VARCHAR(128) NOT NULL,
	phonenumber VARCHAR(11) NOT NULL,
	user_status VARCHAR(9) NOT NULL DEFAULT 'ativo',
	creation_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP(0),
	access_tier SMALLINT NOT NULL,
	
	--CONSTRAINT session
	CONSTRAINT exercicio2_t_user_pk PRIMARY KEY(id),
	CONSTRAINT exercicio2_t_user_uq_email UNIQUE(email),
	CONSTRAINT exercicio1_t_user_uq_cpf UNIQUE(cpf),
--	CONSTRAINT exercicio1_t_user_uq_cnpj UNIQUE(cnpj),

	--CHECK CONSTRAINT session
	CONSTRAINT exercicio2_t_user_ck_name CHECK(
		name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
	),

	CONSTRAINT exercicio2_t_user_ck_cpf CHECK(SELECT is_valid_cpf(cpf)),
	CONSTRAINT exercicio2_t_user_ck_cnpj CHECK(SELECT is_valid_cnpj(cnpj)),
	CONSTRAINT exercicio2_t_user_ck_email CHECK(
		email ~ '^[^.]{1}(?!.*\.\.)[A-Za-z0-9._%+-]{0,62}[^.]{1}@(?!.*\.\.)[^._%+-]{1}[A-Za-z0-9.-]{0,252}\..*[^._%+-]{1}$'
	),
	
	CONSTRAINT exercicio2_t_user_ck_age CHECK(age BETWEEN 14 AND 120),
	CONSTRAINT exercicio2_t_user_ck_password CHECK(
		password ~ '^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W)[^ ]{8,}.*$'
		AND 
		password != email
	),
	CONSTRAINT exercicio2_t_user_ck_phonenumber CHECK(
		(
			LENGTH(phonenumber) = 11
			AND
			phonenumber ~ '^[1-9]{2}9[0-9]{8}$'
		)
		OR
		(
			LENGTH(phonenumber) = 10
			AND
			phonenumber ~ '^[1-9]{2}[2-5]{1}[0-9]{7}$'
		)
		
	),
	CONSTRAINT exercicio2_t_user_ck_user_status CHECK(
		user_status IN ('ativo', 'inativo', 'bloqueado', 'pendente')
	),
	CONSTRAINT exercicio2_t_user_ck_access_tier CHECK(access_tier BETWEEN 1 AND 5)
);

--Function's session
CREATE OR REPLACE FUNCTION is_valid_cpf(p_cpf VARCHAR(14)) 
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
        sum := sum + (SUBSTRING(p_cpf FROM v_i FOR 1)::INT * (11 - i));
    END LOOP;
    
    v_digit := 11 - (sum % 11);
    IF v_digit >= 10 THEN
        v_digit := 0;
    END IF;

    -- Verifica se o primeiro dígito calculado bate com o do CPF informado
    IF v_digit != SUBSTRING(p_cpf FROM 10 FOR 1)::INT THEN
        RETURN FALSE;
    END IF;

    -- Cálculo de validação do segundo dígito verificador
    sum := 0;
    FOR v_i IN 1..10 LOOP
        sum := sum + (SUBSTRING(p_cpf FROM v_i FOR 1)::INT * (12 - i));
    END LOOP;
    
    v_digit := 11 - (sum % 11);
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


-- Test's session
	--name test session
		--SELECT 'Augusto' ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$';

	--email test session
		--SELECT '0o0testes@gmail.com' ~ '^[^.]{1}(?!.*\.\.)[A-Za-z0-9._%+-]{0,62}[^.]{1}@(?!.*\.\.)[^._%+-]{1}[A-Za-z0-9.-]{0,252}\..*[^._%+-]{1}$';

	--password test session
		--SELECT 'seNhaaa 9@' ~ '^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W)[^ ]{8,}.*$';
	
	--phonenumber test session
		--SELECT '1159285221' ~ '^[1-9]{2}[2-5]{1}[0-9]{7}$';
		--SELECT '11992852214' ~ '^[1-9]{2}9[0-9]{8}$';

	