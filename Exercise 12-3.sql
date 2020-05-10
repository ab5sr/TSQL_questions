--1.
--What is the behavior of the following snippet of code? Why?

WHILE 1=1
    PRINT 'Oops'

--This is the dreaded infinte loop; there is no BREAK or condition which exits the loop, so therefore it has nothing to end the loop.

--2.
-- What does the following loop do? 


DECLARE @cnt int = (SELECT MIN(PersonID) FROM Application.People)


WHILE (@cnt IS NOT NULL)
BEGIN
    SELECT * FROM Application.People WHERE PersonID=@cnt

    SET @cnt = @cnt+1
END

--3.
--Using the above code, write a loop that, when the variable @cnt reaches 10, it exits the loop
--Question: does PersonID = 10 print? Why or why not.


DECLARE @cnt int = (SELECT MIN(PersonID) FROM Application.People)


WHILE (@cnt IS NOT NULL)
BEGIN
    SELECT * FROM Application.People WHERE PersonID=@cnt

    SET @cnt = @cnt+1

    IF @cnt=10
        BREAK;
END


--The @cnt variable gets increased to 10, follow by the BREAK in the next statement block. Therefore it exits before going back
--to the top of the loop and printing the results.