SELECT Category,CatValue
FROM 
   (SELECT top 1 model, cast(speed as varchar(50)) speed, 
    cast(ram as varchar(50)) ram,
    cast(hd as varchar(50)) hd,
    cast(cd as varchar(50)) cd,
    cast(price as varchar(50)) price
   FROM PC order by code desc) p
UNPIVOT
(CatValue FOR Category IN
      (model, speed, ram,hd,cd,price)
) unpvt
