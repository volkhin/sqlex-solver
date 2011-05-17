SELECT classes.class
FROM classes, outcomes
WHERE result = 'sunk'
AND classes.class = outcomes.ship
 
UNION SELECT class
FROM outcomes, ships
WHERE outcomes.ship = ships.name
AND result = 'sunk'
