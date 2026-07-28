DO $$
BEGIN
    IF NOT EXISTS (
		SELECT 1 
		FROM pg_roles 
		WHERE rolname = 'administrador'
	) THEN
        CREATE ROLE administrador WITH
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE
        NOINHERIT
        NOLOGIN
        NOREPLICATION
        NOBYPASSRLS
        CONNECTION LIMIT 0
        PASSWORD NULL
        VALID UNTIL 'infinity';
    END IF;

	IF NOT EXISTS (
		SELECT 1 
		FROM pg_roles 
		WHERE rolname = 'gerente'
	) THEN
        CREATE ROLE gerente
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE
        NOINHERIT
        NOLOGIN
        NOREPLICATION
        NOBYPASSRLS
        CONNECTION LIMIT 0
        PASSWORD NULL
        VALID UNTIL 'infinity';
    END IF;

	IF NOT EXISTS (
		SELECT 1 
		FROM pg_roles 
		WHERE rolname = 'operador'
	) THEN
        CREATE ROLE operador
        NOSUPERUSER
        NOCREATEDB
        NOCREATEROLE
        NOINHERIT
        NOLOGIN
        NOREPLICATION
        NOBYPASSRLS
        CONNECTION LIMIT 0
        PASSWORD NULL
        VALID UNTIL 'infinity';
    END IF;
END
$$;