CREATE TYPE it.accesspro_status
AS ENUM(
    'ativo',
    'inativo'
);

CREATE TYPE it.corpaccess_status
AS ENUM(
    'ativo',
    'bloqueado',
    'expirado',
    'revogado'
);

CREATE TYPE it.equipment_status
AS ENUM(
    'disponível',
    'alocado',
    'manutenção',
    'baixado'
);

CREATE TYPE it.equipalloc_status
AS ENUM(
    'ativa',
    'encerrada',
    'cancelada'
);