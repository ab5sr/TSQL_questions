--1.
--Write a query using a subquery with an IN list to find all of the city names in Texas.
--Hint: the Outer query will be a query issued to the Application.Cities table and the
--inner query will be to the Application.StateProvinces table. StateProvinceID is the column
--shared between the two tables.

--Include only CityName in the results.
  

SELECT CityName
FROM Application.Cities AS SP
WHERE StateProvinceID 
		IN (SELECT StateProvinceID FROM Application.StateProvinces WHERE StateProvinceName = 'texas')

--2.
--Write a query to return all items that have never been ordered. Use a NOT EXISTS clause. Ok to use *. Hint: Sales.OrderLines
--will have all of the items ever ordered.


SELECT *
FROM Warehouse.StockItems WH
 WHERE NOT EXISTS
        (SELECT * FROM Sales.OrderLines   AS OL
        WHERE OL.StockItemID=WH.StockItemID)

--The answer is none; there are no Warehouse.StockItems that have not been included on an order.

--3.
-- Write a query that combines all of the cities in Utah and Wyoming and return a DISTINCT list of shared city names.
-- Hint: You will join the Application.Cities and Application.StateProvinces tables. Also, use a UNION construct to 
-- find the answer.

SELECT CityName
FROM Application.Cities c
INNER JOIN Application.StateProvinces s
    ON c.StateProvinceID=s.StateProvinceID
WHERE StateProvinceName = 'utah'
UNION 
SELECT CityName
FROM Application.Cities c
INNER JOIN Application.StateProvinces s
    ON c.StateProvinceID=s.StateProvinceID
WHERE StateProvinceName = 'wyoming'
