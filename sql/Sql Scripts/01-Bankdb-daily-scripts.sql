USE BANKDB;

select * from Loans;

Select * from Branches;

Select * from Customers;

Select * from Transactions;

Select * from AccountDetails;

Select * from  INFORMATION_SCHEMA.TABLES;
Select TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, COLUMN_DEFAULT, IS_NULLABLE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH 
from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Loans';


--=============================Practice 08/06/2026 ===================================================
-- Q1 
Select c.FirstName +' '+ c.LastName as fullName ,c.Mobile from Customers c;
-- Q2
Select * from Customers where BranchID = 45;
-- Q3
Select * from AccountDetails where AccountType = 'Savings';
-- Q4 
Select * from Transactions where TransactionType ='Credit';
Select sum(Amount) from Transactions where TransactionType = 'Credit';
-- Q5
Select * from Customers where Email is null;
Select sum(customerId) from Customers where Email is null;