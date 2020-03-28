--1
--Write a SELECT statement to the Application.Countries table, creating
--a new code, which is the first three characters of the CountryName capitalized
--Alias the column NewCode, returning only the column created and the IsoAlpha3Code attribute.
--Hint: you will use both the UPPER() function, and the LEFT() function.

SELECT UPPER(LEFT(CountryName,3)) AS NewCode, IsoAlpha3Code
FROM Application.Countries
	
--2.
--In the CustomerName (located in the Sales.Customer table) return only the portion
--inside of parenthesis, including the parenthesis. Hint: See pp. 74 'Nesting Function',
--You may need to use a number of built-in functions, such as SUBSTRING(), CHARINDEX() AND LEN().

SELECT  SUBSTRING(customername, CHARINDEX('(', customername), CHARINDEX(')', CustomerName))
FROM [WideWorldImporters].[Sales].[Customers]

--First, you only want the text inside the parenthesis (including the left and right parenthesis. So use SUBSTRING.
--We want to start at the left parenthesis, so CHARINDEX() returns our starting point.
--To get how far we want to go, again we use CHARINDEX() to find our ending point in the string,
--which is the right-parenthesis in this example.


--3.
--Does TRIM() work the same as LTRIM(TRIM()), as was shown in the chapter?

--Yes, the same results are achieved and you do not have to use 2 functions.

