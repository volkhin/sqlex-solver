select t1.point,(isnull(inc,0)-isnull(out,0)) from (
(select point,sum(inc) as inc 
from income_o i where i.date<'2001.04.15' 
group by point)t1 left join (select point,sum(out)as out 
from outcome_o o where o.date<'2001.04.15' 
group by point)t2 on t1.point=t2.point)
