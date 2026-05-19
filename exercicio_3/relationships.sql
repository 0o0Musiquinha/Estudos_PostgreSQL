--categories 1,1..1,N products
ALTER TABLE exercicio3.t_products	
ADD CONSTRAINT exercicio3_t_products_fk_categorie_id
FOREIGN KEY (categorie_id) REFERENCES exercicio3.t_categories (id);

--users 1,1...0,n
ALTER TABLE exercicio3.t_orders	
ADD CONSTRAINT exercicio3_t_orders_fk_user_id
FOREIGN KEY (user_id) REFERENCES exercicio3.t_user (id);