--1.
--Create a table according to the following specifications:
--(1) Name: chapter14
--(2) The first column should be called ID of type int, and it is an IDENTITY column with a Primary Key constraint
--(3) The second column name is ColA of type int.
--(4) The third column is a computed column - name is ColB and it equals Cola *2
--(5) The fourth column name is CreateDate, of type datetime, with a DEFAULT of GETDATE()

--Insert a row and display the results
--Hint: only ColA will have a value inserted into the table.

DROP TABLE chapter14
GO
CREATE TABLE chapter14
    (ID INT IDENTITY (1,1) NOT NULL PRIMARY KEY
    ,ColA INT
    ,ColB AS COLA*2
    ,CreateDate datetime DEFAULT GETDATE()
    )
GO
INSERT INTO chapter14 (COLA) VALUES (3)
GO
SELECT * FROM chapter14
GO