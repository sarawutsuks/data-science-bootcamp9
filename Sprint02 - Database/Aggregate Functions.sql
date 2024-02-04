SELECT
  AVG(milliseconds) AS AVG_mill,
  SUM(milliseconds) AS SUM_mill,
  MIN(milliseconds) AS MIN_mill,
  MAX(milliseconds) AS MAX_mill,
  COUNT(milliseconds) AS COUNT_mill
FROM tracks;
