SELECT maker
FROM product
JOIN pc ON product.model = pc.model
WHERE pc.speed >= 450
GROUP BY product.maker
