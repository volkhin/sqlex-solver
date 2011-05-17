SELECT DISTINCT maker FROM product WHERE product.type = 'printer'
INTERSECT
SELECT maker FROM product WHERE model in (
SELECT model FROM pc WHERE ram = (SELECT MIN(ram) FROM pc) AND speed = (SELECT MAX(speed) FROM pc WHERE ram = (SELECT MIN(ram) FROM pc))
) ORDER BY maker
