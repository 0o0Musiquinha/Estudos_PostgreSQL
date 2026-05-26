CREATE TABLE IF NOT EXISTS it.t_access_profiles (
    id          SMALLINT        NOT NULL,
    name        VARCHAR(30)     NOT NULL,
    access_level SMALLINT        NOT NULL,
    description VARCHAR(2000)   NOT NULL,
    status      accesspro_status NOT NULL,
    created_at  TIMESTAMPTZ     NOT NULL
);