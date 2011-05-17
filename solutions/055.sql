SELECT c.class, MIN(s.launched)
FROM classes c, ships s
WHERE c.class = s.class
GROUP BY c.class

UNION 

SELECT c.class, null
FROM classes c 
WHERE ( SELECT COUNT(1) from ships s WHERE c.class = s.class) = 0
