--1.
--Create a temp table named TestTemp with the following specifications:
--ID int PRIMARY KEY, val1 varchar(20), val2 varchar(30)


CREATE TABLE #TestTemp
    (ID int PRIMARY KEY
    ,val1 varchar(20)
    ,val2 varchar(30)
    )


--2.
--Create the table in excercise 1 as a table variable

DECLARE @TestTemp TABLE
    (ID int PRIMARY KEY
    ,val1 varchar(20)
    ,val2 varchar(30)
    )
GO

--3.
--Insert a row (below) into the table variable created in quesion 2, SELECT FROM the table, and then update the value of val1 to 'test'
--ID=1, val1='', val2='value'. Issue another SELECT from the table to see the final result.
--Hint: run all statements together in one 'batch'

DECLARE @TestTemp TABLE
    (ID int PRIMARY KEY
    ,val1 varchar(20)
    ,val2 varchar(30)
    )

INSERT INTO @TestTemp (ID, val1, val2)
VALUES (1, '', 'value');

SELECT * FROM @TestTemp;
 
UPDATE @TestTemp
SET val2 = 'test';
 
SELECT * FROM @TestTemp;

