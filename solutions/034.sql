select DISTINCT name
from ships s, classes c
where s.class = c.class
  AND c.displacement > 35000
  AND launched >= 1922
  AND type = 'bb'
