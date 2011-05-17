with base_set as
(
select point, date, inc from income
union all
select point, date, -out from outcome
)

select distinct bs.point, convert(varchar(10), bs.date, 103) dt,
(select sum(inc) from base_set where date <= bs.date and point = bs.point) itogo
from base_set bs
