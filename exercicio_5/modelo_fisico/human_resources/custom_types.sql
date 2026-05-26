CREATE TYPE hr.department_status
AS ENUM(
    'ativo',
    'inativo'
);

CREATE TYPE hr.employee_status
AS ENUM(
    'ativo',
    'afastado',
    'desligado'
);

CREATE TYPE hr.movement_type
AS ENUM(
    'admissão',
    'promoção',
    'transferência',
    'afastamento',
    'desligamento'

);