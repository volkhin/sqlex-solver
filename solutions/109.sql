WITH t1 AS (SELECT *, 
COALESCE((SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id IN (SELECT v_id FROM utv WHERE v_color = 'r') AND b.b_q_id = q.q_id), 0) r, 
COALESCE((SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id IN (SELECT v_id FROM utv WHERE v_color = 'g') AND b.b_q_id = q.q_id), 0) g, 
COALESCE((SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id IN (SELECT v_id FROM utv WHERE v_color = 'b') AND b.b_q_id = q.q_id), 0) b
FROM utq q )

SELECT q_name, 
(SELECT COUNT(1) FROM t1  WHERE t1.r = 255 AND t1.g = 255 AND t1.b = 255),
(SELECT COUNT(1) FROM t1  WHERE t1.r = 0 AND t1.g = 0 AND t1.b = 0)
FROM t1 t WHERE 
(t.r = 0 AND t.g = 0 AND t.b = 0) OR 
(t.r = 255 AND t.g = 255 AND t.b = 255)
