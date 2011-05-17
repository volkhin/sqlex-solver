SELECT name
FROM ships
WHERE name LIKE 'R%'

UNION

SELECT ship
FROM outcomes
WHERE ship like 'R%'
