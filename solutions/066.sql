WITH t1 AS (
SELECT '2003-04-01 00:00:00.000' date UNION
SELECT '2003-04-02 00:00:00.000' date UNION
SELECT '2003-04-03 00:00:00.000' date UNION
SELECT '2003-04-04 00:00:00.000' date UNION
SELECT '2003-04-05 00:00:00.000' date UNION
SELECT '2003-04-06 00:00:00.000' date UNION
SELECT '2003-04-07 00:00:00.000' date
)

SELECT tt.date, (SELECT COUNT(1) FROM (SELECT DISTINCT t.trip_no
FROM pass_in_trip pip, trip t
WHERE pip.trip_no = t.trip_no
AND t.town_from = 'rostov'
AND tt.date = pip.date) trips )
FROM t1 tt
