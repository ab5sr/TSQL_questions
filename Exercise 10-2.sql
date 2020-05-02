--1.
--Using DELETE, remove all rows that were inserted using the recorded when in the WHERE clause
--
--Best practice is that while developing write all of your DELETE statements first as a SELECT statement
--in order to see exactly what is being affected.
-- SELECT COUNT(*) FROM  Warehouse.VehicleTemperatures WHERE RecordedWhen =  '5/1/2020'

DELETE FROM Warehouse.VehicleTemperatures WHERE RecordedWhen =  '5/1/2020'

--Notice how DELETE returns a row count for affected rows...
--2.
--Use TRUNCATE to quickly DELETE all rows in the SELECT_INTO_Test. As you can see, I have also DROPped the table to clean-up.

--Notice that TRUNCATE does not return a row count for affected rows...
TRUNCATE TABLE SELECT_INTO_Test
GO
SELECT COUNT(1) FROM SELECT_INTO_Test
GO
DROP TABLE IF EXISTS SELECT_INTO_Test
GO