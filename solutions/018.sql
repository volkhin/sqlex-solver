SELECT DISTINCT product.maker, (SELECT MIN(price) FROM printer WHERE color = 'y') as price1
FROM product
WHERE product.model IN (SELECT model FROM printer WHERE color = 'y' AND price = (SELECT MIN(price) FROM printer WHERE color = 'y'))
