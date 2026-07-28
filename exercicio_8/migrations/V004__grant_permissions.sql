-- Dar permissão de USO do schema para todas as roles
GRANT USAGE ON SCHEMA exercicios_rbac TO administrador, gerente, operador;

---------------------------------------------------------
-- ADMINISTRADOR
---------------------------------------------------------
GRANT SELECT ON exercicios_rbac.t_users TO administrador;

GRANT UPDATE (user_login, email, senha_hash, user_role, user_status, ultimo_login) ON exercicios_rbac.t_users TO administrador;

GRANT INSERT (email) ON exercicios_rbac.t_users TO administrador;


---------------------------------------------------------
-- GERENTE
---------------------------------------------------------
GRANT SELECT (id_usuario, user_login, email, user_role, user_status, ultimo_login, data_criacao) ON exercicios_rbac.t_users TO gerente;

GRANT UPDATE (email, user_status) ON exercicios_rbac.t_users TO gerente;


---------------------------------------------------------
-- OPERADOR
---------------------------------------------------------
GRANT SELECT (id_usuario, user_login, email, user_status, ultimo_login) ON exercicios_rbac.t_users TO operador;

GRANT UPDATE (email) ON exercicios_rbac.t_users TO operador;