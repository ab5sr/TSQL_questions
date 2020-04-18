
--1.
--Write a query according the below specification - your boss wants a COUNT of orders ordered from our suppliers.
-- Columns needed: SupplierID, SupplierName, SupplierCategoryName, FullName, PhoneNumber, FaxNumber, WebsiteURL, COUNT(PurchaseOrderID) 
-- Tables to join: Purchasing.Suppliers, Purchasing.SupplierCategories, Application.People, Purchasing.PurchaseOrders
-- HINT: Join Application.People on Supplier.PrimaryContactPersonID = Application.People.PeopleID
-- All are INNER JOINS except the join to the Purchasing.PurchaseOrders table, since not all Suppliers have purchased from our company.

SELECT s.SupplierID,
       s.SupplierName,
       sc.SupplierCategoryName,
       pp.FullName AS SupplierContact,  
       s.PhoneNumber,
       s.FaxNumber,
       s.WebsiteURL,
       COUNT(O.PurchaseOrderID) AS CountaOfPOs
FROM Purchasing.Suppliers AS s
JOIN Purchasing.SupplierCategories AS sc
    ON s.SupplierCategoryID = sc.SupplierCategoryID
  JOIN [Application].People AS pp
ON s.PrimaryContactPersonID = pp.PersonID
LEFT OUTER JOIN Purchasing.PurchaseOrders O   
    ON O.SupplierID = s.SupplierID
GROUP BY
 s.SupplierID,
       s.SupplierName,
       sc.SupplierCategoryName,
       pp.FullName, 
       s.PhoneNumber,
       s.FaxNumber,
       s.WebsiteURL



GO
--
-- There are some suppliers that have never fufilled a purchase to WideWorlImporters:
SELECT * FROM  [Website].[Suppliers] s
WHERE NOT EXISTS 
        (SELECT * FROM Purchasing.PurchaseOrders o WHERE s.SupplierID=o.SupplierID)
 