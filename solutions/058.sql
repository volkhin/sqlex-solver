SELECT p1.maker, p2.type,
CAST( 100.0 * 
(SELECT COUNT(1) FROM product p WHERE p.maker = p1.maker AND p.type=  p2.type)
 / 
(SELECT COUNT(1) FROM product p WHERE p.maker = p1.maker)
 AS NUMERIC(12, 2)) prc
FROM product p1, product p2
GROUP BY p1.maker, p2.type
