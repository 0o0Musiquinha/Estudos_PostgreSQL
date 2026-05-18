-- Caso necessário
DROP TABLE IF EXISTS exercicio3.t_user;
DROP TABLE IF EXISTS exercicio3.t_categories;
DROP TABLE IF EXISTS exercicio3.t_products ;
DROP TABLE IF EXISTS exercicio3.t_orders;

--Usúario
CREATE TABLE IF NOT EXISTS exercicio_3.t_user(
	LIKE exercicio2.user INCLUDING ALL
);

--Categorias
CREATE TABLE IF NOT EXISTS exercicio3.t_categories(
	id INT NOT NULL, --Demarquei como 'INT'pois, no meu entendimento, categoria abrange uma quantidade muito menor de dados que serão inseridos
	name VARCHAR(60) NOT NULL,
	status VARCHAR(9) NOT NULL DEFAULT 'ativa',
	creation_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP(0)
	
);

--Produtos
CREATE TABLE IF NOT EXISTS exercicio.t_products(
	id BIGINT NOT NULL,
	code VARCHAR(10) NOT NULL,
	name VARCHAR(120) NOT NULL,
	description VARCHAR(300) NOT NULL,
	price DECIMAL(6,2) NOT NULL, --Anotar sobre problemas do REAL e FLOAT
	stock INT NOT NULL,
	status VARCHAR() NOT NULL,
	creation_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP(0),
	categorie_id INT NOT NULL
	
);

--Pedidos
CREATE TABLE IF NOT EXISTS exercicio3.t_orders(
	id BIGINT NOT NULL,
	code NOT NULL,
	total_value DECIMAL(6,2) NOT NULL,
	status VARCHAR(20)NOT NULL,
	order_date DATE NOT NULL
	
);


