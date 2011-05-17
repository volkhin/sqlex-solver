SELECT maker, AVG(hd)
FROM product, pc
WHERE maker IN (SELECT DISTINCT maker FROM product WHERE type = 'printer') AND
	product.model = pc.model
GROUP BY maker
