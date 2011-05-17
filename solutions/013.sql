SELECT AVG(speed)
FROM pc
WHERE model IN (
 SELECT model FROM product WHERE (type = 'pc') AND (maker = 'A')
)
