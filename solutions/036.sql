SELECT classes.class
FROM classes, ships
WHERE classes.class = ships.name

UNION

SELECT outcomes.ship
FROM outcomes, classes
WHERE outcomes.ship = classes.class

--SELECT DISTINCT ship
--FROM outcomes
