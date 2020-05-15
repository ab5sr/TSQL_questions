--1.
--In SQL Server Management Studio, search for the 'views' folder within the WideWorldImporters database
--Right click on Website.Customers view, and do Script View As > Create to > New Query Editor Window
--Examine this 7 table view. SELECT a few rows from the view. 

--2.
--Create a view in the Application schema that point to Application.Cities. The view should have the following
--columns, in order:

--(1) CityID
--(2) StateProvinceID, with and alias of StateID
--(3) CityName

--Name the view CityView


CREATE VIEW Application.CityView
AS
SELECT CityID
        ,StateProvinceID AS StateID
        ,CityName
FROM Application.Cities

--3.
--Create a view that displays the % of backorders to total orders in the Sales.Orders table
--The result should be CAST as a decimal (5,3)
--name the view vw_BackorderPct


CREATE VIEW vw_BackorderPct
AS
SELECT CAST((COUNT(BackorderOrderID) * 1.0 / COUNT(OrderID)) * 100 AS DECIMAL (5,3)) AS BackPct
FROM Sales.Orders


