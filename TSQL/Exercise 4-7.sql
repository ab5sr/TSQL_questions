--
--1
--Write a SELECT statement using the Sales.Customer; your boss wants a list of alphabetized customers.
--Using an ORDER BY clasue,  order the results by the leftmost 3 characters ASC. OK to use *.


SELECT *
FROM sales.Customers
ORDER BY LEFT(CustomerName,3) ASC

--
--2.
--Write a SELECT statement using the Sales.Orders table and returning the OrderID, OrderDate, and CustomerID
--columns, return the rows where the OrderDate includes only 5/30/2016 and 5/31/2016.
--Hint: Use a BETWEEN keyword and ORDER BY OrderDate DESC

SELECT OrderID
        ,OrderDate    
        ,CustomerID
FROM Sales.Orders
WHERE OrderDate BETWEEN '5/30/2016' AND '5/31/2016'
ORDER BY OrderDate DESC
 

--3
--Write a SELECT statement, querying the Application.Cities table. Returning the CityName and
--LatestRecordedPopulation and use a CASE statement to ORDER BY the LatestRecordedPopulation and sort
--the NULL values on the bottom not the default on top. Try without using DESC.


SELECT CityName
    ,LatestRecordedPopulation
FROM [WideWorldImporters].[Application].[Cities]
ORDER BY CASE WHEN LatestRecordedPopulation IS NULL THEN 1 ELSE 0 END

--This statement sorts using a number, but it could sort by an alpha just as well.
        
--4.
--Write a SELECT statement using the logic in question #3, querying the Application.PaymentMethods table.
--ORDER BY the payement method in the following order:
--  CHECK
--  Credit-Card
--  EFT 
--  Cash

SELECT [PaymentMethodID]
      ,[PaymentMethodName]
      ,[LastEditedBy]
  FROM [WideWorldImporters].[Application].[PaymentMethods]
  ORDER BY CASE WHEN PaymentMethodName = 'CHECK' THEN 0
                WHEN PaymentMethodName = 'Credit-Card' THEN 1
                WHEN PaymentMethodName = 'EFT' THEN 2
                WHEN PaymentMethodName = 'Cash' THEN 3
                END        

-- alternate method;


SELECT [PaymentMethodID]
      ,[PaymentMethodName]
      ,[LastEditedBy]
  FROM [WideWorldImporters].[Application].[PaymentMethods]
  ORDER BY CASE WHEN PaymentMethodName = 'CHECK' THEN 'a) First'
                WHEN PaymentMethodName = 'Credit-Card' THEN 'b) Second'
                WHEN PaymentMethodName = 'EFT' THEN 'c) Third'
                WHEN PaymentMethodName = 'Cash' THEN 'd) Fourth'
                END   

--As an alternative to the first statement, the above sorts by a, b ,c, d.