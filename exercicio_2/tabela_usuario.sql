CREATE SCHEMA IF NOT EXISTS exercicio2;

CREATE TABLE IF NOT EXISTS exercicio2.t_user(
	id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(SEQUENCE NAME exercicio2_t_user_seq),
	name VARCHAR(120) NOT NULL,
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

	--CHECK CONSTRAINT session
	CONSTRAINT exercicio2_t_user_ck_name CHECK(
		name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
	),
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
		user_status = 'ativo'
		OR user_status = 'inativo'
		OR user_status = 'bloqueado'
		OR user_status = 'pendente'
	),
	CONSTRAINT exercicio2_t_user_ck_access_tier CHECK(access_tier BETWEEN 1 AND 5)
);

--Permission session
GRANT UPDATE, INSERT (
	name, 
	email, 
	age, 
	password, 
	phonenumber, 
	user_status, 
	access_tier
) ON exercicio2.t_user TO PUBLIC;

--Function's session
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

	