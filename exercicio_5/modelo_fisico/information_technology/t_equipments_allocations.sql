CREATE TABLE IF NOT EXISTS it.t_equipments_allocations(
    id                  INT                 NOT NULL,
    allocation_start    TIMESTAMPTZ         NOT NULL,
    allocation_end      TIMESTAMPTZ         NOT NULL,
    reason              VARCHAR(200)        NOT NULL,
    status              equipalloc_status   NOT NULL,
    created_at          TIMESTAMPTZ         NOT NULL,

    --FK
    employee_id         INT                 NOT NULL,
    equipment_id        INT                 NOT NULL
);