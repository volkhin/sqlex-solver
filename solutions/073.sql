WITH t1 AS (SELECT c.country, o.battle
FROM classes c, outcomes o
WHERE c.class = o.ship
UNION
SELECT c.country, o.battle
FROM classes c, ships s, outcomes o
WHERE c.class = s.class AND s.name = o.ship
)

SELECT DISTINCT country, b.name
FROM classes c, battles b
   WHERE 
     (SELECT COUNT(1) 
      FROM t1 
      WHERE t1.country = c.country 
        AND t1.battle = b.name) = 0
