SELECT 
(SELECT SUM(in2.inc) 
  FROM income_o in2 
  WHERE date < '04/15/01')

 - 

(SELECT SUM(out2.out) 
  FROM outcome_o out2 
  WHERE date < '04/15/01')
