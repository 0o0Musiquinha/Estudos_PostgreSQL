CREATE TABLE IF NOT EXISTS it.t_equipments_allocations(
    id                  INT                 NOT NULL,
    allocation_period   TSTZRANGE           NOT NULL,
    reason              VARCHAR(200)        NOT NULL,
    status              equipalloc_status   NOT NULL,
    created_at          TIMESTAMPTZ         NOT NULL,

    --FK
    employee_id         INT                 NOT NULL,
    equipment_id        INT                 NOT NULL
);

ALTER TABLE it.t_equipments_allocations
    ADD CONSTRAINT it_t_equipments_allocations_pk
    PRIMARY KEY(id);

ALTER TABLE it.t_equipments_allocations
    ADD CONSTRAINT it_t_equipments_allocations_ck_allocation_duration
    CHECK(
        LOWER(allocation_period) < UPPER(allocation_period)
    );

ALTER TABLE it.t_equipments_allocations
    ADD CONSTRAINT it_t_equipments_allocations_ck_reason
    CHECK(
        name ~* '^[^ ]{1}(?!.*  )[0-9a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
    );

ALTER TABLE it.t_equipments_allocations
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);