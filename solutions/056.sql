WITH t AS (SELECT c.class
FROM outcomes o, ships s, classes c
WHERE result = 'sunk'
AND o.ship = s.name
AND s.class = c.class

UNION ALL

SELECT c.class
FROM outcomes o, classes c
WHERE result = 'sunk'
AND o.ship = c.class
AND o.ship NOT IN (SELECT name FROM ships)
)

SELECT t1.class, (SELECT COUNT(1) FROM t t2 WHERE t1.class = t2.class )
FROM classes t1
