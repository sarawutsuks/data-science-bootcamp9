-- where
SELECT
  firstname,
  lastname,
  country,
  email
FROM customers
WHERE lower(country) = 'usa' OR lower(country) = 'united kingdom';

SELECT
  firstname,
  lastname,
  country,
  email
FROM customers
WHERE lower(country) IN ('usa', 'united kingdom', 'france');

SELECT * FROM customers
WHERE country = 'USA';

SELECT * FROM customers
WHERE country = 'USA' AND state = 'CA';

SELECT * FROM customers
WHERE country = 'USA' OR country = 'United Kingdom';

SELECT * FROM customers
WHERE country IN ('USA', 'United Kingdom');

SELECT * FROM customers
WHERE country NOT IN ('USA', 'United Kingdom');

SELECT * FROM customers
WHERE email LIKE '%@gmail.com';

SELECT * FROM customers
WHERE email NOT LIKE '%gmail.com';

SELECT * FROM customers
WHERE company IS NULL;

SELECT * FROM customers
WHERE company IS NOT NULL;

SELECT * FROM customers
WHERE customerid BETWEEN 10 AND 15;
