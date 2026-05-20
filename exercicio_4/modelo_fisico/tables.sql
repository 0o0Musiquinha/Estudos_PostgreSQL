CREATE EXTENSION IF NOT EXISTS btree_gist;
--Guardião
CREATE TABLE IF NOT EXISTS exercicio4.t_guardian(
	id BIGINT NOT NULL,
	name VARCHAR(120) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	email VARCHAR(254) NOT NULL,
	phonenumber VARCHAR(11) NOT NULL,
	status GUARDIAN_STATUS NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
);

CREATE TABLE IF NOT EXISTS exercicio4.t_species(
	id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
	
);

CREATE TABLE IF NOT EXISTS exercicio4.t_specialty(
	id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
);

CREATE TABLE IF NOT EXISTS exercicio4.t_race(
	id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

	--FKs
	species_id INT NOT NULL

);

CREATE TABLE IF NOT EXISTS exercicio4.t_veterinarian(
	id BIGINT NOT NULL,
	name VARCHAR(120) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	crmv VARCHAR(9) NOT NULL,
	admission_date DATE NOT NULL,
	status VETERINARIAN_STATUS NOT NULL DEFAULT 'ativo',
	created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

	--FKs
	specialty_id INT NOT NULL

);

CREATE TABLE IF NOT EXISTS exercicio4.t_animal(
	id BIGINT NOT NULL,
	name VARCHAR(120) NOT NULL,
	birthday DATE NOT NULL,
	weight DECIMAL(5,2) NOT NULL,
	sex ANIMAL_SEX NOT NULL,
	status ANIMAL_STATUS NOT NULL DEFAULT 'ativo',
	created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

	--FKs
	race_id INT,
	species_id INT,
	guardian_id BIGINT NOT NULL
	
);

CREATE TABLE IF NOT EXISTS exercicio4.t_appointment(
	id BIGINT NOT NULL,
	duration TSTZRANGE NOT NULL,
	diagnosis VARCHAR(200) NOT NULL,
	price DECIMAL(7,2) NOT NULL,
	status APPOINTMENT_STATUS  NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

	--FKs
	animal_id BIGINT NOT NULL,
	veterinarian_id BIGINT NOT NULL,

	--EXCLUDE
	CONSTRAINT exercicio4_t_appointment_ex_duration_c_animal_id EXCLUDE USING gist(
		animal_id WITH =,
		duration WITH &&
	),
	CONSTRAINT exercicio4_t_appointment_ex_duration_c_veterinatian_id EXCLUDE USING gist(
		veterinarian_id WITH =,
		duration WITH &&
	)
);