SELECT
  name,
  salary,
  salary * 1.15 AS new_salary,
  upper(name) || 'Good_company' AS company_name
FROM employee;
