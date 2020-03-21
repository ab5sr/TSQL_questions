--Exercise 3.5 Sorting Data
--#1
--Write a SELECT statement to the Application.Countries table, returning CountryID, CountryName, and FormalName.
--and use the ORDER BY clause and order the result set by FormalName Ascending
USE WideWorldImporters
SELECT 
      [CountryID]
      ,[CountryName]
      ,[FormalName]     
  FROM [Application].[Countries]
  ORDER BY FormalName

--#2 In the above query, remove the FormalName from the SELECT list; what is the outcome 
--when the query is executed? What can we learn from this?

SELECT 
      [CountryID]
      ,[CountryName]
FROM [Application].[Countries]
ORDER BY FormalName;

The query still executes; it shows us that the ORDER BY specified column(s) does not need to be in the 
SELECT list as a requirement for the query to execute. This is not true for other syntax that will be introduced.

