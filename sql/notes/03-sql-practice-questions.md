# SQL Practice Questions — BankDB Dataset

## Tables Reference

| Table          | Key Columns                                                                                                       |
| -------------- | ----------------------------------------------------------------------------------------------------------------- |
| Customers      | CustomerID, FirstName, LastName, DOB, Mobile, Email, PAN, BranchID, CreatedDate                                   |
| AccountDetails | AccountID, AccountNumber, CustomerID, BranchID, AccountType, Balance, OpenDate, IsActive                          |
| Transactions   | TransactionID, AccountID, TransactionDate, Amount, TransactionType, Reference, BalanceAfter                       |
| Loans          | LoanID, LoanAccountNumber, CustomerID, BranchID, LoanType, Principal, InterestRate, StartDate, TermMonths, Status |

---

## Beginner Level (Q1–Q15)

**Q1.** Get the full name and mobile number of all customers.

**Q2.** List all customers who belong to BranchID 45.

**Q3.** Show all accounts where AccountType is `Savings`.

**Q4.** Get all transactions where TransactionType is `Credit`.

**Q5.** List all customers whose Email is NULL.

**Q6.** Show all accounts with Balance greater than 50000.

**Q7.** Get all loans with Status = `Active`.

**Q8.** List all customers sorted by LastName in ascending order.

**Q9.** Show the top 5 accounts with the highest Balance.

**Q10.** Count the total number of customers in the Customers table.

**Q11.** Get all transactions where Amount is between 5000 and 50000.

**Q12.** List all accounts that are currently inactive (IsActive = 0).

**Q13.** Show all loans where LoanType is `Home Loan`.

**Q14.** Get all customers whose FirstName starts with the letter `A`.

**Q15.** Show the total number of accounts per AccountType.

## Intermediate Level (Q16–Q35)

**Q16.** Get the full name of each customer along with their AccountType and Balance.
_(Join Customers and AccountDetails)_

**Q17.** List all customers who have more than one account.

**Q18.** Find the total balance across all Savings accounts.

**Q19.** Get customer name, loan type, and loan status for all active loans.
_(Join Customers and Loans)_

**Q20.** Show all transactions along with the AccountNumber of the account used.
_(Join Transactions and AccountDetails)_

**Q21.** Find all customers who do NOT have any loan.
_(Use NOT IN or NOT EXISTS)_

**Q22.** Get the average balance for each AccountType.

**Q23.** List all customers who have a loan but no active account.

**Q24.** Show the total Credit and total Debit amount for each AccountID.
_(Use GROUP BY with CASE or two separate aggregates)_

**Q25.** Get the most recent transaction date for each AccountID.

**Q26.** Find all accounts where Balance is less than the average balance of all accounts.

**Q27.** List customers who joined (CreatedDate) in the year 2023.

**Q28.** Get the branch-wise count of customers.

**Q29.** Show the loan with the highest Principal for each LoanType.

**Q30.** Find all customers whose DOB is NULL and who also have an active account.

**Q31.** Get full name, account balance, and loan principal for customers who have both an account and a loan.
_(Join all three: Customers, AccountDetails, Loans)_

**Q32.** List all transactions where Reference is NULL.

**Q33.** Find the branch that has the highest total loan principal.

**Q34.** Show all customers who have a `Defaulted` loan.

**Q35.** Get the count of loans grouped by Status.

## Advanced Level (Q36–Q50)

**Q36.** Rank customers by their total account balance (sum of all accounts) using `RANK()`.

**Q37.** Get the latest transaction per account using `ROW_NUMBER()`.

**Q38.** Find the running total of transaction amounts for AccountID = 10, ordered by TransactionDate.

**Q39.** Show each customer's name, their account balance, and the difference between their balance and the average balance of all accounts.

**Q40.** Using a CTE, find all customers who have a total loan principal above 1,000,000.

