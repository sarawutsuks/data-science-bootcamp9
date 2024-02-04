SELECT
  invoicedate,
  STRFTIME('%Y', invoicedate) AS year,
  STRFTIME('%m', invoicedate) AS month,
  STRFTIME('%d', invoicedate) AS day,
  STRFTIME('%Y-%m', invoicedate) AS year_month,
  STRFTIME('%Y-%m-%d', invoicedate) AS year_month_day
FROM invoices
WHERE year = '2010';  -- SQLite มอง date เป็น TEXT จึงใช้ฟังก็ชั้น CAST ในการเปลี่ยน data type

SELECT
  invoicedate,
  CAST(STRFTIME('%Y', invoicedate) AS INT) AS year
FROM invoices
WHERE year = 2010;  -- SQLite มอง date เป็น TEXT จึงใช้ฟังก็ชั้น CAST ในการเปลี่ยน data type
