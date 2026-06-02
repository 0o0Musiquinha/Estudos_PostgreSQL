BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(2); --Quantidade de testesa a serem realizados

SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_equipments_allocations(
            allocation_period,
            reason
        )
        VALUES (
            '[2026-06-01 17:00:00-03, 2026-06-01 09:00:00-03)',
            'PORQUE EU QUIS CARA ME DA O EQUIPAMENTO, por favorzinho S2'
        );
    $$,
    '23514',
    'new row for relation "t_equipments_allocations" violates check constraint "exercicio_it_t_equipments_allocations_ck_allocation_period"'
);

SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_equipments_allocations(
            allocation_period,
            reason
        )
        VALUES (
            '[2026-06-01 09:00:00-03, 2026-06-01 17:00:00-03)',
            'NÂO QU#RO AUM#NT) TB NESSA budeg487*&'
        );
    $$,
    '23514',
    'new row for relation "t_equipments_allocations" violates check constraint "exercicio_it_t_equipments_allocations_ck_access_period"'
);

SELECT * FROM finish();

ROLLBACK;