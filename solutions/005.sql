SELECT model, speed, hd
FROM pc
WHERE (cd = '12x' AND price < 600) OR (cd = '24x' AND price < 600)
