SELECT product_title, COUNT(*) AS total FROM products GROUP BY product_title ORDER BY total DESC;

SELECT category_title, COUNT(product_title) FROM categories
	INNER JOIN products
	ON products.category_id = categories.category_id
	GROUP BY(category_title) ORDER BY COUNT(product_title) DESC;

