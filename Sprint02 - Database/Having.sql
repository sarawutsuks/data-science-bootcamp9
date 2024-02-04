SELECT
 name,
 COUNT(*)
FROM genres
GROUP BY 1
HAVING name LIKE 'A%';
