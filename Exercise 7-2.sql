--1.
--Write a SELECT statement that displays a count of CountryNames for each Continent. Use the Application.Countries
--table. Alias you Count column as CountCountries.

SELECT 
    Continent
    ,COUNT(Countryname) AS CountCountries
FROM Application.Countries
GROUP BY continent

--2.
--The following statement does not execute - it returns the error below. Go ahead and Execute the following; How do I fix it?

SELECT
    InvoiceID
    ,COUNT(*) AS cnt
FROM Sales.InvoiceLines


--Msg 8120, Level 16, State 1, Line 3
--Column 'Sales.InvoiceLines.InvoiceID' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

--This error is common and you will see it more often than others - this says that you need InvoiceID in the GROUP BY clause as below:

SELECT
    InvoiceID
    ,COUNT(*) AS cnt     
FROM Sales.InvoiceLines
GROUP BY InvoiceID

--*** The rule of thumb is...in the SELECT list, any non-aggregated columns must be included in the GROUP BY. There are exceptions,
--such as Expressions (they can be omitted from GROUP BY), but this is a good general rule to follow.

SELECT
    InvoiceID
    ,COUNT(*) AS cnt
    ,'THIS IS AN EXPRESSION' AS EXPR     
FROM Sales.InvoiceLines
GROUP BY InvoiceID



--3.
--Write a SELECT statement to return the number of OrderLines for each order that was placed..
--Hint: this will require an INNER JOIN between Sales.Orders and Sales.OrderLines.

SELECT 
    O.OrderID
    ,COUNT(OL.OrderLineID) AS CNT
FROM Sales.Orders O
INNER JOIN Sales.OrderLines OL
    ON O.OrderID = OL.OrderID
GROUP BY O.OrderID

--Check you work by picking a random OrderID and then querying the Sales.OrderLines table directly.