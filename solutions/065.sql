WITH pro AS (
SELECT maker, type
FROM product
GROUP BY maker, type
),
t1 AS (
SELECT 
(SELECT COUNT(1) FROM pro p2
WHERE p2.maker < p.maker OR
(p.maker = p2.maker AND p2.type = 'pc') OR
(p.maker = p2.maker AND p2.type = 'laptop' AND p.type != 'pc') OR
(p.maker = p2.maker AND p2.type = 'printer' AND p.type = 'printer')
)
cnt,
p.maker, p.type
FROM pro p
GROUP BY p.maker, p.type
)

SELECT cnt, 

CASE 
  WHEN t.cnt = 
    (SELECT MIN(CNT) 
      FROM t1 t2 
      WHERE t2.maker = t.maker) 
   THEN t.maker 
  ELSE '' 
END maker

, type
FROM t1 t
