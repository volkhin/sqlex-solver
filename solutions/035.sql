select
model,
type,
cast(left(model,1) as int)* cast(right(model,1) as int) as n
from product
where
cast(left(model,1) as int)<cast(right(model,1) as int)
and cast(left(model,1) as int)%2=0
and cast(right(model,1) as int)%2=1
and ASCII(left(model,1)) between 48 and 57
and ASCII(right(model,1)) between 48 and 57
