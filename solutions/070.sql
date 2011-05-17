WITH t1 AS (
 SELECT name, country
 FROM ships s, classes c
 WHERE s.class = c.class

UNION

 SELECT ship, country
 FROM outcomes o, classes c
 WHERE ship = class
),

t2 AS (
SELECT battle, country, COUNT(1) cnt
FROM outcomes o, t1 t
WHERE o.ship = t.name
GROUP BY battle, country)

SELECT DISTINCT battle FROM t2 WHERE cnt >= 3
