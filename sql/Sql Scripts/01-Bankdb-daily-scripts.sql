USE BANKDB;

select * from Loans;

Select * from Branches;

Select * from Customers;

Select * from Transactions;

Select * from AccountDetails;

Select * from  INFORMATION_SCHEMA.TABLES;
Select TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, COLUMN_DEFAULT, IS_NULLABLE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Loans';


--=============================Practice 08/June/2026 ===================================================
-- Select => * , colnames
-- Order By => ASC, DESC
-- Where => AND, OR
-- TOP
-- DISTINCT
-- PERCENT
-- COUNT
-- LIKE
-- AS => Alias
-- 
--=============================Practice 09/June/2026 ===================================================
-- WILDCARD
-- BETWEEN
-- NOT BETWEEN
-- IN
-- NOT IN

-- IN
select * from customers where customerid in(1,10);
select * from Customers where CustomerID between 1 AND 10;

 