SELECT 
    CASE
    	WHEN company is NULL THEN "B2C"
        ELSE "B2B"
    END as segment,
    country,
    count(*) as num_customers
FROM customers
GROUP BY segment, country
HAVING COUNT(*) > 2;
