BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(4); --Quantidade de testesa a serem realizados

--Insert para servir de FK
INSERT INTO exercicio5_it.t_manufacturers (
    id,
    name
) 
OVERRIDING SYSTEM VALUE
VALUES(
    1,
    'intel'
);

--serial_number
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_equipments(
            patrimonial_id,
            serial_number,
            model,
            aquisition_date,
            aquisition_price,
            status,
            manufacturer_id
        )
        VALUES (
            'clovis45',
            'r4938enk#',
            'R7 7800x3d',
            '2026-05-25 15:30:00-03',
            120.30,
            'disponível',
            1
        );
    $$,
    '23514',
    'new row for relation "t_equipments" violates check constraint "exercicio5_it_t_equipments_ck_serial_number"'
);

--model
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_equipments(
            patrimonial_id,
            serial_number,
            model,
            aquisition_date,
            aquisition_price,
            status,
            manufacturer_id
        )
        VALUES (
            'pericles76',
            'r4938henky',
            'clovis do boguis  pingudo',
            '2023-03-25 15:30:00-03',
            10,
            'alocado',
            1
        );
    $$,
    '23514',
    'new row for relation "t_equipments" violates check constraint "exercicio5_it_t_equipments_ck_model"'
);

--aquisition_date
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_equipments(
            patrimonial_id,
            serial_number,
            model,
            aquisition_date,
            aquisition_price,
            status,
            manufacturer_id
        )
        VALUES (
            'almondega76',
            'r4938henky',
            'intel veryzen de montek',
            '2026-06-25 15:30:00-03',
            0,
            'disponível',
            1
        );
    $$,
    '23514',
    'new row for relation "t_equipments" violates check constraint "exercicio5_it_t_equipments_ck_aquisition_date"'
);

--aquisition_price
SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_equipments(
            patrimonial_id,
            serial_number,
            model,
            aquisition_date,
            aquisition_price,
            status,
            manufacturer_id
        )
        VALUES (
            'irineu89',
            'r4938henk89',
            'intel clovis beyond uno',
            '2026-03-25 15:30:00-03',
            -10.28,
            'disponível',
            1
        );
    $$,
    '23514',
    'new row for relation "t_equipments" violates check constraint "exercicio5_it_t_equipments_ck_aquisition_price"'
);

SELECT * FROM finish();

ROLLBACK;