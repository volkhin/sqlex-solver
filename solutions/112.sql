WITH t1 AS (
SELECT ( (SELECT SUM(255) FROM utv v WHERE v.v_color = 'R') -
(SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id IN (SELECT v_id FROM utv v WHERE v.v_color = 'r')) ) ttt

UNION

SELECT (SELECT SUM(255) FROM utv v WHERE v.v_color = 'G') -
(SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id IN (SELECT v_id FROM utv v WHERE v.v_color = 'G'))

UNION

SELECT (SELECT SUM(255) FROM utv v WHERE v.v_color = 'B') -
(SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id IN (SELECT v_id FROM utv v WHERE v.v_color = 'B'))
)


SELECT MIN(ttt) / 255 FROM t1
