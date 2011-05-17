SELECT DISTINCT maker
FROM product pr
WHERE
(SELECT COUNT(1) FROM product pr2 WHERE pr2.type = 'pc' AND pr2.maker = pr.maker) > 0 AND 
(SELECT COUNT(1) 
  FROM product pr2 
  WHERE pr2.maker = pr.maker 
    AND pr2.type = 'pc' 
 )
 = 
(SELECT COUNT(1) 
  FROM product pr2
  WHERE pr2.maker = pr.maker 
    AND pr2.type = 'pc' 
    AND EXISTS (SELECT 1 FROM pc WHERE pc.model = pr2.model)
)
