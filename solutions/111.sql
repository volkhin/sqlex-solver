WITH t1 AS (SELECT q.*, 
COALESCE((SELECT SUM(b_vol) FROM utb b WHERE b.b_q_id = q.q_id AND b.b_v_id IN (SELECT v.v_id FROM utv v WHERE v.v_color = 'r')), 0) r,
COALESCE((SELECT SUM(b_vol) FROM utb b WHERE b.b_q_id = q.q_id AND b.b_v_id IN (SELECT v.v_id FROM utv v WHERE v.v_color = 'g')), 0) g,
COALESCE((SELECT SUM(b_vol) FROM utb b WHERE b.b_q_id = q.q_id AND b.b_v_id IN (SELECT v.v_id FROM utv v WHERE v.v_color = 'b')), 0) b
FROM utq q
)

SELECT q_name, r qty FROM t1
WHERE t1.r = t1.g AND
t1.r = t1.b
AND t1.r != 0 AND t1.r != 255
