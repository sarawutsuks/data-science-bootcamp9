-- NULL / Missing Values
SELECT
  company,
  COALESCE(company, 'End Customer') AS 'Company Clean'
FROM customers;
