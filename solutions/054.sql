select cast(avg(cast(all_ships.numguns as numeric(4,2)))  as numeric(4,2)) avg_guns
FROM 
(
select o.ship, c.numguns
from outcomes o ,  classes c
where o.ship = c.class and c.type = 'bb'
union
select s.name, c.numguns
from ships s inner join classes c 
on s.class = c.class
where  c.type = 'bb'
) all_ships
