BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(1); --Quantidade de testesa a serem realizados

SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_manufacturers(
            name
        )
        VALUES (
            'Int3l'
        );
    $$,
    '23514',
    'new row for relation "t_manufacturers" violates check constraint "exercicio5_it_t_manufacturers_ck_name"'
);

SELECT * FROM finish();

ROLLBACK;