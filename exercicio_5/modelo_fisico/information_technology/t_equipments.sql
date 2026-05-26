CREATE TABLE IF NOT EXISTS it.t_equipments(
    id               INT NOT NULL,
    patrimonial_id   VARCHAR(68)      NOT NULL,
    serial_number    VARCHAR(17)      NOT NULL,
    model            VARCHAR(60)      NOT NULL,
    aquisition_date  TIMESTAMPTZ      NOT NULL,
    aquisiton_price  DECIMAL(8,2)     NOT NULL,
    status           equipment_status NOT NULL,
    created_at       TIMESTAMPTZ      NOT NULL
    
    -- FK
    manufacturers_id SMALLINT         NOT NULL
);