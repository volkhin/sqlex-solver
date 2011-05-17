WITH t1 AS (SELECT ship, date
FROM outcomes, battles
WHERE outcomes.battle = battles.name
AND outcomes.result = 'damaged')
,
t2 AS (SELECT ship, date
FROM outcomes, battles
WHERE outcomes.battle = battles.name
)

SELECT DISTINCT t2.ship
FROM t1, t2
WHERE t1.ship = t2.ship AND t1.date < t2.date
