SELECT name
FROM ships
WHERE name LIKE '% % %'

UNION


SELECT ship
FROM outcomes
WHERE ship LIKE '% % %'
