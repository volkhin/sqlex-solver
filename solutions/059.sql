select i.P, isnull(i.M, 0) - isnull(o.M, 0) rem from
(select point P, sum(inc) M from income_o group by point) i,
(Select point P, sum(out) M from outcome_o group by point) o
where
i.P = o.P
union
select point P, sum(inc) rem from income_o
where point not in (select point from outcome_o)
group by point
