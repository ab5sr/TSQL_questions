--1
--Write a query to the Application.People table and format the output it as below, using only Fullname and SearchName.

--Bijoya Thakur (Bijoya Bijoya Thakur)

--Accomplish the following in your query:
    --(a) use CONTACT() and concatenate Fullname, and SearchName
    --(b) add left and right parenthesis around SearchName
    --(c) Include a space between FullName and ( left parenthesis
    --(d) Using what you have learned thus far, return ony FullNames that begin with A and B
    --(e) Order the resultset by FullName ASC

SELECT CONCAT(FullName, ' (', SearchName, ')')
FROM Application.People
WHERE FullName BETWEEN 'a'  AND 'c'
ORDER BY FullName

--For the answer I used Concat, although adding strings would achieve the same result. CONCAT handles any NULL values for me.
--I could have added an additional space to the above query but decided just to add it to the left of the left parenthesis.
--Use BETWEEN to filter out unwanted names.
--ORDER BY FullName is added, ASC is the default and does not need to be specified.

--2.
--The question above brings up an intesting point. Run the following:

SELECT *
FROM Application.People
WHERE PersonID BETWEEN 1 AND 3

--the BETWEEN operator returns a PersonID of 1,2,3, because BETWEEN returns inclusively the secified values.

--Now run the following:

SELECT *
FROM Application.People
WHERE FullName BETWEEN 'sv' AND 'tb'
ORDER BY FullName

--It doesn't appear that BETWEEN returns inclusively the desired values (or does it?)

--It does return the correct values; study the result set.
--sv or greater, and fullname = tb or less are returned, so the boundaries sv and tb inclusively are returned.

--3. Write a query to the Application.Cities table, returning only CityName, LatestRecordedPopulation
-- Use COALESCE or ISNULL to return 0 for those citied not reporting a LatestRecordedPopulation.

SELECT  [CityName]       
      ,[LatestRecordedPopulation]
      ,ISNULL(LatestRecordedPopulation, 0)
  FROM  [Application].[Cities]

--4 In the above query, suppose I wanted to default 'N/A' rather than 0 for no LatestRecordedPopulation. What is the outcome?

SELECT  [CityName]       
      ,[LatestRecordedPopulation]
      ,ISNULL(LatestRecordedPopulation, 'N/A')
  FROM  [Application].[Cities]

--The error is returned
--Msg 8114, Level 16, State 5, Line 1
--Error converting data type varchar to bigint.

--The reason for this is that the query is looking for LatestRecordedPopulation to return a bigint, and our query is trying to
--return a string 'N/A' for the result and these are incompatible types.