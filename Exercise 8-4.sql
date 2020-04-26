--1.
--Copy and execute the following SQL statement:
--Write a LAG/LEAD statement to get the value for rate two rows following.

DROP TABLE IF EXISTS Rates
GO

CREATE TABLE Rates
        (ID INT IDENTITY
        ,City varchar(20)
        ,Rate decimal (5,2)
        ,Logdate datetime)

INSERT Rates (city, rate, logdate) VALUES ('dallas',  1.5, '4/1/20')
INSERT Rates (city, rate, logdate) VALUES ('dallas',  2.5, '4/11/20')
INSERT Rates (city, rate, logdate) VALUES ('dallas',  4, '4/12/20')
INSERT Rates (city, rate, logdate) VALUES ('dallas',  3.5, '4/13/20')
INSERT Rates (city, rate, logdate) VALUES ('dallas',  2.5, '4/14/20')
INSERT Rates (city, rate, logdate) VALUES ('dallas',  .5, '4/15/20')

SELECT 
  *,
  (lead(rate, 2) over (order by logdate)) AS [Projection 2 days]  
FROM Rates 

--2.
--Using the table dbo.Rates (from question #1) use the FIRST_VALUE function to
--show that 4/1/2020 is the value which repeats for each row.

SELECT *, FIRST_VALUE(logdate) OVER (ORDER BY ID)
FROM Rates 

--4/1/2020 is the FIRST_VALUE date; it repeats for each row in the result set.
 
--3.
--Using the table dbo.Rates, use the PERCENT_RANK function to display the rate which is 80% higher than all
--other rates.
--Hint:Order by Rate in the Window

SELECT *, PERCENT_RANK() OVER (ORDER BY Rate)
FROM Rates  

--The answer is the row that has 3.5 as the rate; this is greater than .8 (80%) of the other rates