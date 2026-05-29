BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(2); --Quantidade de testesa a serem realizados

SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_positions(
            name,
            description
        )
        VALUES (
            'Augusto Rodolfo de K4lheir0s',
            'teste dos testes testados pelos magos dos testes'
        );
    $$,
    '23514',
    'new row for relation "t_positions" violates check constraint "exercicio5_hr_t_positions_ck_name"'
);

SELECT throws_ok(
    $$
        INSERT INTO exercicio5_hr.t_positions(
            name,
            description
        )
        VALUES (
            'Augusto Rodolfo de Kalheiros',
            'teste dos testes testados pelos  magos dos testes'
        );
    $$,
    '23514',
    'new row for relation "t_positions" violates check constraint "exercicio5_hr_t_positions_ck_description"'
);
SELECT * FROM finish();

ROLLBACK;