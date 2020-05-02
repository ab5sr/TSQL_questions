

--1.
--Write an UPDATE statement to the [WideWorldImporters].[Sales].[Orders] table
--to update the PickedByPersonID to 1 WHERE it is currently NULL

--*** Best practice is to, for a Bulk INSERT, UPDATE, DELETE statement, write it first as a SELECT
--statement to see the rows affected. 
SELECT * FROM Sales.Orders
WHERE PickedByPersonID IS NULL


UPDATE [WideWorldImporters].[Sales].[Orders]
SET PickedByPersonID = 1
WHERE PickedByPersonID IS NULL

--2.
-- Write an UPDATE statement that UPDATES InternalComment to DeliveryInstructions if there is no InternalComment (it is NULL)

UPDATE [WideWorldImporters].[Sales].[Orders]
SET InternalComments = COALESCE(InternalComments, DeliveryInstructions)
GO

--You could write the UPDATE....WHERE InternalComments IS NULL, but the above is more succinct.
