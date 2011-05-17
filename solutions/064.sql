SELECT point, date, 'inc' type, SUM(inc) sum
FROM income i
WHERE NOT EXISTS (SELECT 1 FROM outcome o WHERE i.point = o.point AND i.date = o.date)
GROUP BY point, date

UNION

SELECT point, date, 'out' type, SUM(out) sum
FROM outcome o
WHERE NOT EXISTS (SELECT 1 FROM income i WHERE i.point = o.point AND i.date = o.date)
GROUP BY point, date
