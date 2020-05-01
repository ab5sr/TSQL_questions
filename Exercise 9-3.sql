--
--Full Text Search Excursion(Optional)

--First off, you must have Full-text Search installed. You cannot move forward until Full Text Indexing has been installed. 

SELECT FULLTEXTSERVICEPROPERTY('IsFullTextInstalled')
 
 --Highlight the follwing and hit the F5 key; this installs and activates Full Text objects in the database.

EXEC [Application].[Configuration_ApplyFullTextIndexing]
 

SELECT *
FROM Application.People
WHERE CONTAINS(CustomFields, '2010');

--Highlight the following and hit F5 to execute; this returns a JSON object(s) in the result set. (Double click results to see JSON).
-- This procedure joins several tables and takes advantage of full text search.


EXEC Website.SearchForPeople 'adrian', 4
EXEC Website.SearchForPeople 'adriana', 4 
EXEC Website.SearchForPeople 'ad', 12  

--Run the first and then the second statement. Notice that this is not LIKE, as can be seen for statement #3.

--Suppose someone went online and was looking for a gift for a database administrator; they are looking for something with
--the SELECT keyword. Highligh the next line and then execute it (hit F5)


EXEC Website.SearchForStockItems 'SELECT', 10

--here is the result set that is returned:

{
    "StockItems": [
        {
            "StockItemID": 26,
            "StockItemName": "DBA joke mug - SELECT caffeine FROM mug (White)"
        },
        {
            "StockItemID": 27,
            "StockItemName": "DBA joke mug - SELECT caffeine FROM mug (Black)"
        }
    ]
}


--Run the following
CREATE FULLTEXT CATALOG SampleCatalog

--Now, I am going to create a Full Text index on Application.Cities table:


CREATE FULLTEXT INDEX ON Application.Cities

( 
  CityName
) 

KEY INDEX [PK_Application_Cities] ON SampleCatalog --Unique index 
WITH CHANGE_TRACKING AUTO            --Population type; 
GO

--Now go query the CityName column

SELECT *
FROM Application.Cities
WHERE CONTAINS(cityname, 'jones');

  
--here is another query using CONTAINSTABLE:  
 
SELECT   FT_TBL.cityName, KEY_TBL.RANK 
FROM Application.Cities FT_TBL  
INNER JOIN CONTAINSTABLE(application.cities, cityName,  
       'ISABOUT (jones WEIGHT (.8)  )' ) AS KEY_TBL 
       ON FT_TBL.CityID= KEY_TBL.[KEY] 
ORDER BY KEY_TBL.RANK DESC; 

GO 

--Now add(with a commma jon WEIGHT (.6)) after jones (WEIGHT (.8)) and view the results
--What RANK do you get in your results?
 