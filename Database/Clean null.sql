SELECT 
	company,
    COALESCE(company, "B2C") as clean_company  -- coalesce = if ... null then ...
FROM customers;

-----------------------------------

SELECT 
	company,
    CASE
    	WHEN company is NULL THEN "B2C"
    END as clean_company
FROM customers;

-----------------------------------








