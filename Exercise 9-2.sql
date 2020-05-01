--
--Write a SELECT statement and join the Application.Cities and the Application.StateProvinces table
--return only StateProvinceID and a COUNT
--for all Cities.LatestRecordedPopulation IS NOT NULL or
--Cities.LatestRecordedPopulation > 1000000

SELECT  SP.StateProvinceID, COUNT(1) AS cnt
  FROM [WideWorldImporters].[Application].[Cities] AS c
INNER JOIN Application.StateProvinces AS sp
    ON C.StateProvinceID = sp.StateProvinceID
WHERE StateProvinceName in ('TEXAS', 'CALIFORNIA')
AND (c.LatestRecordedPopulation IS NOT NULL
AND c.LatestRecordedPopulation > 1000000)
GROUP BY sp.StateProvinceID


--Change the OR to AND, and record your results.