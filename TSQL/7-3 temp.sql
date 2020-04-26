--1.
--Write A SELECT statement from the Warehouse.StockItems table. Return 2 columns, the first is the SupplierID and
--the second a count displaying the number of SupplierIDs in the table. Alias the count column 'cnt'.


SELECT SupplierID, count(1) cnt
FROM Warehouse.StockItems
GROUP BY SupplierID

--2. Write a SELECT statement to return the StockItemName and the SUM of the QuantityOnHand for each stock item.
--Hint: join Warehouse.StockItems and Warehouse.StockItemHoldings 


SELECT StockItemName, SUM(QuantityOnHand) AS SumQTYOnhand
FROM Warehouse.StockItems AS s 
INNER JOIN Warehouse.StockItemHoldings AS h 
    ON s.StockItemid = h.StockItemID
GROUP BY StockItemName
ORDER by sum(QuantityOnHand) DESC

--3.
--Write a SELECT statment to show the SupplierName, TransactionDate and number
--of transactions that day. Join Purchasing.SupplierTransactions and Purchasing.Suppliers
--tables. Filter the result set using a WHERE clause that limits result to
--   a Quarter =1
--   b use YEAR(TransactionDate) = 2016

--Hint: your GROUP BY will include both T SupplierName and TransactionDate,



SELECT SupplierName, TransactionDate, count(1)
FROM Purchasing.Suppliers AS S
INNER JOIN Purchasing.SupplierTransactions AS ST
    ON S.SupplierID=ST.SupplierID
WHERE DATEPART(Q, TransactionDate) =1
AND YEAR(TransactionDate)=2016
GROUP BY SupplierName, TransactionDate