SELECT CAST ( AVG(numGuns+0.0) AS NUMERIC(10,2) )
FROM Classes
WHERE type = 'bb'
