SELECT speed, AVG(price)
FROM pc
WHERE pc.speed > 600
GROUP BY speed
