--Caso necessário
	--DROP SEQUENCE exercicio4_t_guardian_id_seq;
	--DROP SEQUENCE exercicio4_t_species_id_seq;
	--DROP SEQUENCE exercicio4_t_specialty_id_seq;
	--DROP SEQUENCE exercicio4_t_race_id_seq;
	--DROP SEQUENCE exercicio4_t_veterinarian_id_seq;
	--DROP SEQUENCE exercicio4_t_animal_id_seq;
	--DROP SEQUENCE exercicio4_t_appointment_id_seq;

--Usúario
CREATE SEQUENCE IF NOT EXISTS exercicio4.exercicio4_t_guardian_id_seq
	AS INT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio4.t_guardian.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio4.t_guardian ALTER COLUMN id SET DEFAULT nextval('exercicio4.exercicio4_t_guardian_id_seq');
	
--Categorias
CREATE SEQUENCE IF NOT EXISTS exercicio4.exercicio4_t_species_id_seq
	AS INT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio4.t_species.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio4.t_species ALTER COLUMN id SET DEFAULT nextval('exercicio4.exercicio4_t_species_id_seq');

--Produtos 
CREATE SEQUENCE IF NOT EXISTS exercicio4.exercicio4_t_race_id_seq
	AS BIGINT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio4.t_race.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio4.t_race ALTER COLUMN id SET DEFAULT nextval('exercicio4.exercicio4_t_race_id_seq');

--Pedidos
CREATE SEQUENCE IF NOT EXISTS exercicio4.exercicio4_t_race_id_seq
	AS BIGINT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio4.t_race.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio4.t_race ALTER COLUMN id SET DEFAULT nextval('exercicio4.exercicio4_t_race_id_seq');

CREATE SEQUENCE IF NOT EXISTS exercicio4.exercicio4_t_veterinarian_id_seq
	AS BIGINT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio4.t_veterinarian.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio4.t_veterinarian ALTER COLUMN id SET DEFAULT nextval('exercicio4.exercicio4_t_veterinarian_id_seq');

CREATE SEQUENCE IF NOT EXISTS exercicio4.exercicio4_t_animal_id_seq
	AS BIGINT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio4.t_animal.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio4.t_animal ALTER COLUMN id SET DEFAULT nextval('exercicio4.exercicio4_t_animal_id_seq');

CREATE SEQUENCE IF NOT EXISTS exercicio4.exercicio4_t_appointment_id_seq
	AS BIGINT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio4.t_appointment.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio4.t_appointment ALTER COLUMN id SET DEFAULT nextval('exercicio4.exercicio4_t_appointment_id_seq');