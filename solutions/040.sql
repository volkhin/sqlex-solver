SELECT classes.class, name, country
FROM classes, ships
WHERE numGuns >= 10
AND classes.class = ships.class
