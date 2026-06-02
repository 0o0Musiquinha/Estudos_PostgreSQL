BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(1); --Quantidade de testesa a serem realizados

SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_corporative_access(
            access_period
        )
        VALUES (
            '[2026-06-01 17:00:00-03, 2026-06-01 09:00:00-03)'
        );
    $$,
    '23514',
    'new row for relation "t_corporative_access" violates check constraint "exercicio_5_it_t_corporative_access_ck_access_period"'
);

SELECT * FROM finish();

ROLLBACK;