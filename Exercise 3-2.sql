--1 
--Write a SELECT statement to return the CityName and LatesRecordedPopulation
--limiting (filtering) the results to CityName equal to Simi Valley.
--Use a WHERE clause to filter the result set.
SELECT  
	[CityName]
	,[LatestRecordedPopulation]    
FROM [WideWorldImporters].[Application].[Cities]
WHERE [CityName]='Simi Valley'
  
--2.
--Write a SELECT statement to return all of the customers who
--signed up in 2016. Hint: Filter on the 'AccountOpenedDate'
--and return both CustomerID and CustomerName. Use BETWEEN to achieve
--the recordset (5 rows).

SELECT 
	[CustomerID]
   ,[CustomerName]
FROM [WideWorldImporters].[Sales].[Customers]
WHERE [AccountOpenedDate] BETWEEN '1/1/2016' AND '12/31/2016'

--3.
--Write a SELECT statement to return all customers (from the Application.People
--table) who signed up in the first quarter of the year 2016.
--Hint: Use the ValidFrom column and fetch January-March 2016 ValidFrom dates.
--Use either BETWEEN or >= and < operators.
--Return PersonID, FullName, PhoneNumber, FaxNumber, and EmailAddress.

SELECT
     [PersonID]
      ,[FullName]
      ,[PhoneNumber]
      ,[FaxNumber]
      ,[EmailAddress]
    FROM [WideWorldImporters].[Application].[People]
WHERE [ValidFrom] >= '1/1/2016'
AND [ValidFrom] < '4/1/2016'

-- or
SELECT
     [PersonID]
      ,[FullName]
      ,[PhoneNumber]
      ,[FaxNumber]
      ,[EmailAddress]
    FROM [WideWorldImporters].[Application].[People]
WHERE [ValidFrom] BETWEEN '1/1/2016' AND '3/31/2016'

