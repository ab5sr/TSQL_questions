--1.
--JOIN the Application.Countries table with the Application.StateProvinces table.
--Use an INNER JOIN, returning only the CountryName, Subregion from the Application.Countries table
--and the StateProvinceName from the Application.StateProvinces table.
--Hint: use CountryID as the JOIN column to join the two tables.

SELECT 
        Application.Countries.CountryName
        ,Application.Countries.Subregion
        ,Application.StateProvinces.StateProvinceName
FROM Application.Countries 
INNER JOIN Application.StateProvinces
    ON Application.Countries.CountryID = Application.StateProvinces.CountryID
 
 --2.
 --Write the above query using 'aliases' as your book did to eliminate the use of full table names for table and column identifiers used in exercise above:

SELECT c.CountryName
        ,c.Subregion
        ,SP.StateProvinceName
FROM Application.Countries AS c
INNER JOIN Application.StateProvinces AS SP
    ON c.CountryID = SP.CountryID
 
--The letter 'c' is used to alias Application.Countries, and 'SP' is used to alias Application.StateProvinces. These
--were picked for no particular reason. It is a best-practice to alias columns in the SELECT list because if the column is in more
--than one table, SQL Server will not know which table you are referring to

--Normally you would not alias as such:

SELECT a.CountryName
        ,a.Subregion
        ,b.StateProvinceName
FROM Application.Countries AS a
INNER JOIN Application.StateProvinces AS b
    ON a.CountryID = b.CountryID

--When you see aliasesm such as a, b, c, d, beware! These may or may not readily identify a table.

--3.
--Run the following
--You have seen how column name can represent the same data element yet have different names...
--(BusinessEntityID and PersonID)
--Will a join work if the data types are different for the JOIN columns?


CREATE TABLE #Parent
    (ParentID varchar(10) PRIMARY KEY
    ,ParentName varchar(10)
    ,LoadDate datetime )
GO
CREATE TABLE #Child
    (ChildID int PRIMARY KEY
    ,ParentID DECIMAL
    ,LoadDate datetime )

 GO	

INSERT INTO #Parent (ParentID, ParentName, LoadDate) VALUES ('0123', 'Pname', GETDATE())
INSERT INTO #Child (ChildID, ParentID,  LoadDate) VALUES (999, 123, GETDATE())

GO

--Pretend that the #Parent table is on a disparate system; that system specification for ParentID is a vachar(10)
--but on the local system it has been built as a DECIMAL specification.

--In this case I would modify the ParentID in the #Child table, first CASTing it to a string and then adding a 0 to the
--front of the value to match the #Parent table.

SELECT *
FROM #Parent AS p
INNER JOIN #Child AS c
    ON p.ParentID =  '0'+ CAST(c.ParentID AS varchar(9))

