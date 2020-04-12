--1.
-- Write a SELECT statement that returns a COUNT or Customers in the Application.Customers table.
-- Alians the column 'cnt.

SELECT COUNT(1) AS cnt
FROM Sales.Customers C 
 

--OR

SELECT COUNT(*) AS cnt
FROM Website.Customers

--2.
-- Write a SELECT statement that returns the Average (AVG) unit price of all products.
-- Use the Sales.OrderLines table. Alian the column AvgPrice.

SELECT AVG(UnitPrice) AS AvgPrice
FROM Sales.OrderLines AS OL

--3.
-- Write a SELECT statement that returns the most expensive amount ever invoiced
-- to WideWorldImporters (Hint: Use the Purchasing.SupplierTransactions as the source table).
-- The invoice amount includes the tax owed.

SELECT MAX(TransactionAmount)
FROM Purchasing.SupplierTransactions