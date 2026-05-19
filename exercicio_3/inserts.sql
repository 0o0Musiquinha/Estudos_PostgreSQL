--INSERTS Usúario
	INSERT INTO exercicio3.t_user
		(
			name,
			cpf,
			cnpj,
			email,
			age,
			password,
			phonenumber,
			user_status,
			access_tier
		)
		VALUES
			(
				'Hideo Kojima',
				'26731865060',
				'RJNUG3RE000107',
				'absolutcinema@gmail.com',
				19,
				'Cl3b3r@*',
				'1140028922',
				'ativo',
				5
				
			);
--INSERT Categoria
	INSERT INTO exercicio3.t_categories
		(
			name,
			status
		)
		VALUES
			(
				'limpeza',
				'ativa'
			);

--INSERT Produtos
	INSERT INTO exercicio3.t_products
		(
			name,
			description,
			price,
			stock,
			status,
			categorie_id
		)
		VALUES
			(
				'Vassoura',
				'Vassoura de cabo de aço inox, com cerdas de lã de ovelhas do leste asiatico.',
				19.90,
				50,
				'ativo',
				(SELECT id FROM exercicio3.t_categories WHERE name = 'limpeza' LIMIT 1)
			);
--Pedidos
	INSERT INTO exercicio3.t_orders
		(
			total_value,
			status,
			user_id
		)
		VALUES
			(
				19.90,
				'aguardando_pagamento',
				(SELECT id FROM exercicio3.t_user WHERE name = 'Hideo Kojima' LIMIT 1)
			);
--SELECTS
--SELECT exercicio3.product_code_generator();

--SELECT exercicio3.order_code_generator();