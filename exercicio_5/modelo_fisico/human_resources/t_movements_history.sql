CREATE TABLE IF NOT EXISTS hr.t_movements_history (
    id              INT             NOT NULL,
    movement_type   movement_type   NOT NULL,
    description     VARCHAR(2000)   NOT NULL,
    created_at      TIMESTAMPTZ     NOT NULL,
    
    --FK
    employee_id     INT             NOT NULL,
    responsable_id  INT             NOT NULL
);

ALTER TABLE hr.t_movements_history
    ADD CONSTRAINT hr_t_movements_history_pk
    PRIMARY KEY(id);