CREATE TABLE IF NOT EXISTS hr.t_positions(
    id          SMALLINT            NOT NULL,
    name        VARCHAR(60)         NOT NULL,
    description VARCHAR(2000)       NOT NULL
    created_at  TIMESTAMPTZ         NOT NULL
);