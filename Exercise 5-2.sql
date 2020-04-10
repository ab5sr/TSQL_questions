--1.
--Write a JOIN on Sales.Customers and Sales.Invoices to return all of the customers
--who have not been billed. Hint: Use an OUTER join. The join has two columns.


SELECT Customers.CustomerName, Sales.Invoices.invoiceid    
FROM Sales.Customers 
LEFT JOIN Sales.Invoices 
		ON Sales.Customers.CustomerID = Sales.Invoices.CustomerID 
		AND Sales.Customers.CustomerID = Sales.Invoices.BillToCustomerID
WHERE Sales.Invoices.CustomerID IS NULL



--2.If I query the sys.sysobjects internal table, I get 434 rows.
--What if I add the table again in the query and CROSS JOIN the two tables - how many rows will I have returned?
--(your result may vary slighly)
--(avoid running this in a production system)

--434 rows
SELECT *
FROM sys.sysobjects sysobj1 
    
--434 * 434 rows=188,356 rows    
SELECT *
FROM sys.sysobjects sysobj1
CROSS JOIN sys.sysobjects sysobj2
    
--I multiply 434 * 434; each row will be matched to every row of the second sys.sysobjects table.


 
--3.
--Write a Self Join on the Sales.Customers table joining the BillToCustomerID to the CustomerID.
--How many locations does the corporate accouting office handle for billing for Tailspin Toys?
--Hint: You need to count the number of locations where the BillToCustomerID=1.

SELECT HomeOffice.CustomerName AS HomeOfficeCustName
    ,Stores.CustomerName AS StoresCustNames
    ,HomeOffice.CustomerID AS HomeOfficeCustID
    ,Stores.CustomerID AS
FROM Sales.Customers as HomeOffice
INNER JOIN Sales.Customers as Stores
    ON HomeOffice.CustomerID = Stores.BillToCustomerID
WHERE  HomeOffice.CustomerID=1 --or WHERE HomeOffice.CustomerName='Tailspin Toys (Head Office)'


--4. (multi-problem question)
--
--a) copy the following - do not execute yet

CREATE TABLE StoreInventory
	(StoreID int 
	,Storesku varchar(10)
	,CreateDt datetime)


CREATE TABLE WarehouseInventory
	(WarehouseID int
	,WarehouseSKU varchar(10)
	,CreateDt datetime)

GO
INSERT INTO StoreInventory (StoreID, Storesku, CreateDt) VALUES (1,'Couch', GETDATE())
INSERT INTO StoreInventory (StoreID, Storesku, CreateDt) VALUES (1,'Chair', GETDATE())
INSERT INTO StoreInventory (StoreID, Storesku, CreateDt) VALUES (1,'Table', GETDATE())
INSERT INTO StoreInventory (StoreID, Storesku, CreateDt) VALUES (1,'Painting', GETDATE())


INSERT INTO WarehouseInventory (WarehouseID, WarehouseSKU, CreateDt) VALUES (1,'Painting', GETDATE())
INSERT INTO WarehouseInventory (WarehouseID, WarehouseSKU, CreateDt) VALUES (1,'Rug', GETDATE())
INSERT INTO WarehouseInventory (WarehouseID, WarehouseSKU, CreateDt) VALUES (1,'Planter', GETDATE())

--b) Without running this, analyze the data. What product will be in both the warehouse and the store inventory? A - painting
--c) Write an INNER JOIN on these two tables, joining on common SKU column (StoreSku joins to WarehouseSKU). Did it return only
--    the painting?


SELECT  Storesku, WarehouseSKU
FROM StoreInventory
INNER JOIN WarehouseInventory
    ON StoreInventory.Storesku = WarehouseInventory.WarehouseSKU

--d) Take the same query and change to a LEFT OUTER JOIN. What are the results?



SELECT  Storesku, WarehouseSKU
FROM StoreInventory
LEFT OUTER JOIN WarehouseInventory
    ON StoreInventory.Storesku = WarehouseInventory.WarehouseSKU


--results
Storesku	WarehouseSKU
Couch		NULL
Chair		NULL
Table		NULL
Painting	Painting


-- This result set says 'return all rows in the StoreInventory table and ONLY the matching rows in the WareHouseInventory
-- table, returning NULL for all non-matching rows.'

--e) Take the same query and change to a RIGHT OUTER JOIN. What are the results?



SELECT  Storesku, WarehouseSKU
FROM StoreInventory
RIGHT OUTER JOIN WarehouseInventory
    ON StoreInventory.Storesku = WarehouseInventory.WarehouseSKU


--results
Storesku	WarehouseSKU
Painting	Painting
NULL		Rug
NULL		Planter


-- This result set says 'return all rows in the WarehouseInventory table and ONLY the matching rows in the StoreInventory
-- table, returning NULL for all non-matching rows.'

--f) Take the same query and change to a FULL OUTER JOIN. Use the COALESCE function to return all of the row values,
-- regardless of where the item is located. Hint: the COALESCE will use both the StoreSku and WarehouseSku and inputs.


SELECT  COALESCE(Storesku, WarehouseSKu) AS InventoryAvailable
FROM StoreInventory
FULL OUTER JOIN WarehouseInventory
    ON StoreInventory.Storesku = WarehouseInventory.WarehouseSKU
 
 
--results
InventoryAvailable
Couch
Chair
Table
Painting
Rug
Planter

--5.
--
--Write a query that returns the 3 most populated cities in California. JOIN the Application.StateProvinces
--table and the Application.Cities table. Use TOP keyword to limit the results to 3.



SELECT TOP 3 StateProvinceName, CityName, C.LatestRecordedPopulation
FROM Application.StateProvinces AS S
JOIN Application.Cities AS C
    ON s.StateProvinceid = C.StateProvinceid
WHERE s.StateProvinceName =  'california'
ORDER BY  C.LatestRecordedPopulation DESC