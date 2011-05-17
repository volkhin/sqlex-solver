with aaa as (
select CASE WHEN town_from<=town_to 
THEN town_from+town_to 
ELSE town_to+town_from END mrsh,
count(*) ct from trip 
group by CASE WHEN town_from<=town_to 
THEN town_from+town_to 
ELSE town_to+town_from END ) 

select count(*) from aaa where ct=(select max(ct) from aaa)
