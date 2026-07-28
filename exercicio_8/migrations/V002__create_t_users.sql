CREATE TABLE IF NOT EXISTS exercicios_rbac.t_users(
	id_usuario 		INT 			NOT NULL,
	user_login 		VARCHAR(50) 	NOT NULL,
	email 			VARCHAR(100) 	NOT NULL,
	senha_hash 		VARCHAR(255) 	NOT NULL,
	user_role 		VARCHAR(20) 	NOT NULL,
	user_status 	VARCHAR(20) 	NOT NULL,
	ultimo_login 	TIMESTAMPTZ 	NOT NULL,
	data_criacao 	TIMESTAMPTZ		NOT NULL

);