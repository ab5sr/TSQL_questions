--1.
--Use your book, p. 212, to insert a row into the Warehouse.VehicleTemperatures table.
--Use random values to insert, choosing them at your own discretion.
--This syntax demonstrate INSERT...VALUES
 
INSERT INTO Warehouse.VehicleTemperatures
     (VehicleRegistration, ChillerSensorNumber,RecordedWhen, Temperature, FullSensorData, IsCompressed,CompressedSensorData)
VALUES ('Registration', -1,  '5/1/2020', 0.00, NULL, 1, NULL)

--notice that the first column - VehicleTemperatureID, was skipped; it has an IDENTITY property associated with it.
--I cannot explicitly INSERT and identity value without the proper syntax. 
--Therefore, I leave it out in order to let it generate my value automatically

--*** Write a query to check my insert
SELECT * FROM Warehouse.VehicleTemperatures WHERE RecordedWhen =  '5/1/2020'

--2.
--Insert that same row again that you inserted from execise 1. Again, refer to your book - p.212 - for help.
--This syntax demonstrates INSERT...SELECT

INSERT INTO Warehouse.VehicleTemperatures
     (VehicleRegistration, ChillerSensorNumber,RecordedWhen, Temperature, FullSensorData, IsCompressed,CompressedSensorData)
 SELECT VehicleRegistration, ChillerSensorNumber, RecordedWhen, Temperature, FullSensorData, IsCompressed, CompressedSensorData
 FROM Warehouse.VehicleTemperatures WHERE RecordedWhen =  '5/1/2020'

 --3.
 --Insert 1000 rows using the statement in exercise one. Hint: Search for 'Insert using GO batch directive' for help
 --using your favorite search engine.

 
INSERT INTO Warehouse.VehicleTemperatures
     (VehicleRegistration, ChillerSensorNumber,RecordedWhen, Temperature, FullSensorData, IsCompressed,CompressedSensorData)
VALUES ('Registration', -1,  '5/1/2020', 0.00, NULL, 1, NULL)
 GO 1000

 --*** Write a query to check my insert
SELECT COUNT(1) FROM Warehouse.VehicleTemperatures WHERE RecordedWhen =  '5/1/2020'

--4.
--Use a SELECT INTO in order to create the STRUCTURE of Warehouse.VehicleTemperatures table. Hint: no rows are needed.
--Create the new table name as dbo.SELECT_INTO_Test

SELECT * INTO
dbo.SELECT_INTO_Test
FROM Warehouse.VehicleTemperatures
WHERE 0=1
GO


--Question - Using the SELECT * INTO does the IDENTITY attribute get passed along to the new table? Do indexes?

--Demonstration for inserting a lot of random rows into the table - the following insert 50,000,000 rows into
-- the SELECT_INTO_Test table. It uses what is called a 'query hint' WITH TABLOCKX to speed up the insert.   

INSERT INTO SELECT_INTO_Test WITH (TABLOCKX)
     (VehicleRegistration, ChillerSensorNumber,RecordedWhen, Temperature, FullSensorData, IsCompressed,CompressedSensorData)
SELECT
      TOP 5000000  0,'',GETDATE(),0,'0',0, 0xa
FROM
    (
        SELECT a.*
        FROM sys.sysobjects a, sys.sysobjects b, sys.sysobjects c
    ) x
GO