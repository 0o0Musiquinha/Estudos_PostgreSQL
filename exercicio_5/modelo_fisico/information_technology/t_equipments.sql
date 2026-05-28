CREATE TABLE IF NOT EXISTS exercicio5_it.t_equipments(
    id               INT NOT NULL,
    patrimonial_id   VARCHAR(68)      NOT NULL, --<department_id>-<YEAR(aquisition_date)>-<model>-<0-9>
    serial_number    VARCHAR(17)      NOT NULL, -- AB2026-CD-10001
    model            VARCHAR(60)      NOT NULL,
    aquisition_date  TIMESTAMPTZ      NOT NULL,
    aquisition_price  DECIMAL(8,2)     NOT NULL,
    status           exercicio5_it.equipment_status NOT NULL,
    created_at       TIMESTAMPTZ      NOT NULL,
    
    -- FK
    manufacturer_id SMALLINT         NOT NULL
);

ALTER TABLE exercicio5_it.t_equipments
    ADD CONSTRAINT exercicio5_it_t_equipments_pk
    PRIMARY KEY(id);

ALTER TABLE exercicio5_it.t_equipments
    ADD CONSTRAINT exercicio5_it_t_equipments_uq_patrimonial_id
    UNIQUE(patrimonial_id);

ALTER TABLE exercicio5_it.t_equipments
    ADD CONSTRAINT exercicio5_it_t_equipments_uq_serial_number
    UNIQUE(serial_number);

ALTER TABLE exercicio5_it.t_equipments
    ADD CONSTRAINT exercicio5_it_t_equipments_ck_model
    CHECK(
        model ~* '^[^ ]{1}(?!.*  )[^ ]{1}$'
    );

ALTER TABLE exercicio5_it.t_equipments
    ADD CONSTRAINT exercicio5_it_t_equipments_ck_aquisition_date
    CHECK(
        aquisition_date < CURRENT_TIMESTAMP(0)
    );

ALTER TABLE exercicio5_it.t_equipments
    ADD CONSTRAINT exercicio5_it_t_equipments_ck_aquisition_price
    CHECK(
        aquisition_price >= 0
    );

ALTER TABLE exercicio5_it.t_equipments
    ALTER COLUMN created_at
        SET DEFAULT CURRENT_TIMESTAMP(0);

--Relationships
    ALTER TABLE exercicio5_it.t_equipments
        ADD CONSTRAINT exercicio5_it_t_equipments_fk_manufacturer_id
        FOREIGN KEY(manufacturer_id)
            REFERENCES exercicio5_it.t_manufacturers(id);