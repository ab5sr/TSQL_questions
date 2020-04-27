--1.
--Using the Warehouse.StockItems table write a query that returns all StockItemNames
--that are contain USB

SELECT * FROM Warehouse.StockItems
WHERE StockItemName LIKE 'USB%'

--2.
--Using the Application.People table write a query that returns all rows
--where FullName contains 'IS%'. Return only FullName and SearchName.


SELECT FullName, SearchName
FROM Application.People
WHERE FullName LIKE 'IS%'


--3.
--What is the result of the following query?

SELECT TOP (5000) [CustomerID]
      ,[CustomerName]
FROM [WideWorldImporters].[Sales].[Customers]
WHERE CustomerName LIKE 'Jo'

--Nothing - the LIKE operator must have a % or (_) wildcard in order to operate.