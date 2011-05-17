SELECT
-  (SELECT SUM(b_vol) 
   FROM utb b
   WHERE b.b_v_id IN (SELECT v_id FROM utv v WHERE v.v_color = 'R'))
+ (SELECT SUM(255) FROM utq) red,

-  (SELECT SUM(b_vol) 
   FROM utb b
   WHERE b.b_v_id IN (SELECT v_id FROM utv v WHERE v.v_color = 'g'))
+ (SELECT SUM(255) FROM utq) green,

-  (SELECT SUM(b_vol) 
   FROM utb b
   WHERE b.b_v_id IN (SELECT v_id FROM utv v WHERE v.v_color = 'b'))
+ (SELECT SUM(255) FROM utq) blue
