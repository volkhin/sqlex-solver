SELECT maker
FROM product, pc
WHERE product.model = pc.model AND
	pc.speed >= 750
GROUP BY maker

INTERSECT


SELECT maker
FROM product, laptop
WHERE product.model = laptop.model AND
	laptop.speed >= 750
GROUP BY maker
