--PRIMARY KEYS
	ALTER TABLE exercicio4.t_race ADD CONSTRAINT exercicio4_t_race_fk_species_id FOREIGN KEY(species_id) REFERENCES exercicio4.t_species(id);
	
	ALTER TABLE exercicio4.t_animal ADD CONSTRAINT exercicio4_t_animal_fk_race_id FOREIGN KEY(race_id) REFERENCES exercicio4.t_race(id);
	ALTER TABLE exercicio4.t_animal ADD CONSTRAINT exercicio4_t_animal_fk_species_id FOREIGN KEY(species_id) REFERENCES exercicio4.t_species(id);
	ALTER TABLE exercicio4.t_animal ADD CONSTRAINT exercicio4_t_animal_fk_guardian_id FOREIGN KEY(guardian_id) REFERENCES exercicio4.t_guardian(id);
	
	ALTER TABLE exercicio4.t_veterinarian ADD CONSTRAINT exercicio4_t_veterinarian_fk_specialty_id FOREIGN KEY(specialty_id) REFERENCES exercicio4.t_specialty(id);

	ALTER TABLE exercicio4.t_appointment ADD CONSTRAINT exercicio4_t_appointment_fk_animal_id FOREIGN KEY(animal_id) REFERENCES exercicio4.t_animal(id);
	ALTER TABLE exercicio4.t_appointment ADD CONSTRAINT exercicio4_t_appointment_fk_veterinarian_id FOREIGN KEY(veterinarian_id) REFERENCES exercicio4.t_veterinarian(id);