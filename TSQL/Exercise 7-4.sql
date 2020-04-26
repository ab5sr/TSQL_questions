--1.
--Write a query that returns the DISTINCT LIST OF UnitPrice
--from the Sales.OrderLines table
--and Order the results by UnitPrice DESC
--Return ONLY the UnitPrice.

SELECT  DISTINCT UnitPrice
FROM Sales.OrderLines
ORDER BY UnitPrice DESC

--2.
--Write the same query in #1 but this time use a GROUP BY instead of DISTINCT.

SELECT   UnitPrice
FROM Sales.OrderLines
GROUP BY UnitPrice
ORDER BY UnitPrice DESC
