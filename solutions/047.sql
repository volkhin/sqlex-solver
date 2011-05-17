WITH t1 AS (
SELECT maker, count(1) as cnt
FROM product
GROUP BY maker
)
,
t2 AS (
SELECT cnt, t1.maker, model
FROM product, t1
WHERE t1.maker = product.maker
)

SELECT COUNT(1), p1.maker, p1.model
from t2 p1, t2 p2
WHERE
p1.cnt < p2.cnt OR
(p1.cnt = p2.cnt AND p1.maker > p2.maker) OR
(p1.cnt = p2.cnt AND p1.maker = p2.maker AND p1.model >= p2.model)
GROUP BY p1.maker, p1.model
