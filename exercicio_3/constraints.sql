--Usúario
	--DROP CONSTRAINTS existentes
		--CONSTRAINTS
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS t_user_pkey;
		
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS t_user_cnpj_key;
		
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS t_user_cpf_key;
		
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS t_user_email_key;

		--CHECK CONSTRAINTS
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS exercicio2_t_user_ck_acess_tier;
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS exercicio2_t_user_ck_age;
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS exercicio2_t_user_ck_cnpj;
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS exercicio2_t_user_ck_cpf;
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS exercicio2_t_user_ck_email;
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS exercicio2_t_user_ck_name;
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS exercicio2_t_user_ck_password;
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS exercicio2_t_user_ck_phonenumber;
		ALTER TABLE exercicio3.t_user 
		DROP CONSTRAINT IF EXISTS exercicio2_t_user_ck_user_status;


	--ADD CONSTRAINTS
		--CONSTRAINTS
			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_pk 
			PRIMARY KEY(id);

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_uq_email 
			UNIQUE(email);

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_uq_cpf 
			UNIQUE(cpf);

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_uq_cnpj 
			UNIQUE(cnpj);

		--CHECK CONSTRAINTS
			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_ck_name 
			CHECK(
				name ~* '^[^ ]{1}(?!.*  )[a-záàâãèéêìíîóòôôúùû ]{1,}[^ ]{1}$'
			);

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_ck_cpf 
			CHECK(exercicio3.is_valid_cpf(cpf));

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_ck_cnpj 
			CHECK(exercicio3.is_valid_cnpj_alpha(cnpj));

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_ck_email 
			CHECK(
				email ~ '^[^.]{1}(?!.*\.\.)[A-Za-z0-9._%+-]{0,62}[^.]{1}@(?!.*\.\.)[^._%+-]{1}[A-Za-z0-9.-]{0,252}\..*[^._%+-]{1}$'
			);

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_ck_password 
			CHECK(
				password ~ '^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\W)[^ ]{8,}.*$'
				AND 
				password != email
			);

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_ck_phonenumber 
			CHECK(
				(
					LENGTH(phonenumber) = 11
					AND
					phonenumber ~ '^[1-9]{2}9[0-9]{8}$'
				)
				OR
				(
					LENGTH(phonenumber) = 10
					AND
					phonenumber ~ '^[1-9]{2}[2-5]{1}[0-9]{7}$'
				)
			);

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_ck_age 
			CHECK(age BETWEEN 14 AND 120);

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_ck_user_status 
			CHECK(
				user_status IN ('ativo', 'inativo', 'bloqueado', 'pendente')
			);

			ALTER TABLE exercicio3.t_user 
			ADD CONSTRAINT exercicio3_t_user_ck_acess_tier 
			CHECK(access_tier BETWEEN 1 AND 5);

--Categorias
	--CONSTRAINTS
		ALTER TABLE exercicio3.t_categories 
		ADD CONSTRAINT exercicio3_t_categories_pk 
		PRIMARY KEY(id);

		ALTER TABLE exercicio3.t_categories
		ADD CONSTRAINT exercicio3_t_categories_uq_name 
		UNIQUE(name);

	--CHECK CONSTRAINTS
		ALTER TABLE exercicio3.t_categories 
		ADD CONSTRAINT exercicio3_t_categories_ck_name 
		CHECK(
			LENGTH(exercicio3.t_categories.name) >= 4
		);
		
		ALTER TABLE exercicio3.t_categories 
		ADD CONSTRAINT exercicio3_t_categories_ck_status 
		CHECK(
			exercicio3.t_categories.status IN ('ativa', 'inativa', 'bloqueada', 'arquivada')
		);

--Produtos
	--CONSTRAINTS
		ALTER TABLE exercicio3.t_products 
		ADD CONSTRAINT exercicio3_t_products_uq_code 
		UNIQUE(code);

	--CHECK CONSTRAINTS
		ALTER TABLE exercicio3.t_products 
		ADD CONSTRAINT exercicio3_t_products_ck_price 
		CHECK(
			exercicio3.t_products.price > 0
		);

		ALTER TABLE exercicio3.t_products 
		ADD CONSTRAINT exercicio3_t_products_ck_stock 
		CHECK(
			exercicio3.t_products.stock >= 0
		);

		ALTER TABLE exercicio3.t_products 
		ADD CONSTRAINT exercicio3_t_products_ck_status 
		CHECK(
			exercicio3.t_products.status IN ('ativo',  'indisponivel', 'promoção', 'esgotado', 'cancelado')
		);
	
--Pedidos
	--CONSTRAINTS
		ALTER TABLE exercicio3.t_orders 
		ADD CONSTRAINT exercicio3_t_orders_pk 
		PRIMARY KEY(id);

		ALTER TABLE exercicio3.t_orders 
		ADD CONSTRAINT exercicio3_t_orders_uq_code 
		UNIQUE(code);

	--CHECK CONSTRAINTS
		ALTER TABLE exercicio3.t_orders 
		ADD CONSTRAINT exercicio3_t_orders_ck_total_value 
		CHECK(
			exercicio3.t_orders.total_value >= 0
		);

		ALTER TABLE exercicio3.t_orders 
		ADD CONSTRAINT exercicio3_t_orders_ck_status 
		CHECK(
			exercicio3.t_orders.status IN (
				'aguardando_pagamento',
				'pago', 
				'em_separação', 
				'enviado', 
				'entregue', 
				'cancelado', 
				'devolvido'
			)
		);
