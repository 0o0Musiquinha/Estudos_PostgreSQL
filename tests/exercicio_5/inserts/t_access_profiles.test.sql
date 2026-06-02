BEGIN;

SET search_path TO extension_pgtap;
SELECT plan(2); --Quantidade de testesa a serem realizados

SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_access_profiles(
            name,
            access_level,
            description,
            status
        )
        VALUES (
            'Acesso  administrativo',
            2,
            'Acesso mais bolado das galaxias',
            'ativo'
        );
    $$,
    '23514',
    'new row for relation "t_access_profiles" violates check constraint "exercicio5_it_t_access_profiles_ck_name"'
);

SELECT throws_ok(
    $$
        INSERT INTO exercicio5_it.t_access_profiles(
            name,
            access_level,
            description,
            status
        )
        VALUES (
            'Acesso Restrito',
            1,
            'Acesso restrito mais r3str1to do que tudo p0ssivel\@',
            'inativo'
        );
    $$,
    '23514',
    'new row for relation "t_access_profiles" violates check constraint "exercicio5_it_t_access_profiles_ck_description"'
);
SELECT * FROM finish();

ROLLBACK;