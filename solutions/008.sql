SELECT maker FROM product where type = 'pc'
EXCEPT
SELECT maker FROM product where type = 'laptop'
