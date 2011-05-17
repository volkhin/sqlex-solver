WITH keys(point, date) AS (
SELECT DISTINCT point, date FROM income_o
UNION
SELECT DISTINCT point, date FROM outcome_o
) SELECT keys.point, keys.date, inc, out
FROM keys
LEFT JOIN income_o ON keys.point = income_o.point AND keys.date = income_o.date
LEFT JOIN outcome_o ON keys.point = outcome_o.point AND keys.date = outcome_o.date
