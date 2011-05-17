SELECT 
(SELECT SUM(inc) FROM income_o)
 - 
(SELECT SUM(out) FROM outcome_o)
