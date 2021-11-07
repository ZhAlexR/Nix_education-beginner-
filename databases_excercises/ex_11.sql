CREATE TABLE users (
		user_id SERIAL PRIMARY KEY,
		email VARCHAR(255), 
		password VARCHAR(255),
		first_name VARCHAR(255),
		last_name VARCHAR(255), 
		middle_name VARCHAR(255),
		is_staff SMALLINT,
		country VARCHAR(255),
		city VARCHAR(255), 
		address TEXT);

COPY users FROM '/home/zhukov_oleksandr/programming/SQL/sql_input_files/users.csv' DELIMITER ',' CSV HEADER;


CREATE TABLE categories (
		category_id SERIAL PRIMARY KEY,
		category_title VARCHAR(255),
		category_description TEXT);
		
COPY users FROM '/home/zhukov_oleksandr/programming/SQL/sql_input_files/users.csv' DELIMITER ',' CSV HEADER;
		

CREATE TABLE products (
		product_id SERIAL PRIMARY KEY,
		product_title VARCHAR(255),
		product_description TEXT,
		in_stock INT,
		price FLOAT,
		slug VARCHAR(255),
		category_id INT REFERENCES categories (category_id) ON DELETE CASCADE);

COPY products FROM '/home/zhukov_oleksandr/programming/SQL/sql_input_files/products.csv' DELIMITER ',' CSV HEADER;

CREATE TABLE carts (
		cart_id SERIAL PRIMARY KEY,
		users_user_id INT REFERENCES users(user_id) ON DELETE CASCADE),
		subtotal DECIMAL,
		total DECIMAL,
		timestamp TIMESTAMP(2));
		
COPY carts FROM '/home/zhukov_oleksandr/programming/SQL/sql_input_files/carts.csv' DELIMITER ',' HEADER CSV;

CREATE TABLE cart_product (
		carts_cart_id INT REFERENCES carts(cart_id) ON DELETE CASCADE,
		products_product_id INT REFERENCES products(product_id));
		
COPY products FROM '/home/zhukov_oleksandr/programming/SQL/sql_input_files/products.csv' DELIMITER ',' CSV HEADER;
		
		
CREATE TABLE order_status (
		order_status_id SERIAL PRIMARY KEY,
		status_name VARCHAR(255));

COPY order_status FROM '/home/zhukov_oleksandr/programming/SQL/sql_input_files/order_statuses.csv' DELIMITER ',' HEADER CSV;

CREATE TABLE orders (
		order_id SERIAL PRIMARY KEY,
		order_status_order_status_id INT REFERENCES order_status(order_status_id) ON DELETE CASCADE,
		shipping_total DECIMAL,
		total DECIMAL,
		created_at TIMESTAMP(2),
		upddated_at TIMESTAMP(2));
		
COPY orders FROM '/home/zhukov_oleksandr/programming/SQL/sql_input_files/orders.csv' DELIMITER ',' CSV HEADER;
