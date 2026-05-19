-- Caso necessário
DROP TABLE IF EXISTS exercicio3.t_user;
DROP TABLE IF EXISTS exercicio3.t_categories;
DROP TABLE IF EXISTS exercicio3.t_products ;
DROP TABLE IF EXISTS exercicio3.t_orders;

--Usúario
CREATE TABLE IF NOT EXISTS exercicio3.t_user(
	LIKE exercicio2.t_user INCLUDING ALL
);

--Categorias
CREATE TABLE IF NOT EXISTS exercicio3.t_categories(
	id INT NOT NULL, --Demarquei como 'INT'pois, no meu entendimento, categoria abrange uma quantidade muito menor de dados que serão inseridos
	name VARCHAR(60) NOT NULL,
	status VARCHAR(9) NOT NULL,
	creation_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP(0)
	
);

--Produtos
CREATE TABLE IF NOT EXISTS exercicio3.t_products(
	id BIGINT NOT NULL,
	code VARCHAR(19) NOT NULL DEFAULT exercicio3.product_code_generator(),
	name VARCHAR(120) NOT NULL,
	description VARCHAR(300) NOT NULL,
	price DECIMAL(6,2) NOT NULL, --Anotar sobre problemas do REAL e FLOAT
	stock INT NOT NULL,
	status VARCHAR(12) NOT NULL,
	creation_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP(0),
	
	--FOREIGN KEYs
	categorie_id INT NOT NULL
	
);

--Pedidos
CREATE TABLE IF NOT EXISTS exercicio3.t_orders(
	id BIGINT NOT NULL,
	code VARCHAR(28) NOT NULL DEFAULT exercicio3.order_code_generator(),
	total_value DECIMAL(6,2) NOT NULL,
	status VARCHAR(20)NOT NULL,
	order_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

	--FOREIGN KEYs
	user_id BIGINT NOT NULL
	
);


