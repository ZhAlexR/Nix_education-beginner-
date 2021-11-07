SELECT * FROM orders
	INNER JOIN order_status
	ON order_status.order_status_id = orders.order_status_order_status_id
	WHERE order_status.status_name IN ('Paid', 'Finished')
	ORDER BY order_status.status_name;
	
SELECT * FROM orders WHERE order_status_order_status_id IN (4,5);
