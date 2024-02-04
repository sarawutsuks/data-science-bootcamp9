-- basic query
SELECT
	firstname,
    lastname,
    email,
    COUNT(*) 
FROM customers
JOIN invoices on customers.customerid = invoices.customerid
WHERE country = "USA" and STRFTIME("%Y-%m", invoices.invoicedate) = "2009-10"
GROUP by 1,2 ;

---------------------------------------------

-- with clause ต้อง run with clause กับ query ที่ refer มันด้วย

WITH usa_customer AS (
	SELECT * FROM customers
  	WHERE country = "USA"
), invoice_2009 as (
	SELECT * FROM invoices
  WHERE  STRFTIME("%Y-%m", invoices.invoicedate) = "2009-10"
)


SELECT 
	firstname,
    lastname,
    email,
    COUNT(*)
FROM usa_customer
JOIN invoice_2009 on usa_customer.customerid = invoice_2009.customerid
GROUP BY 1, 2;


