WITH keys AS (
SELECT DISTINCT point, date FROM income
UNION
SELECT DISTINCT point, date FROM outcome
) 

SELECT point, date, 
(SELECT SUM(out) FROM outcome o WHERE o.point = k.point AND o.date = k.date), 
(SELECT SUM(inc) FROM income o WHERE o.point = k.point AND o.date = k.date)
FROM keys k
