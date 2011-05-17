SELECT maker, COUNT(1)
FROM product
WHERE type = 'pc'
GROUP BY maker
HAVING COUNT(1) >= 3
