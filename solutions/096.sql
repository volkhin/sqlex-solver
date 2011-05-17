SELECT v2.v_name
FROM utv v, utb b, utq q, utb b2, utv v2
WHERE v.v_color = 'b' AND
b.b_q_id = q.q_id AND
b.b_v_id = v.v_id AND
b2.b_q_id = q.q_id AND 
v2.v_id = b2.b_v_id
GROUP BY v2.v_name


INTERSECT

SELECT v.v_name
FROM utv v, utb b
WHERE v.v_id = b.b_v_id AND
v.v_color = 'r'
GROUP BY v.v_name
HAVING COUNT(1) > 1