**Q41.** Get the second highest Balance from the AccountDetails table.

**Q42.** Find duplicate Mobile numbers in the Customers table (if any).

**Q43.** Using `DENSE_RANK()`, rank loans within each LoanType by InterestRate descending.

**Q44.** Get the previous transaction amount for each transaction in the same account using `LAG()`.

**Q45.** Find all accounts that have had no transactions recorded in the Transactions table.
_(Use NOT EXISTS or LEFT JOIN)_

**Q46.** Using a CTE, calculate the total amount credited and debited per account, then show only accounts where total credits exceed total debits.

**Q47.** Find customers who have loans in more than one LoanType.

**Q48.** Show the month-wise count of transactions for the year 2024.

**Q49.** Get the top 3 branches by total account balance using `DENSE_RANK()`.

**Q50.** Write a query to show each customer's name, their account type, loan type, loan status, and latest transaction amount — all in one result.
_(Multi-table join with subquery or CTE for latest transaction)_

## Answer Key

<details>
<summary>Click to expand answers</summary>

**A1.**

```sql
SELECT FirstName + ' ' + LastName AS FullName, Mobile FROM Customers;
```

**A2.**

```sql
SELECT * FROM Customers WHERE BranchID = 45;
```

**A3.**

```sql
SELECT * FROM AccountDetails WHERE AccountType = 'Savings';
```

**A4.**

```sql
SELECT * FROM Transactions WHERE TransactionType = 'Credit';
```

**A5.**

```sql
SELECT * FROM Customers WHERE Email IS NULL;
```

**A6.**

```sql
SELECT * FROM AccountDetails WHERE Balance > 50000;
```

**A7.**

```sql
SELECT * FROM Loans WHERE Status = 'Active';
```

**A8.**

```sql
SELECT * FROM Customers ORDER BY LastName ASC;
```

**A9.**

```sql
SELECT TOP 5 * FROM AccountDetails ORDER BY Balance DESC;
```

**A10.**

```sql
SELECT COUNT(*) AS TotalCustomers FROM Customers;
```

**A11.**

```sql
SELECT * FROM Transactions WHERE Amount BETWEEN 5000 AND 50000;
```

**A12.**

```sql
SELECT * FROM AccountDetails WHERE IsActive = 0;
```

**A13.**

```sql
SELECT * FROM Loans WHERE LoanType = 'Home Loan';
```

**A14.**

```sql
SELECT * FROM Customers WHERE FirstName LIKE 'A%';
```

**A15.**

```sql
SELECT AccountType, COUNT(*) AS TotalAccounts
FROM AccountDetails
GROUP BY AccountType;
```

**A16.**

```sql
SELECT c.FirstName + ' ' + c.LastName AS FullName, a.AccountType, a.Balance
FROM Customers c
INNER JOIN AccountDetails a ON c.CustomerID = a.CustomerID;
```

**A17.**

```sql
SELECT CustomerID, COUNT(*) AS AccountCount
FROM AccountDetails
GROUP BY CustomerID
HAVING COUNT(*) > 1;
```

**A18.**

```sql
SELECT SUM(Balance) AS TotalSavingsBalance
FROM AccountDetails
WHERE AccountType = 'Savings';
```

**A19.**

```sql
SELECT c.FirstName + ' ' + c.LastName AS FullName, l.LoanType, l.Status
FROM Customers c
INNER JOIN Loans l ON c.CustomerID = l.CustomerID
WHERE l.Status = 'Active';
```

**A20.**

```sql
SELECT t.TransactionID, a.AccountNumber, t.TransactionDate, t.Amount, t.TransactionType
FROM Transactions t
INNER JOIN AccountDetails a ON t.AccountID = a.AccountID;
```

**A21.**

```sql
SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Loans);
```

**A22.**

```sql
SELECT AccountType, AVG(Balance) AS AvgBalance
FROM AccountDetails
GROUP BY AccountType;
```

