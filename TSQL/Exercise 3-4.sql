--1
-- Write a SELECT statement to the Purchasing.Supplier table in the WideWorldImporters datbase; return
--the five rows where there is no DeliveryMethodID. OK to use *.

SELECT 
        *
FROM [WideWorldImporters].[Purchasing].[Suppliers]
WHERE DeliveryMethodId IS NULL

--2
--NULL values are not desirable. Brainstorm, and list three reasons for the NULL that you learned in this chapter. 

--Here a possible answers that are valid:

--a) A CSR forgot to enter the DeliveryMethodID into the system
--b) The DeliveryMethodID will get specified in the future by the system
--c) There was no valid delivery method
--d) The valid delivery method will be specified in the future as it is processed.
--e) The DeliveryMethodID is missing.
--F) A representative has the ID on a post-it note on her desk; she made a note and will input later.
