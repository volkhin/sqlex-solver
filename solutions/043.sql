select c2.country, tb4.cnt, min(tb4.launched)
from
classes c2
left join
(
select tb2.country, tb2.cnt, tb2.launched
from (
select country, count(ships.class) cnt, launched
from ships
join classes on classes.class = ships.class
where launched is not null
group by country, launched
) tb2
join (
select country, max(cnt) max_cnt
   from (
select country, count(ships.class) cnt, launched
from ships
join classes on classes.class = ships.class
where launched is not null
group by country, launched
   ) tb1
   group by country
) tb3 on tb2.country = tb3.country and tb2.cnt = tb3.max_cnt
) tb4 on c2.country = tb4.country
group by c2.country, tb4.cnt
