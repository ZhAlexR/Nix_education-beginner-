CREATE DOMAIN email AS VARCHAR(255)
	CHECK 
	(VALUE ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$');
	
CREATE TABLE potential_customers (
	id SERIAL PRIMARY KEY,
	email EMAIL,
	name VARCHAR(255),
	surname VARCHAR(255),
	second_name VARCHAR(255),
	city VARCHAR(255));