**A23.**

```sql
SELECT c.FirstName + ' ' + c.LastName AS FullName
FROM Customers c
INNER JOIN Loans l ON c.CustomerID = l.CustomerID
WHERE c.CustomerID NOT IN (
    SELECT CustomerID FROM AccountDetails WHERE IsActive = 1
);
```

**A24.**

```sql
SELECT AccountID,
    SUM(CASE WHEN TransactionType = 'Credit' THEN Amount ELSE 0 END) AS TotalCredit,
    SUM(CASE WHEN TransactionType = 'Debit'  THEN Amount ELSE 0 END) AS TotalDebit
FROM Transactions
GROUP BY AccountID;
```

**A25.**

```sql
SELECT AccountID, MAX(TransactionDate) AS LastTransactionDate
FROM Transactions
GROUP BY AccountID;
```

**A26.**

```sql
SELECT * FROM AccountDetails
WHERE Balance < (SELECT AVG(Balance) FROM AccountDetails);
```

**A27.**

```sql
SELECT * FROM Customers
WHERE YEAR(CreatedDate) = 2023;
```

**A28.**

```sql
SELECT BranchID, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY BranchID
ORDER BY CustomerCount DESC;
```

**A29.**

```sql
SELECT LoanType, MAX(Principal) AS MaxPrincipal
FROM Loans
GROUP BY LoanType;
```

**A30.**

```sql
SELECT c.*
FROM Customers c
INNER JOIN AccountDetails a ON c.CustomerID = a.CustomerID
WHERE c.DOB IS NULL AND a.IsActive = 1;
```

**A31.**

```sql
SELECT c.FirstName + ' ' + c.LastName AS FullName,
       a.Balance, l.Principal
FROM Customers c
INNER JOIN AccountDetails a ON c.CustomerID = a.CustomerID
INNER JOIN Loans l ON c.CustomerID = l.CustomerID;
```

**A32.**

```sql
SELECT * FROM Transactions WHERE Reference IS NULL;
```

**A33.**

```sql
SELECT TOP 1 BranchID, SUM(Principal) AS TotalPrincipal
FROM Loans
GROUP BY BranchID
ORDER BY TotalPrincipal DESC;
```

**A34.**

```sql
SELECT c.FirstName + ' ' + c.LastName AS FullName, l.LoanType, l.Status
FROM Customers c
INNER JOIN Loans l ON c.CustomerID = l.CustomerID
WHERE l.Status = 'Defaulted';
```

**A35.**

```sql
SELECT Status, COUNT(*) AS LoanCount
FROM Loans
GROUP BY Status;
```

**A36.**

```sql
SELECT c.FirstName + ' ' + c.LastName AS FullName,
       SUM(a.Balance) AS TotalBalance,
       RANK() OVER (ORDER BY SUM(a.Balance) DESC) AS BalanceRank
FROM Customers c
INNER JOIN AccountDetails a ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
```

**A37.**

```sql
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY AccountID ORDER BY TransactionDate DESC) AS rn
    FROM Transactions
) t WHERE rn = 1;
```

**A38.**

```sql
SELECT TransactionDate, Amount, TransactionType,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions
WHERE AccountID = 10;
```

**A39.**

```sql
SELECT c.FirstName + ' ' + c.LastName AS FullName,
       a.Balance,
       a.Balance - AVG(a2.Balance) AS DiffFromAvg
FROM Customers c
INNER JOIN AccountDetails a ON c.CustomerID = a.CustomerID
CROSS JOIN (SELECT AVG(Balance) AS Balance FROM AccountDetails) a2;
```

**A40.**

```sql
WITH HighValueLoans AS (
    SELECT CustomerID, SUM(Principal) AS TotalPrincipal
    FROM Loans
    GROUP BY CustomerID
    HAVING SUM(Principal) > 1000000
)
SELECT c.FirstName + ' ' + c.LastName AS FullName, h.TotalPrincipal
FROM Customers c
INNER JOIN HighValueLoans h ON c.CustomerID = h.CustomerID;
```

