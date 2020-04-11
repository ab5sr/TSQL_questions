--1.
--Use INTERSECT to find the shared city names for Utah and Wyoming
--Hint: this is a derivation of the UNION clause that you did earlier in the chapter.

SELECT CityName
FROM Application.Cities c
INNER JOIN Application.StateProvinces s
    ON c.StateProvinceID=s.StateProvinceID
WHERE StateProvinceName = 'utah'
INTERSECT 
SELECT CityName
FROM Application.Cities c
INNER JOIN Application.StateProvinces s
    ON c.StateProvinceID=s.StateProvinceID
WHERE StateProvinceName = 'wyoming'




--2.
--Write a SELECT statement; create a derived table based on Sales.Customers, fetching
--only the CustomerID and CustomerName. Return both columns. 
--What if you tried to SELECT another column, say PostalCityID, from the derived table?


SELECT
    CustomerName
    ,CustomerID
FROM
    (
        SELECT CustomerName, CustomerID FROM Sales.Customers

    ) CDerivTbl

--The query would not execute because PostalCityID is not included in the derived table, and cannot be queried.
--It would return Invalid column name 'PostalCityID'.

--RETURNS AN ERROR
SELECT
    CustomerName
    ,CustomerID
    ,PostalCityID
FROM
    (
        SELECT CustomerName, CustomerID FROM Sales.Customers

    ) CDerivTbl

 --3.
 --Q: What is CDerivTbl in the above question?

 --A: The tables Alias, actually the table name - this is very important. You must have an Alias for a derived table; 
 --try deleting it and then run your SELECT statement. Did the query run? No.

 --Just as each table has a name, a Derived Table must also. Refer to the Derived Table by its alias.

 --4.
 --Cte challenge
 --Write a Common-table expression to in order to SUM the extended price for OrderID = 2 in the Sales.OrderLines table.
 --	a) the cte will include the extended price for OrderID = 2. This is the quantity x Unitprice + tax rate
 --	b) This will return the calculation of 2 lines (1 for each line item on OrderID = 2. There are two lines on the order).
 --	c) The SELECT portion of the expression (SELECT vs. CTE) will SUM the two lines in the CTE to return the order total


WITH CTE
AS
(
    SELECT  orderid, (Quantity * UnitPrice * (1+ TaxRate/100)) AS Linetotal
    FROM SALES.OrderLines
    WHERE orderid   = 2
   
)    
SELECT SUM(Linetotal) as Linetotal
FROM cte 
WHERE cte.orderid = 2 