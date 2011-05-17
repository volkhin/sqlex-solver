WITH moscows AS (SELECT DISTINCT pip.id_psg
FROM pass_in_trip pip
WHERE
 (SELECT TOP 1 t2.town_from
  FROM trip t2, pass_in_trip pip2
  WHERE pip.id_psg = pip2.id_psg
  AND pip2.trip_no = t2.trip_no
  ORDER BY pip2.date, t2.time_out) = 'moscow')

, ans AS (
SELECT pip.id_psg, COUNT(1) cnt
FROM pass_in_trip pip, trip t
WHERE pip.trip_no = t.trip_no
AND t.town_to = 'moscow'
AND pip.id_psg NOT IN (SELECT * FROM moscows)
GROUP BY pip.id_psg
HAVING COUNT(1) > 1)

SELECT name, cnt
FROM ans, passenger p
WHERE ans.id_psg = p.id_psg
