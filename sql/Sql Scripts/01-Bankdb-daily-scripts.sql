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
 
select * from customers where customerid in(1,10);
select * from Customers where CustomerID between 1 AND 10;

--=============================Practice 10/June/2026 ===================================================
-- INSERT INTO => using column name with values 
--             => without column names with values only
-- UPDATE => remember to use where clause otherwise it will update all the records in the table
-- DELETE => Single Delete OR Full Table data delete by keeping table schema
--        => Remember to use where clause otherwise it will delete all the records in the table
-- SELECT INTO => Create a new table and insert the data into it from another table
-- ALIAS => Column Alias, Table Alias
-- UNION => Slow, combine unique records from two or more select statements.
-- UNION ALL => Fast, combine all records from two or more select statements including duplicates.
--        => Remember CurrentCustomer and ArchiveCustomer tables example
-- DROP => Delete entire table
