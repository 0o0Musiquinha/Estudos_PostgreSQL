CREATE TABLE IF NOT EXISTS exercicio5_hr.t_movements_history (
    id              INT                             NOT NULL,
    movement_type   exercicio5_hr.movement_type     NOT NULL,
    description     VARCHAR(2000)                   NOT NULL,
    created_at      TIMESTAMPTZ                     NOT NULL,
    
    --FK
    employee_id     INT                             NOT NULL,
    responsable_id  INT                             NOT NULL
);

ALTER TABLE exercicio5_hr.t_movements_history
    ADD CONSTRAINT exercicio5_hr_t_movements_history_pk
    PRIMARY KEY(id);

ALTER TABLE exercicio5_hr.t_movements_history
    ADD CONSTRAINT exercicio5_hr_t_movements_history_ck_description
    CHECK(
        description ~* '^\S(?!.*\s{2,})(?!.*,,)(?!.*--)(?!.*\.\.)(?!.*;;)(?!.*"")[a-zçáàâãèéêìíîóòôôúùû,.;!" ]+\S$'
    );

ALTER TABLE exercicio5_hr.t_movements_history
    ADD CONSTRAINT exercicio5_hr_t_movements_history_ck_employee_id_c_responsable_id
    CHECK(
        employee_id != responsable_id
    );

--Relationships
    ALTER TABLE exercicio5_hr.t_movements_history
        ADD CONSTRAINT exercicio5_hr_t_movements_history_fk_employee_id
        FOREIGN KEY(employee_id)
            REFERENCES exercicio5_hr.t_employees(id);
    ALTER TABLE exercicio5_hr.t_movements_history
        ADD CONSTRAINT exercicio5_hr_t_movements_history_fk_responsable_id
        FOREIGN KEY(responsable_id)
            REFERENCES exercicio5_hr.t_employees(id);
    