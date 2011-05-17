SELECT maker, speed
FROM product
INNER JOIN laptop ON Product.model = laptop.model
WHERE hd >= 10