**A41.**

```sql
SELECT MAX(Balance) AS SecondHighestBalance
FROM AccountDetails
WHERE Balance < (SELECT MAX(Balance) FROM AccountDetails);
```

**A42.**

```sql
SELECT Mobile, COUNT(*) AS Count
FROM Customers
WHERE Mobile IS NOT NULL
GROUP BY Mobile
HAVING COUNT(*) > 1;
```

**A43.**

```sql
SELECT LoanType, CustomerID, InterestRate,
       DENSE_RANK() OVER (PARTITION BY LoanType ORDER BY InterestRate DESC) AS RateRank
FROM Loans;
```

**A44.**

```sql
SELECT TransactionID, AccountID, TransactionDate, Amount,
       LAG(Amount) OVER (PARTITION BY AccountID ORDER BY TransactionDate) AS PreviousAmount
FROM Transactions;
```

**A45.**

```sql
SELECT a.AccountID, a.AccountNumber
FROM AccountDetails a
WHERE NOT EXISTS (
    SELECT 1 FROM Transactions t WHERE t.AccountID = a.AccountID
);
```

**A46.**

```sql
WITH Summary AS (
    SELECT AccountID,
           SUM(CASE WHEN TransactionType = 'Credit' THEN Amount ELSE 0 END) AS TotalCredit,
           SUM(CASE WHEN TransactionType = 'Debit'  THEN Amount ELSE 0 END) AS TotalDebit
    FROM Transactions
    GROUP BY AccountID
)
SELECT * FROM Summary WHERE TotalCredit > TotalDebit;
```

**A47.**

```sql
SELECT CustomerID, COUNT(DISTINCT LoanType) AS LoanTypeCount
FROM Loans
GROUP BY CustomerID
HAVING COUNT(DISTINCT LoanType) > 1;
```

**A48.**

```sql
SELECT MONTH(TransactionDate) AS Month, COUNT(*) AS TotalTransactions
FROM Transactions
WHERE YEAR(TransactionDate) = 2024
GROUP BY MONTH(TransactionDate)
ORDER BY Month;
```

**A49.**

```sql
SELECT * FROM (
    SELECT BranchID,
           SUM(Balance) AS TotalBalance,
           DENSE_RANK() OVER (ORDER BY SUM(Balance) DESC) AS BranchRank
    FROM AccountDetails
    GROUP BY BranchID
) r WHERE BranchRank <= 3;
```

**A50.**

```sql
WITH LatestTxn AS (
    SELECT AccountID, Amount AS LastTxnAmount,
           ROW_NUMBER() OVER (PARTITION BY AccountID ORDER BY TransactionDate DESC) AS rn
    FROM Transactions
)
SELECT c.FirstName + ' ' + c.LastName AS FullName,
       a.AccountType,
       l.LoanType,
       l.Status AS LoanStatus,
       lt.LastTxnAmount
FROM Customers c
LEFT JOIN AccountDetails a  ON c.CustomerID = a.CustomerID
LEFT JOIN Loans l           ON c.CustomerID = l.CustomerID
LEFT JOIN LatestTxn lt      ON a.AccountID  = lt.AccountID AND lt.rn = 1;
```

</details>

---

## Difficulty Summary

| Level        | Questions | Topics Covered                                           |
| ------------ | --------- | -------------------------------------------------------- |
| Beginner     | Q1 – Q15  | SELECT, WHERE, NULL, ORDER BY, COUNT, GROUP BY           |
| Intermediate | Q16 – Q35 | JOINs, Subqueries, HAVING, CASE, EXISTS, Multi-table     |
| Advanced     | Q36 – Q50 | Window Functions, CTE, LAG, ROW_NUMBER, RANK, DENSE_RANK |
