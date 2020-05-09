 --1.
 --Write an IF statement that checks the count of the Purchasing.PurchaseOrderLines table; 
 --If it the COUNT is less than or equal to 8000 print a message. If the count is greater
 --than 8000 then print a message. Alias the result appropriately.


IF (SELECT COUNT(1) FROM [WideWorldImporters].[Purchasing].[PurchaseOrderLines]) <= 8000
                SELECT '<= 8000 rows' AS 'less than value'
ELSE
                SELECT '> 8000 rows' AS 'greater than value'
GO

 
--2.
--Use the statement above: Store the count of the Purchasing.PurchaseOrderLines into a variable named @cnt
--and create and IF statement using the variable 
 

DECLARE @cnt int;

SELECT @cnt = COUNT(*) FROM Purchasing.PurchaseOrderLines;
IF (@cnt) <=8000
                SELECT '<= 8000 rows' AS 'less than value'
ELSE
                SELECT '> 8000 rows' AS 'greater than value'
GO

--3
--Use the IIF() that you learned previously to rewrite question 2

DECLARE @cnt int;

SELECT @cnt = COUNT(*) FROM Purchasing.PurchaseOrderLines;
SELECT IIF( @cnt <= 8000, '<= 8000 rows' ,'> 8000 rows')

--Note: you can Alias only the result of the expression, and not the specific results within the IIF()

 --4.
 --Write an IF statement, and declare a variable. If the value is 'Cities' then SELECT the contents of the Application.Cities
 --table. Otherwise display the Application.StateProvinces table.


DECLARE @Value varchar(10)= 'Cities '

IF @value='states'   
    SELECT * FROM Application.StateProvinces
ELSE
    SELECT * FROM Application.Cities