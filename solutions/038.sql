SELECT country
FROM classes
WHERE type = 'bb'

INTERSECT

SELECT country
FROM classes
WHERE type = 'bc'
