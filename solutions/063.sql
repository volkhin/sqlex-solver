SELECT name
FROM passenger
WHERE id_psg IN 
(SELECT DISTINCT id_psg
FROM pass_in_trip
GROUP BY id_psg, place
HAVING COUNT(1) > 1)
