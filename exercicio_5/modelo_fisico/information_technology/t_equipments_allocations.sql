CREATE TABLE IF NOT EXISTS exercicio5_it.t_equipments_allocations(
    id                  INT                 NOT NULL,
    allocation_period   TSTZRANGE           NOT NULL,
    reason              VARCHAR(200)        NOT NULL,
    status              exercicio5_it.equipalloc_status   NOT NULL,
    created_at          TIMESTAMPTZ         NOT NULL,

    --FK
    employee_id         INT                 NOT NULL,
    equipment_id        INT                 NOT NULL
);

ALTER TABLE exercicio5_it.t_equipments_allocations
    ADD CONSTRAINT exercicio5_it_t_equipments_allocations_pk
    PRIMARY KEY(id);

ALTER TABLE exercicio5_it.t_equipments_allocations
    ADD CONSTRAINT exercicio5_it_t_equipments_allocations_ck_allocation_duration
    CHECK(
        LOWER(allocation_period) < UPPER(allocation_period)
    );

ALTER TABLE exercicio5_it.t_equipments_allocations
    ADD CONSTRAINT exercicio5_t_corporative_access_ex_equipment_id_c_allocation_period
        EXCLUDE USING gist(
            equipment_id WITH =,
            allocation_period WITH &&
        ),

ALTER TABLE exercicio5_it.t_equipments_allocations
    ADD CONSTRAINT exercicio5_it_t_equipments_allocations_ck_reason
    CHECK(
        reason ~* '^[^ ]{1}(?!.*  )[0-9a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
    );

ALTER TABLE exercicio5_it.t_equipments_allocations
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);

--Relationships
    ALTER TABLE exercicio5_it.t_equipments_allocations
        ADD CONSTRAINT exercicio5_it_t_equipments_allocations_fk_equipment_id
        FOREIGN KEY(equipment_id)
            REFERENCES exercicio5_it.t_equipments(id);
    ALTER TABLE exercicio5_it.t_equipments_allocations
        ADD CONSTRAINT exercicio5_it_t_equipments_allocations_fk_employee_id
        FOREIGN KEY(employee_id)
            REFERENCES exercicio5_hr.t_employees(id);