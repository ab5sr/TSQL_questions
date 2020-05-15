--1.
--Write a User-Defined function named Greatest that inputs two decimals and returns the
--greater of the two.

CREATE FUNCTION sys.Greatest (@parm1 decimal (10,2), @parm2 decimal (10,2))
RETURNS decimal (10,2)
AS
BEGIN
      RETURN (CASE WHEN @parm1 > @parm2 THEN @parm1 ELSE @parm2 END)
END
GO

SELECT dbo.Greatest(27,7) as Greatest
GO

--2.
--Write a User-Defined function named temperature; you supply a numerical value Farenheit and a 'c' denoting that the results should be in Celcius
--or a numerical value and an 'F', indicating that the value is Celcius and the funtion should convert the value to Farenheit and return it.
--Hint: search for the conversions using your favorite search engine. You can also check your work on the internet.


CREATE FUNCTION temperature (@temp int, @ReturnUnitsIn char(1))
RETURNS INT
AS
BEGIN
    DECLARE @Result int = 0
    IF @ReturnUnitsIn = 'C'
        SET @Result = (@temp - 32 / 1.8)
    ELSE IF @ReturnUnitsIn = 'F'
        SET @Result = (@temp * 1.8) + 32

    RETURN @result
END
GO

SELECT dbo.Temperature( 0 , 'f')



