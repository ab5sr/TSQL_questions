--1.
--Write a SELECT statement that lists only the StateProviceCode and the StateProvinceName
--from the Application.StateProvinces table in the WideWorldImporters database. Include an literal value - 
--State Abbr/Name (Pp. 31, 35) as the first column in the SELECT list. Do not alias the column.

SELECT
      'State Abbr/Name:' 
      ,[StateProvinceCode] 
      ,[StateProvinceName]
 FROM [WideWorldImporters].[Application].[StateProvinces];
 GO

--2.
--In question #1, what value for 'St Abbr/Name:' is defaulted as the column name?
(No column name) is visually defaulted as the header row value, however this is not a valid alias for the column; each column should have a name.
Add AS [ST/Name] as the column alias.

    SELECT
        'State Abbr/Name:' AS [ST/Name] 
        ,[StateProvinceCode] 
        ,[StateProvinceName]
    FROM [Application].[StateProvinces];

--3.
    SELECT '[Application].[StateProvinces]' AS table
    GO
--Run the above SELECT statement - what are the results?
--What happens if [] encloses the word table?
    SELECT '[Application].[StateProvinces]' AS [table]
    GO
--The word table is a reserved word in this case, and must either be wrapped in brackets [], or optionally single/double quotes.