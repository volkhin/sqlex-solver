WITH t1 AS (SELECT c1.class
FROM classes c1
WHERE c1.numguns >= ALL (
  SELECT  numguns 
  FROM classes c2 
  WHERE c1.displacement = c2.displacement
  AND (SELECT COUNT(1) FROM ships WHERE ships.class = c2.class) + (SELECT COUNT(1) FROM outcomes WHERE outcomes.ship = c2.class) > 0
)
)

SELECT name
FROM ships
WHERE class IN (SELECT * FROM t1)

UNION


SELECT ship
FROM outcomes
WHERE ship IN (SELECT * FROM t1)
