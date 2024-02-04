-- subqueries
SELECT
	firstname,
    lastname
FROM (SELECT * FROM customers WHERE customerid <= 20) AS sub
WHERE country = "USA";

---------------------------------

-- WITH คือ การประกาศตัวแปร เป็นการ break down query เป็น stepๆ (with clause ต้อง run with clause กับ query ที่ refer มันด้วย)
WITH sub AS (
  SELECT * FROM customers WHERE customerid <= 20
)

SELECT
	firstname,
    lastname
FROM sub
WHERE country = "USA";
