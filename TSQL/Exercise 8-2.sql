--1.
--Write a query that sums the unit price, partitioning it by the OrderID
--where the OrderID = 7. You can check you work by issuing a SELECT statement to the
--Sales.OrderLines table where orderid=7
 
SELECT orderlineid, orderid, SUM(unitprice) OVER (PARTITION BY orderid )
FROM sales.orderlines
WHERE orderid = 7

--Check your work...
SELECT * FROM sales.orderlines WHERE OrderID=7

--What is the behaviour of the result set for each row?

--2.
--Write a query that gives a average of running total by order id. Use the AVG() function
--to achieve the value.   
--Hint: row 1 value is 230, the row 2 value is the AVG of the UnitPrice for OrderIDs 1,2

SELECT  orderid, AVG(unitprice) OVER (ORDER BY orderid)
FROM Sales.Orderlines

-- Use a query to check your work; 
SELECT * FROM sales.OrderLines
ORDER BY orderid

--3.
--Write a SELECT statement to the Sales.Invoices table. The columns to be returned are 1) CustomerID, 2) YEAR(InvoiceDate)
--and 3) a statement using the functions that you have learned thus far which is the SUM(TotalDryItems) Partioned By
--the year of the invoice date, ordered by CustomerID. Essentially, this query should return the SUM of the items purchased
--by year for each CustomerID for only CustomeriID 1-4.

SELECT DISTINCT CustomerID, YEAR(InvoiceDate) , SUM(TotalDryItems) OVER (PARTITION BY YEAR(INVOICEDATE)  ORDER BY CUSTOMERID) AS SumPurchased
FROM Sales.Invoices
WHERE CustomerID IN (1,2,3,4)
ORDER BY CustomerID