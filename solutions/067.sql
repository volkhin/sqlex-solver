with Marsh (mar, c_mar) as (
select x.marsh, count(x.trip_no) from
(select town_from+town_to marsh, trip_no from trip) x
group by x.marsh
)

select count(c_mar) qty from Marsh 
where c_mar = (select max(c_mar) from Marsh)
