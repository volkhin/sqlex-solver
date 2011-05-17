SELECT DISTINCT battle
FROM outcomes
WHERE ship IN (select name from ships where class = 'Kongo')
