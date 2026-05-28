CREATE TYPE exercicio5_it.accesspro_status
AS ENUM(
    'ativo',
    'inativo'
);

CREATE TYPE exercicio5_it.corpaccess_status
AS ENUM(
    'ativo',
    'bloqueado',
    'expirado',
    'revogado'
);

CREATE TYPE exercicio5_it.equipment_status
AS ENUM(
    'disponível',
    'alocado',
    'manutenção',
    'baixado'
);

CREATE TYPE exercicio5_it.equipalloc_status
AS ENUM(
    'ativa',
    'encerrada',
    'cancelada'
);