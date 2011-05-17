WITH t1 AS (SELECT *, 
COALESCE((SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id IN (SELECT v_id FROM utv WHERE v_color = 'r') AND b.b_q_id = q.q_id), 0) r, 
COALESCE((SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id IN (SELECT v_id FROM utv WHERE v_color = 'g') AND b.b_q_id = q.q_id), 0) g, 
COALESCE((SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id IN (SELECT v_id FROM utv WHERE v_color = 'b') AND b.b_q_id = q.q_id), 0) b
FROM utq q ),

t2 AS (
SELECT *
FROM t1 t WHERE 
(t.r = 255 AND t.g = 255 AND t.b = 255)	
),

t3 AS (
SELECT v_id
FROM utv v
WHERE (SELECT SUM(b_vol) FROM utb b WHERE b.b_v_id = v.v_id ) < 255
)

SELECT q_name FROM t2 t
WHERE 
  (SELECT COUNT(1) 
   FROM 
    (SELECT b_v_id id 
     FROM utb b 
     WHERE b.b_q_id = t.q_id) blns 
   WHERE blns.id IN (SELECT * FROM t3)) = 0
