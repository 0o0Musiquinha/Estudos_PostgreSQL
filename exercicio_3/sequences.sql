--Usúario
CREATE SEQUENCE exercicio3_t_user_seq
INCREMENT BY 1
START WITH 1
START WITH 1 
OWNED BY exercicio3.t_user.id;

--Categorias
CREATE SEQUENCE exercicio3_t_categories_seq
INCREMENT BY 1
START WITH 1
START WITH 1 
OWNED BY exercicio3.t_categories.id;

--Produtos 
CREATE SEQUENCE exercicio3_t_products_seq
INCREMENT BY 1
START WITH 1
START WITH 1 
OWNED BY exercicio3.t_products.id;

--Pedidos
CREATE SEQUENCE exercicio3_t_orders_seq
INCREMENT BY 1
START WITH 1
START WITH 1 
OWNED BY exercicio3.t_orders.id;