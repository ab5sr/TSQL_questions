--1.
--In a query window, issue a BEGIN TRANSACTION and then close the window. What is the message? Explain?

--SQL Server Management Studio warnd that "There are uncommitted transactions. Do you wish to commit these transactions?". This indicates that
--there are open transactions that are pending, and that I have forgotten to close any explicit transactions. Generally I say no if I ever run
--into this message because I don't know what I am comitting!

--2.
--In a query window, begin a transaction and then update the Application.Cities table, setting CityName
--to UPPER case for CityID = 132.
--Then, open another query window. SELECT * from the Application.Cities table. What happens?

BEGIN TRAN
    UPDATE Application.Cities
    SET CityName = UPPER(CityName)


SELECT * FROM Application.Cities WHERE CityID=132

-- The query returns no rows, and seems to 'hang'. This is because an OPEN transaction existst, and no other connections
--can query the table
--Issue a ROLLBACK TRAN to rollback the UPDATE statement.

ROLLBACK

--3.
--Issue a BEGIN TRAN
--Run a SELECT * INTO #test from the Application.Cities table.
--Issue a ROLLBACK statement in the same window. Now run a query on #test; what happened to the table?

BEGIN TRAN
SELECT *
INTO #test
FROM Application.Cities
GO

ROLLBACK TRAN
GO
SELECT * FROM #test

--You receive an "Invalid object name '#test' error, because you have rolled back the previous SELECT * INTO statement.
--and the table does not exist.


