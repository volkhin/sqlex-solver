SELECT ship
FROM outcomes
WHERE battle = 'North Atlantic' AND result = 'sunk'
GROUP BY ship
