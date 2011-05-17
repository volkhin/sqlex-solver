SELECT pc.model, price FROM pc JOIN product ON product.model = pc.model WHERE maker = 'B'
UNION
SELECT laptop.model, price FROM laptop JOIN product ON product.model = laptop.model WHERE maker = 'B'
UNION
SELECT printer.model, price FROM printer JOIN product ON product.model = printer.model WHERE maker = 'B'
