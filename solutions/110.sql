WITH t1 AS (SELECT p.id_psg id
FROM pass_in_trip pip, trip t, passenger p
WHERE DATEPART(dw, pip.date) = 7
AND time_out > time_in
AND pip.trip_no = t.trip_no
AND p.id_psg = pip.id_psg
GROUP BY p.id_psg
)

SELECT name
FROM passenger,t1
where t1.id = id_psg
