SELECT * FROM products WHERE price>50 AND price<=150 ORDER BY price;
SELECT * FROM products WHERE 50<price AND price<=150;

SELECT * FROM orders WHERE created_at > '01-10-2020';

SELECT * FROM orders WHERE created_at BETWEEN '01-01-2020' AND '01-06-2020';

SELECT product_id, product_title, product_description, in_stock, price, slug, category_title 
	FROM products
	INNER JOIN categories
	ON categories.category_id = products.category_id
	WHERE categories.category_title IN ('Category 7', 'Category 11', 'Category 18');
	
SELECT order_id, carts_cart_id, os.status_name, shipping_total, total, created_at, upddated_at FROM orders AS o  
	INNER JOIN order_status AS os
	ON os.order_status_id = o.order_status_order_status_id
	WHERE os.status_name = 'In progress' AND o.created_at = '31-12-2020';

SELECT cart_id, users_user_id, subtotal, subtotal,  carts.total, timestamp,  order_id 
	FROM carts
	LEFT JOIN orders
	ON orders.carts_cart_id = carts.cart_id
	WHERE order_id IS NULL;

