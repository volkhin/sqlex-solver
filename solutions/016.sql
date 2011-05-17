SELECT DISTINCT pc1.model, pc2.model, pc1.speed, pc1.ram
FROM pc pc1, pc pc2
WHERE
	(pc1.model > pc2.model) AND
	(pc1.speed = pc2.speed) AND
	(pc1.ram = pc2.ram)
