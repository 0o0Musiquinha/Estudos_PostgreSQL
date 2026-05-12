CREATE SCHEMA IF NOT EXISTS exercicio1;

CREATE TABLE IF NOT EXISTS exercicio1.t_user(
	id BIGINT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(120) NOT NULL,
	email VARCHAR(254) NOT NULL,
	password VARCHAR(128) NOT NULL
);

ALTER TABLE exercicio1.t_user
ADD CONSTRAINT exercicio1_t_user_pk PRIMARY KEY(id);

ALTER TABLE exercicio1.t_user
ADD CONSTRAINT exercicio1_t_user_uq_email UNIQUE(email);

ALTER SEQUENCE exercicio1.t_user_id_seq
RENAME TO exercicio1_t_user_seq_id;
