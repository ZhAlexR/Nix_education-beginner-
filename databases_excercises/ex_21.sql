--1. Вывести продукты, которые ни разу не попадали в корзину.
SELECT product_title, cart_product.carts_cart_id FROM products
	LEFT JOIN cart_product
		ON cart_product.products_product_id = products.product_id
	WHERE cart_product.carts_cart_id IS NULL;



--2. Вывести все продукты, которые так и не попали ни в 1 заказ. (но в корзину попасть могли).
SELECT pr.product_title FROM products AS pr
	INNER JOIN cart_product AS cp
		ON cp.products_product_id = pr.product_id
	INNER JOIN carts
		ON carts.cart_id = cp.carts_cart_id
	LEFT JOIN orders
		ON orders.carts_cart_id = carts.cart_id
	WHERE orders.order_id IS NULL
UNION

SELECT pr.product_title FROM products AS pr
	LEFT JOIN cart_product AS cp
		ON cp.products_product_id = pr.product_id
	WHERE cp.carts_cart_id IS NULL;
	


--3. Вывести топ 10 продуктов, которые добавляли в корзины чаще всего.
SELECT product_title, COUNT(*) AS total_count FROM products AS p
	INNER JOIN cart_product AS cp
 		ON cp.products_product_id = p.product_id
	INNER JOIN carts AS c
 		ON c.cart_id = cp.carts_cart_id
 	GROUP BY product_title 
 	ORDER BY total_count DESC 
 	FETCH FIRST 10 ROW ONLY;
 	
 /* Проблема!!!
 	Данный запрос берет просто первые десять товаров
 	с самым большим total_count, что явлется совсем 
 	объективной оценкой количества вхождения товара в
 	корзину
 */


--4. Вывести топ 10 продуктов, которые не только добавляли в корзины, но и оформляли заказы чаще всего.
SELECT product_title, COUNT(*) AS total_count FROM products AS p
	INNER JOIN cart_product AS cp
 		ON cp.products_product_id = p.product_id
	INNER JOIN carts AS c
 		ON c.cart_id = cp.carts_cart_id
 	INNER JOIN orders
 		ON orders.carts_cart_id = c.cart_id
 	WHERE order_status_order_status_id  = 4
 	GROUP BY product_title 
 	ORDER BY total_count DESC 
 	FETCH FIRST 10 ROW ONLY;

--5. Вывести топ 5 юзеров, которые потратили больше всего денег (total в заказе).
/* Оказалось, что все записи в заказах уникальны и пришлось добавить ещё один заказ
	
	INSERT INTO carts (users_user_id, subtotal, total, timestamp)
	VALUES (486, 401.14, 401.14, NOW())
	RETURNING *;
	
	INSERT INTO cart_product (carts_cart_id, products_product_id)
	VALUES (1,1964);
	
	INSERT INTO orders 
	(carts_cart_id, order_status_order_status_id, shipping_total, total, created_at, upddated_at)
	VALUES(1, 4, 60, 461.14, NOW(), NOW())
	RETURNING *;
*/
--Список юзеров, которые потратили больше всего денег за один заказ
SELECT users.user_id, users.first_name, users.last_name, orders.total FROM users
	INNER JOIN carts
		ON carts.users_user_id = users.user_id
	INNER JOIN orders
		ON orders.carts_cart_id = carts.cart_id
	WHERE order_status_order_status_id  = 4
	ORDER BY orders.total DESC
	LIMIT 5;
--Список юзеров, которие потратили больше всего денег за всю историю покупок на сайте
SELECT users.user_id, users.first_name, users.last_name, SUM(orders.total) AS total_sum, COUNT(orders.total) FROM users
	INNER JOIN carts
		ON carts.users_user_id = users.user_id
	INNER JOIN orders
		ON orders.carts_cart_id = carts.cart_id
	WHERE orders.order_status_order_status_id  = 4
	GROUP BY users.user_id, users.first_name, users.last_name
	ORDER BY total_sum DESC
	LIMIT 5;
	
--6. Вывести топ 5 юзеров, которые сделали больше всего заказов (кол-во заказов).
SELECT users.user_id, users.first_name, users.last_name, COUNT(orders.total) AS total_count FROM users
	INNER JOIN carts
		ON carts.users_user_id = users.user_id
	INNER JOIN orders
		ON orders.carts_cart_id = carts.cart_id
	WHERE orders.order_status_order_status_id  = 4
	GROUP BY users.user_id, users.first_name, users.last_name
	ORDER BY total_count DESC
	LIMIT 5;
	
--7. Вывести топ 5 юзеров, которые создали корзины, но так и не сделали заказы.
/* Пришлось чуть изменить данные в некторых строках в колонке carts.users_user_id для большей наглядности
	UPDATE carts
	SET users_user_id = 1820
	WHERE users_user_id IN (1662, 1640, 1532, 1087)
	
	UPDATE carts
	SET users_user_id = 1820
	WHERE users_user_id IN (1662, 1640)
*/

SELECT users.user_id, users.first_name, users.last_name, COUNT(carts.users_user_id) AS no_orders FROM users
	INNER JOIN carts
		ON carts.users_user_id = users.user_id
	LEFT JOIN orders
		ON orders.carts_cart_id = carts.cart_id
	WHERE orders.order_id IS NULL
	GROUP BY users.user_id, users.first_name, users.last_name
	ORDER BY no_orders DESC
	LIMIT 5;










