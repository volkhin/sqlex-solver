SELECT product.maker, AVG(laptop.screen)
FROM product, laptop
WHERE 	product.type = 'laptop' AND
	product.model = laptop.model
GROUP BY product.maker
