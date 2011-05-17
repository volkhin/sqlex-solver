SELECT DISTINCT 'laptop' AS type, model, speed
FROM laptop
WHERE speed < ALL(SELECT speed FROM pc)
