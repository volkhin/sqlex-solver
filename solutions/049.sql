SELECT name FROM ships WHERE class IN (SELECT class FROM classes WHERE bore= 16)

UNION


SELECT ship FROM outcomes WHERE ship IN (SELECT class FROM classes WHERE bore= 16)
