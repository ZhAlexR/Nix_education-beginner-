SELECT SUM(total), COUNT(*)
	FROM orders
	INNER JOIN order_status
	ON order_status.order_status_id = orders.order_status_order_status_id
	WHERE order_status.status_name = 'Finished';
	
SELECT * FROM orders WHERE total = 
	(SELECT MAX(total)
		FROM orders
		INNER JOIN order_status
		ON order_status.order_status_id = orders.order_status_order_status_id
		WHERE order_status.status_name = 'Finished' AND orders.created_at 
		BETWEEN '01-07-2020' AND '30-09-2020');
