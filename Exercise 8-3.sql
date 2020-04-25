--1.
--Let's say that you wanted to calculate an Average; you wish to include the row before
--and the row after your current row. What would the clause look like in order to accomplish this?

ROWS BETWEEN 1 PRECEDING  AND 1 FOLLOWING

--would get the desired rows to include.

example:

SELECT   InvoiceID, CustomerID, YEAR(InvoiceDate) ,  (TotalDryItems), sum(TotalDryItems) OVER (PARTITION BY YEAR(InvoiceDate)  ORDER BY CustomerID
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS Computed
FROM Sales.Invoices
WHERE CustomerID =1
GROUP BY CustomerID, YEAR(InvoiceDate), TotalDryItems, InvoiceID


--If, within the same year (since the partition is by year) you must add the preceding, current, and following one row to get the correct total found
--in the complete row.


--2.
--Write a query according to the following specfications:
--Table: Warehouse.StockItems
--StockItemName WHERE LEFT(3) = 'USB'
--UnitPrice < 100
--Columns in the SELECT List: StockItemID, StockItemName, UnitPrice
--Write a row that calculates a SUM(UnitPrice) where range is UNBOUNDED PRECEDING AND CURRENT ROW (refer to your textbook for an example)
--Hint: the last row will be a running total.

SELECT StockItemID, StockItemName, UnitPrice, SUM(UnitPrice) OVER (ORDER BY StockItemID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM Warehouse.StockItems
WHERE LEFT(StockItemName, 3) = 'usb'
AND UnitPrice < 100
