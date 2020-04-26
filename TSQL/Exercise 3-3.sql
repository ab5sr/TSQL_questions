-- Use the [WideWorldImporters] database to answer the following questions:

--1.
--Write a SELECT statement; issue a query to the [Application].[StateProvinces]
--table in the [WideWorldImporters] database and include both 1 and 45
--for StateProvinceID. Use the IN operator. OK to use * (star).
USE  [WideWorldImporters]
SELECT 
    *
FROM [Application].[StateProvinces]
WHERE StateProvinceID IN (1,45)
GO

--2.
--Write the above query to return the same resultset using the OR operator.
SELECT
    *
FROM [Application].[StateProvinces] 
WHERE StateProvinceID = 1 OR StateProvinceID = 45
GO

--The same result should be achieved. Therfore, the IN is simply resolved by SQL Server
--as an OR operation.

--3.
--Again using your answer from question #1, what results are derived it you add a
--NOT preceding the IN operator? Write the query and analyze the results. What is include/excluded
--in the result set?

SELECT 
    *
FROM [Application].[StateProvinces]
WHERE StateProvinceID NOT IN (1,45)
GO

--Adding a NOT returns all StateProvinceIDs that equal to other than 1 or 45. Neither Alabama
--not Texas are included in the results. Also notice that SQL Server has to look at each and every row
--in order to determin whether or not [StateProvinceID] is equal to 1 or 45 in order to exclude those rows.