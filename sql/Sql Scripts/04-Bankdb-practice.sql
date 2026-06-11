USE BankDB;

select * from Loans;

Select * from Branches;

Select * from Customers;

Select * from Transactions;

Select * from AccountDetails;

--======================== 10 july 2026 ==============================================

Insert into Customers 
values('mayur','gaikwad','2002-03-05','7030505545','mayurg2@gmail.com','',34, GETDATE() );


Select * from Customers;

update Customers 
set PAN='ABGLA5545A'
where customerId=47;

Insert into Customers(FirstName, LastName, Email, BranchID)
values('akshay','jadhav', 'ak@gmail.com',45);

Insert into Customers(FirstName, LastName, BranchID)
values('poonam','salunkhe',23);

update Customers
set 
	email = 'poonam@gmail.com',
	pan = 'PABXA4515A'
where 
	CustomerID = 49 and FirstName = 'poonam';

Select * from Customers where CustomerID = 49;

Insert into Customers(FirstName, LastName, BranchID)
values('test','lastname',34);

Select * from Customers where CustomerID = 51;

Update Customers
set
	Email = 'test@gmail.com',
	PAN = 'AABBC3452D'
where
	customerId = 51;

Delete from Customers where CustomerID = 51;

-- SELECT * INTO
Select * Into NewCustomer from Customers;

Select * from NewCustomer;

Delete from NewCustomer where CustomerID between 46 and 49;

-- UNION
Select * from Customers
UNION  
Select * from NewCustomer;

-- UNION ALL
Select * from Customers
UNION ALL
Select * from NewCustomer;


-- Create new table and then delete it all data and then entirely table
Select * INTO ArchiveCus from Customers;

Select * from ArchiveCus;

--Delete from ArchiveCus;

Insert into ArchiveCus(FirstName, LastName, BranchID, CreatedDate)
values('Shubham','Gaikwad',20, GETDATE());

Select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME= 'ArchiveCus';

-- DROP
--drop table ArchiveCus;