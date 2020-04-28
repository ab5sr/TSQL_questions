--1.
--Write a simple query that adds a new column title 'rownum' that increments each
--row by 1 on a SELECT statement to the Sales.OrderLines table.

SELECT ROW_NUMBER() OVER (Order By OrderID) AS rownum
    ,*
FROM Sales.OrderLines

--2.Change the above query to use DENSE_RANK() instead of ROW_NUMBER().
--How does this column compare to each OrderLineID row?

SELECT DENSE_RANK() OVER (Order By OrderID) AS rownum
    ,*
FROM Sales.OrderLines


--3.
--What Windowing function would you use to generate 10 near-sized partitions over a set
--of data

You could use NTILE(10) in order to get 10 nearly equal partitions; these could the be used
as grouping 'buckets', and the MIN and MAX of each bucket could be used in a CASE statement.