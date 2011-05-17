SELECT ship, displacement, numGuns
FROM classes, ships, outcomes
WHERE battle = 'Guadalcanal' AND
outcomes.ship = ships.name AND
ships.class = classes.class

UNION


SELECT ship, displacement, numGuns
FROM classes, outcomes
WHERE battle = 'Guadalcanal' AND
outcomes.ship = classes.class


UNION

SELECT ship, null, null
FROM classes, outcomes
WHERE battle = 'Guadalcanal' AND
ship NOT IN (select name from ships UNION select class from classes)
