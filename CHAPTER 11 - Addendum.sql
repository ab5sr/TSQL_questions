--1.
--Here is a simple CTE with CROSS APPLY
--This query simply compares LastEditedBy from two tables.
--Note that this query can be rewritten using an INNER JOIN

WITH Od
AS
	(
	 SELECT *
	 FROM Sales.OrderLines	 
	)
SELECT O.OrderID, ox.lasteditedby, o.LastEditedBy
FROM Sales.Orders O
CROSS APPLY
	(SELECT * FROM Od where Od.OrderID = O.OrderID and O.LastEditedBy != Od.LastEditedBy
) OX
ORDER BY 1,2,3

--2.
--Here is a use of CROSS APPLY in combination with the STRING_SPLIT() internal table-returning function
--Note that this query cannot be rewritten using an INNER JOIN


SELECT InvoiceID
 	,TRIM(value) AS Items      
FROM Sales.Invoices
CROSS APPLY 
	string_split(DeliveryInstructions, ',')

--Each of the OUTER (LEFT) values get executed for each DeliveryInstruction sent to the function.
--string split is a built-in table returning function.

--3.
--Here is another cool use of CROSS APPLY. Notice that the CASE only needs to be written
--in the APPLY and not in the SELECT and WHERE clause.
--Note that this query cannot be rewritten using an INNER JOIN


SELECT Backordered.backorderorderid
	,OrderID
FROM [WideWorldImporters].[Sales].[Orders]
CROSS APPLY (VALUES(CASE WHEN BackorderOrderID IS NOT NULL THEN 'Y' ELSE 'N' END)) Backordered (backorderorderid)
  WHERE Backordered.backorderorderid='Y'	

--APPLY operators are NON-ANSI standard, and you will not find the keywords in any implementation of SQL other than the TSQL extension.
--Other language do, however, include this concept and is used widely.

--I use the following quite a lot - you should be prepared to PIVOT data as needed; normally I do this action
--more often than UNPIVOT. Use the following to set up a PIVOT example.

CREATE TABLE #test
    (dt date
    ,Plant varchar(30)
    ,Weather varchar(30))

--4.
--
--Set up the data
INSERT INTO #test VALUES  ('1/1/2020', 'TX', 'Sunny'), ('1/1/2020','CA', 'Cloudy'), ('1/2/2020', 'OK', 'Rain')

--Analyze the data
SELECT * FROM #test

--We have been tasked to transpose the state abbreviations of TX, OK, CA to columns, and for each given date list the weather value that occurred.
--This is a simple pivot...see if you can follow along.

SELECT anchor_column AS <first_column_alias>,
     [pivot_value1], [pivot_value2], ... [pivot_value_n]
FROM 
    (<source_data>) AS <source_data_alias>
PIVOT 
(
    aggr_function(<anchor_column_alias>)
    FOR <pivot_column>
    IN ([pivot_value], [pivot_value2], ... [pivot_value_n])
) AS <alias>;

--Try to follow along with the template, above:

SELECT
     dt AS [WeatherDate]
    ,[TX]
    ,[CA]
    ,[OK]
FROM  
  (  
    SELECT
        dt
        ,plant
        ,weather
    FROM #test 
  ) src 
PIVOT  
(  
    max(weather)       
FOR   
  plant
    IN ( [TX], [CA], [OK])  
) AS pvt

--I first get my source (src) data, then i do the other SELECT as I visualize how the data should look. The PIVOT part I usually save for last
--as I first create the 'IN' statement; from there the FOR is the value which are described by the columns.

--Here is the 'old' way of doing it, before it was introduced in SQL 2005. In many ways it seems easier to understand! Actually, the same operation
--is happening where you aggregate the column, create a column header with the values for that date, and use an anchor column to display those values

SELECT  
         dt AS [WeatherDate]
        ,TX
        ,CA
        ,OK 
FROM
    (SELECT
        dt
        ,MAX(CASE WHEN PLANT = 'TX' THEN weather END) AS TX
        ,MAX(CASE WHEN PLANT = 'CA' THEN weather END) AS CA
        ,MAX(CASE WHEN PLANT = 'OK' THEN weather END) AS OK
        FROM #Test
        GROUP BY dt
        )x

--These take practice - for all of us - because it is somewhat unnatural. Don't be afraid to dig in and try.
