--For those interested, here is a very simple trigger.
--Although SQL Server triggers are not covered in this book at mentioned, this is an example of one.
--A trigger can be thought of as a stored procedure associated with a table.
--For the most part, triggers are hard to debug and can be confusing; having said that, this example
--is neither, thus a handy addition.

DROP TABLE IF EXISTS dbo.Customers
go
CREATE TABLE dbo.Customers
	(ID int IDENTITY
		,FirstName varchar(70)
		,LastName varchar(80)
		,CreateDate datetime DEFAULT GETDATE()
		,ModifyDate datetime
		,CreateUser varchar(50) DEFAULT SYSTEM_USER
		,ModifyUser varchar(50)
		)
GO

CREATE TRIGGER trCustomers
ON Customers
AFTER UPDATE 
AS
BEGIN
SET NOCOUNT ON
	UPDATE Customers
		SET ModifyDate=GETDATE()
		,ModifyUser=SYSTEM_USER
	WHERE ID IN 
			(SELECT ID FROM Inserted i)
END
GO

INSERT INTO Customers(FirstName,LastName) VALUES ('Joe','Smith')
GO
INSERT INTO Customers(FirstName,LastName) VALUES ('Mary','Jones')
GO

SELECT * FROM Customers
GO
UPDATE dbo.Customers SET FirstName='Jack'
WHERE ID=1

SELECT * FROM Customers
GO

DROP TABLE IF EXISTS dbo.Customers
GO