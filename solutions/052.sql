select s.name
from ships s left join classes c
on c.class = s.class
where case when c.numguns is null then 9 else c.numguns end > 8
and  case when c.bore is null then 8 else c.bore end <19
and case when c.displacement is null then 8 else c.displacement end <= 65000
and case when c.type is null then 'bb' else c.type end  = 'bb'
and case when c.country is null then 'Japan' else c.country end = 'Japan'
