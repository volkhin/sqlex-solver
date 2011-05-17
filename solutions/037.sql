WITH t1 AS (SELECT class, name
FROM ships
UNION ALL
SELECT outcomes.ship, outcomes.ship
FROM outcomes, classes
WHERE outcomes.ship = classes.class
)
,
t2 AS (
SELECT * FROM t1
GROUP BY class, name
)

SELECT class 
FROM t2
GROUP BY class
HAVING count(1) = 1
