--1.
-- DECLARE an integer variable and assign 22 to it; SELECT from the variable

DECLARE @int int=22
SELECT @int

--2.
-- DECLARE a variable of type tinyint and assign a value of 4000 to it. What is the result and why?

DECLARE @V tinyint = 4000
SELECT @V



--3.
--Create a variable of type varchar(10) and assign the following string to it:
--'Now is the time for all men good men to come to the aid of their country'
--and SELECT from it. What is the result?

DECLARE @str varchar (10) = 'Now is the time for all men good men to come to the aid of their country'
SELECT @str
GO

--What happened, above?

--4.
--What is the value after assigning to a variable? What happened?

DECLARE @ID Int = 123.4567
SELECT @ID

--The above is assigning a decimal type to an integer. The scale (or the number of digits to the right of the decimal place)
--is zero.


--5.
--What is the behavior of the following statements; compare the two and discuss

DECLARE @ID int, @ID1 int, @ID2 INT
    SET @ID=4
    SET @ID1=5
    SET @ID2=6

SELECT @ID, @ID1, @ID2
GO

DECLARE @ID int, @ID1 int, @ID2 INT
    SELECT @ID=4
        ,@ID1=5
        ,@ID2=6

SELECT @ID, @ID1, @ID2
GO

DECLARE @ID int, @ID1 int, @ID2 INT
    SET @ID=4
      ,@ID1=5
      ,@ID2=6

SELECT @ID, @ID1, @ID2

--The above demontrates that assignment with SELECT can be combined, and comma-separated; the SET statement cannot, and must be written
--for each assignment.
 
 --6.
 --This is an interesting statement. Guess what the result set is before running it.

DECLARE @id varchar(max)=''
SELECT @id = @id +  colorname FROM Warehouse.colors

SELECT @id 