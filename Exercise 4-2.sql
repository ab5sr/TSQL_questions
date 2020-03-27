--1
--Write a SELECT statement; using the Sales.OrderLines table, query to find
--OrderID=2. You should get two rows back. For StockItemID 50 only, multiply to return
--the Quantity * Unit Price. What is that value?

SELECT StockItemID, Quantity * UnitPrice  
FROM sales.orderlines
WHERE orderid=2
AND StockItemID=50

--117.00
--The tax rate for the above item is 15% (.15). Calculate the tax amount owed for 
--OrderID=2, StockItemID=50

SELECT StockItemID, (Quantity * UnitPrice * .15)
FROM sales.orderlines
WHERE orderid=2
AND StockItemID=50

--17.55
--Now, add both of the above (tax value and quantity * price) for StockItemID=50 on OrderID=2 to return the extended amount:

SELECT StockItemID, Quantity * UnitPrice  + (Quantity * UnitPrice * .15)
FROM sales.orderlines
WHERE orderid=2
AND StockItemID=50

--117.00 + 17.55 = 134.55 = extended amount

--2
--Analyze the following.
--2 % 2, 4 % 2 , 6 % 2 are similar in what way? Write the SELECT statements.

select 2%2
select 4%2
select 6%2

--1 % 2, 3 % 2, and 5 % 2 are similar in what way? Write the SELECT statements.

select 1%2
select 3%2
select 5%2

--Would it be reasonable to write a TSQL function
--that returns, then, the answer whether or not a given number is odd or even? How would it be determined?

--If the value % 2 is 0, then the number % 2 is even; otherwise, it's an odd number.

