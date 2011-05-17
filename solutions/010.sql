SELECT model, price
FROM printer
WHERE printer.price = (
 SELECT MAX(price) from printer
)
