--Caso necessário
	--DROP SEQUENCE exercicio3_t_user_id_seq;
	--DROP SEQUENCE exercicio3_t_categories_id_seq;
	--DROP SEQUENCE exercicio3_t_products_id_seq;
	--DROP SEQUENCE exercicio3_t_orders_id_seq;

--Usúario
ALTER SEQUENCE IF EXISTS exercicio3.t_user_id_seq RENAME TO exercicio3_t_user_id_seq; --Alterando o nome por conta da copia feita da tabela user

--Categorias
CREATE SEQUENCE IF NOT EXISTS exercicio3.exercicio3_t_categories_id_seq
	AS INT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio3.t_categories.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio3.t_categories ALTER COLUMN id SET DEFAULT nextval('exercicio3.exercicio3_t_categories_id_seq');

--Produtos 
CREATE SEQUENCE IF NOT EXISTS exercicio3.exercicio3_t_products_id_seq
	AS BIGINT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio3.t_products.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio3.t_products ALTER COLUMN id SET DEFAULT nextval('exercicio3.exercicio3_t_products_id_seq');

--Pedidos
CREATE SEQUENCE IF NOT EXISTS exercicio3.exercicio3_t_orders_id_seq
	AS BIGINT
	START WITH 1 
	INCREMENT BY 1
	OWNED BY exercicio3.t_orders.id;

	--Define como padrão para a tabela
	ALTER TABLE exercicio3.t_orders ALTER COLUMN id SET DEFAULT nextval('exercicio3.exercicio3_t_orders_id_seq');