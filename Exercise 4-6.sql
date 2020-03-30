--1.
--Write a CASE statement - follow the instuctions below
-- a) Write the SELECT statement to the Purchasing.PurchaseOrders table
-- b) The CASE statement is written to the DeliveryMethodID column
--	   If DeliveryMethodID is equal to either 7,8.9.10, then display 'Freight'
--		Otherwise, display 'Other/Courier'
-- c) Alias this column DeliveryMethod
-- d) Return only the PurchaseOrderID and the CASE expression columns.

--Hint: use the 'Searched Case' example in your textbook.

SELECT PurchaseOrderID		
	,CASE WHEN DeliveryMethodID IN (7,8,9,10) THEN 'Freight'		
		ELSE 'Courier/Other'
	END AS DeliveryMethod
FROM Purchasing.PurchaseOrders

--2.
--Write the exact statment that you did for #1, this time using the IIF() function.

SELECT PurchaseOrderID		
	  , IIF(DeliveryMethodID>=7, 'Freight', 'Courier/Other')  as DeliveryMethod 
FROM Purchasing.PurchaseOrders

--3
--Run the following (Highlight and hit F5 to execute) in a query window:

DROP TABLE IF EXISTS #Test;
CREATE TABLE #Test
		(ID int IDENTITY
		,PlantName varchar(20)
		,Jan2020Temp varchar(3)
		,Feb2020Temp varchar(3)
		,Mar2020Temp varchar(3)
		)

INSERT #Test (PlantName, Jan2020Temp, Feb2020Temp, Mar2020Temp) VALUES ('PlantA', '80°', NULL,NULL)
INSERT #Test (PlantName, Jan2020Temp, Feb2020Temp, Mar2020Temp) VALUES ('PlantB', NULL, '75°', NULL)
INSERT #Test (PlantName, Jan2020Temp, Feb2020Temp, Mar2020Temp) VALUES ('PlantC', NULL,NULL,'60°')

--Write a SELECT statement using COALESCE to interrogate all of the columns in the #Test table
--And return the last known temperature recorded. If there is no temperature, default 'No temp reported'.

SELECT COALESCE(Jan2020Temp, Feb2020Temp, Mar2020Temp, 'No temp reported') AS LastTempRecorded
FROM #Test