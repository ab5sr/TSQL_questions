 
--1.
--Write a SELECT statement showing 5 quarters back (in the past)
--from today's date.

SELECT DATEADD(QQ, -5, GETDATE())

--The TSQL language is one of only a few SQL implementations that allows you to add/subtract quarters.

--2.
--Write a query that returns sales for saturday for the year 2013 in the Orders table for CustomerID 1
--Return CustomerID, OrderDate, and DATENAME in the SELECT list. Order this by CustomerID.
--Alias the new column 'OrderDay'

--Hint: This query will have 2 WHERE clause items

SELECT CustomerID, OrderDate, DATENAME(WEEKDAY, OrderDate) AS OrderDay
FROM sales.Orders
WHERE DATENAME(WEEKDAY, OrderDate) = 'saturday'
AND CustomerID=1
ORDER BY CustomerID

--3.
--In some parts of the World the preferred way to display dates is in the format ddMMyyyy. Using a random date of 10/03/2020,
--display the date in this format using both CONVERT() and FORMAT().

DECLARE @DateVar datetime = '10/03/2020' --the date to format

SELECT FORMAT(@DateVar, 'dd-MM-yyyy')
SELECT CONVERT(varchar(22), @DateVar, 104)