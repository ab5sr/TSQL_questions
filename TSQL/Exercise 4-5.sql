--1.
--Given the below SELECT statements, supply the missing answers; try to derive the values
--without using Management Studio to run the queries. Can you guess what the answers are?

SELECT  ROUND( 55.6854 , 0) = 56
SELECT  ROUND( 55.6854 , 1) = 55.7
SELECT  ROUND( 55.6854 , 2) =
SELECT  ROUND( 55.6854 , 3) = 
SELECT  ROUND( 55.6854 , 4) = 55.684
    
--The third answer is 55.69 because you are rounding to 2 precision, and 5 rounds up to the next number, so
--8 will go to 9.

--The answer to the fourth question is 55.685; the number 4 rounds down, so 5 will not be incremented. The precision of 3
--returns 685, so the answer is 55.685.

--2.
--T/F__
-- The SQRT function handles only int data types? 
 
SELECT SQRT(9.3)
 
--F
--The SQRT works well for both integers and decimals. Use the SQUARE function and squar the value - it doesn't exactly equal 9.3...why?