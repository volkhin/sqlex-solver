SELECT AVG(hd)
FROM pc
WHERE model in (SELECT model FROM product WHERE maker IN (SELECT DISTINCT maker FROM product WHERE type = 'printer'))
