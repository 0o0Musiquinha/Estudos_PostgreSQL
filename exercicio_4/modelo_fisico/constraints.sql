--guardian
	--CONSTRAINTS
		ALTER TABLE exercicio4.t_guardian 
			ADD CONSTRAINT exercicio4_t_guardian_pk 
			PRIMARY KEY(id);
		
		ALTER TABLE exercicio4.t_guardian 
			ADD CONSTRAINT exercicio4_t_guardian_uq_email 
			UNIQUE(email);

		ALTER TABLE exercicio4.t_guardian 
			ADD CONSTRAINT exercicio4_t_guardian_uq_cpf 
			UNIQUE(cpf);
	
	--CHECK CONSTRAINTS
		ALTER TABLE exercicio4.t_guardian 
			ADD CONSTRAINT exercicio4_t_guardian_ck_name 
			CHECK(
				name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
			);

		ALTER TABLE exercicio4.t_guardian 
			ADD CONSTRAINT exercicio4_t_guardian_ck_cpf 
			CHECK(exercicio4.is_valid_cpf(cpf));

		ALTER TABLE exercicio4.t_guardian 
			ADD CONSTRAINT exercicio4_t_guardian_ck_email 
			CHECK(
				email ~ '^[^.]{1}(?!.*\.\.)[A-Za-z0-9._%+-]{0,62}[^.]{1}@(?!.*\.\.)[^._%+-]{1}[A-Za-z0-9.-]{0,252}\..*[^._%+-]{1}$'
			);

		ALTER TABLE exercicio4.t_guardian 
			ADD CONSTRAINT exercicio4_t_guardian_ck_phonenumber 
			CHECK(
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
			);

	--Exemplo de Nome extenso para especialidade (48 CHARS)
	--SELECT LENGTH('Endocrinologia e Metabologia em Pequenos Animais');

--species
	--CONSTRAINTS
		ALTER TABLE exercicio4.t_species  
			ADD CONSTRAINT exercicio4_t_species_pk 
			PRIMARY KEY(id);

		ALTER TABLE exercicio4.t_species 
			ADD CONSTRAINT exercicio4_t_species_uq_name 
			UNIQUE(name);
	
--specialty
	--CONSTRAINTS
		ALTER TABLE exercicio4.t_specialty 
			ADD CONSTRAINT exercicio4_t_specialty_pk 
			PRIMARY KEY(id);

		ALTER TABLE exercicio4.t_specialty 
			ADD CONSTRAINT exercicio4_t_spceialty_uq_name 
			UNIQUE(name);

	--CHECK CONSTRAINTS
		ALTER TABLE exercicio4.t_specialty 
			ADD CONSTRAINT exercicio4_t_spceialty_ck_name 
			CHECK(
				LENGTH(name) > 8 AND LENGTH(name) < 49
			);
	
--race
	--CONSTRAINTS
		ALTER TABLE exercicio4.t_race 
			ADD CONSTRAINT exercicio4_t_race_pk 
			PRIMARY KEY(id);
	
--veterianrian
	--CONSTRAINTS
		ALTER TABLE exercicio4.t_veterinarian 
			ADD CONSTRAINT exercicio4_t_veterinarian_pk 
			PRIMARY KEY(id);
		ALTER TABLE exercicio4.t_veterinarian 
			ADD CONSTRAINT exercicio4_t_veterinarian_uq_cpf 
			UNIQUE(cpf);
		ALTER TABLE exercicio4.t_veterinarian 
			ADD CONSTRAINT exercicio4_t_veterinarian_uq_crmv 
			UNIQUE(crmv);

	--CHECK CONSTRAINTS
		ALTER TABLE exercicio4.t_veterinarian 
			ADD CONSTRAINT exercicio4_t_veterinarian_ck_cpf 
			CHECK(exercicio4.is_valid_cpf(cpf));
		ALTER TABLE exercicio4.t_veterinarian 
			ADD CONSTRAINT exercicio4_t_veterinarian_ck_crmv 
			CHECK(
				crmv ~ '^[A-Z]{2} [0-9]{4,6}$' -- UF Número -> XX XXXXX
			);

		ALTER TABLE exercicio4.t_veterinarian 
			ADD CONSTRAINT exercicio4_t_veterinarian_ck_admission_date 
			CHECK(
				admission_date < CURRENT_TIME(0)
			);
	
	
--animal
	--CONSTRAINTS
		ALTER TABLE exercicio4.t_animal 
			ADD CONSTRAINT exercicio4_t_animal_pk 
			PRIMARY KEY(id);
		
		--CHECK CONSTRAINTS
		ALTER TABLE exercicio4.t_animal 
			ADD CONSTRAINT exercicio4_t_animal_ck_weight 
			CHECK(
				weight > 0
			);
		ALTER TABLE exercicio4.t_animal 
			ADD CONSTRAINT exercicio4_t_animal__birthday 
			CHECK(
				birthday <= CURRENT_DATE
			);
--appointment
	--CONSTRAINTS
		ALTER TABLE exercicio4.t_appointment 
			ADD CONSTRAINT exercicio4_t_appointment_pk 
			PRIMARY KEY(id);
		
	--CHECK CONSTRAINTS
		ALTER TABLE exercicio4.t_appointment 
			ADD CONSTRAINT exercicio4_t_appointment_ck_price 
			CHECK(
				price >= 0
			);

		ALTER TABLE exercicio4.t_appointment 
			ADD CONSTRAINT exercicio4_t_appointment_ck_duration 
			CHECK(
				LOWER(duration) <= UPPER(duration)
			);

		ALTER TABLE exercicio4.t_appointment 
			ADD CONSTRAINT exercicio4_t_appointment_ck_race_id_c_species_id 
			CHECK(
				(animal_id != NULL AND species_id = NULL)
				OR
				(animal_id = NULL AND species_id != NULL)
			);
	