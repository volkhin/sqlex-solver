WITH t1 AS (
SELECT id_psg, COUNT(1) cnt
FROM pass_in_trip pip
WHERE 
  (SELECT COUNT(id_comp) FROM
    (SELECT id_comp 
    FROM trip t2, pass_in_trip pip2
    WHERE pip2.id_psg = pip.id_psg  AND
    t2.trip_no = pip2.trip_no
    GROUP BY t2.id_comp
    ) companies
  ) = 1

GROUP BY id_psg
)


SELECT name, cnt
FROM t1 t, passenger p
WHERE t.id_psg = p.id_psg AND
t.cnt = (SELECT MAX(CNT) FROM t1)
