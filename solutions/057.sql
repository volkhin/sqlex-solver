WITH out AS
(
 SELECT DISTINCT ship FROM outcomes WHERE result = 'sunk'
),
 t1 AS (SELECT DISTINCT c.class,
(SELECT DISTINCT COUNT(s.name) FROM ships s WHERE s.class = c.class)
+
(SELECT DISTINCT COUNT(o.ship) FROM out o WHERE o.ship = c.class AND o.ship NOT IN (SELECT name FROM ships)) ships_qty,

(SELECT DISTINCT COUNT(o.ship)
FROM out o
WHERE o.ship = c.class OR
 (SELECT COUNT(s.name) FROM ships s WHERE s.name = o.ship AND s.class = c.class) > 0
) sunk

FROM classes c
)

SELECT class, sunk FROM t1
WHERE t1.ships_qty >= 3
AND t1.sunk >= 1
