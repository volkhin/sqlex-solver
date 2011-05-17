WITH prices(price) AS (
	SELECT price FROM product, pc WHERE pc.model = product.model AND maker = 'A' AND product.type = 'pc'
	UNION ALL
	SELECT price FROM product, laptop WHERE laptop.model = product.model AND maker = 'A' AND product.type = 'laptop'
) SELECT AVG(price) FROM prices
