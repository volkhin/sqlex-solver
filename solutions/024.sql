SELECT model
FROM pc
WHERE price >= ALL(SELECT MAX(price) FROM pc UNION SELECT MAX(price) FROM laptop UNION SELECT MAX(price) FROM printer)

UNION

SELECT model
FROM laptop
WHERE price >= ALL(SELECT MAX(price) FROM pc UNION SELECT MAX(price) FROM laptop UNION SELECT MAX(price) FROM printer)

UNION

SELECT model
FROM printer
WHERE price >= ALL(SELECT MAX(price) FROM pc UNION SELECT MAX(price) FROM laptop UNION SELECT MAX(price) FROM printer)
