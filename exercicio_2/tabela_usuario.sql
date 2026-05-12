CREATE SCHEMA IF NOT EXISTS exercicio2;

CREATE TABLE IF NOT EXISTS exercicio2.t_user(
	id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY(SEQUENCE NAME exercicio2_t_user_seq),
	name VARCHAR(120) NOT NULL,
	email VARCHAR(254) NOT NULL,
	password VARCHAR(128) NOT NULL,

	--CONSTRAINT's session
	CONSTRAINT exercicio2_t_user_pk PRIMARY KEY(id),
	CONSTRAINT exercicio2_t_user_uq_email UNIQUE(email),

	--SEQUENCE's session

	
);