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
	
	--CONSTRAINT's session
	CONSTRAINT exercicio2_t_user_pk PRIMARY KEY(id),
	CONSTRAINT exercicio2_t_user_uq_email UNIQUE(email),

	--CHECK CONSTRAINT's session
	CONSTRAINT exercicio2_t_user_ck_age CHECK(age BETWEEN 14 AND 120),
	CONSTRAINT exercicio2_t_user_ck_user_status CHECK(
		user_status = 'ativo'
		OR user_status = 'inativo'
		OR user_status = 'bloqueado'
		OR user_status = 'pendente'
	),
	CONSTRAINT exercicio2_t_user_ck_acess_tier CHECK(acess_tier BETWEEN 1 AND 5),
);

GRANT UPDATE, INSERT (
	name, 
	email, 
	age, 
	password, 
	phonenumber, 
	user_status, 
	access_tier
) ON exercicio2.t_user;




CREATE FUNCTION exercicio2.exercicio2_t_user_ck_name_func (name VARCHAR(120)) 
RETURNS BOOLEAN 
AS $$
LANGUAGE plpgsql 
IMMUTABLE
BEGIN
	IF name ~* '[^a-záàâãèéêìíîóòôôúùû]' THEN
		RETURN FALSE;
	END IF;
	
	IF name NOT LIKE '[a-záàâãèéêìíîóòôôúùû]%' && name NOT LIKE '%[a-záàâãèéêìíîóòôôúùû]' THEN
		RETURN FALSE;
	END IF;

	IF LENGTH(name) < 3 THEN
		RETURN FALSE;
	END IF;

	RETURN TRUE;
END;
$$;

CREATE FUNCTION exercicio2.exercicio2_is_valid_email (email VARCHAR(254)) 
RETURNS BOOLEAN 
AS $$
LANGUAGE plpgsql 
IMMUTABLE
BEGIN
	RETURN(
		email ~ '^[^.]{0,1}[A-Za-z0-9._%+-]{0,62}[^.]{1}@[^.._%+-]{1}[A-Za-z0-9.-]{1,252}[^.._%+-]{1}\.[a-z]{2,}$'
	);
END;
$$;

SELECT '0o0musiquinha@gmail.com' ~ '^[^.]{0,1}[A-Za-z0-9._%+-]{0,62}[^.]{1}@[^.._%+-]{1}[A-Za-z0-9.-]{1,252}[^.._%+-]{1}\.[a-z]{2,}$';

SHOW timezone;