# CTEs - Common Table Expressions

## Simple Explanation

CTE means `Common Table Expression`.

A CTE is a temporary named result set used inside a SQL query.

It starts with the `WITH` keyword.

## Why CTEs Are Important For Testers

CTEs make complex SQL queries easier to read.

Testers can use CTEs for:

- Data validation queries.
- Duplicate record checks.
- Latest record checks.
- Migration comparison queries.
- Breaking complex queries into readable steps.

## Simple CTE Syntax

```sql
WITH ActiveUsers AS (
    SELECT UserId, UserName, Email
    FROM Users
    WHERE Status = 'Active'
)
SELECT *
FROM ActiveUsers;
```

## Multiple CTEs

```sql
WITH ActiveUsers AS (
    SELECT UserId, UserName
    FROM Users
    WHERE Status = 'Active'
),
UserOrders AS (
    SELECT UserId, COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY UserId
)
SELECT A.UserName, U.OrderCount
FROM ActiveUsers A
LEFT JOIN UserOrders U
ON A.UserId = U.UserId;
```

## CTE With ROW_NUMBER

Find duplicate emails:

```sql
WITH DuplicateEmails AS (
    SELECT UserId, Email,
           ROW_NUMBER() OVER (PARTITION BY Email ORDER BY UserId) AS RowNo
    FROM Users
)
SELECT *
FROM DuplicateEmails
WHERE RowNo > 1;
```

## Delete Duplicates Using CTE

Example concept:

```sql
WITH DuplicateEmails AS (
    SELECT UserId, Email,
           ROW_NUMBER() OVER (PARTITION BY Email ORDER BY UserId) AS RowNo
    FROM Users
)
DELETE FROM DuplicateEmails
WHERE RowNo > 1;
```

Use delete queries carefully, especially in shared test environments.

## Recursive CTE

Recursive CTE is used for hierarchical data.

Examples:

- Employee and manager hierarchy.
- Category and subcategory.
- Folder structure.

Concept:

```sql
WITH EmployeeHierarchy AS (
    SELECT EmployeeId, EmployeeName, ManagerId
    FROM Employees
    WHERE ManagerId IS NULL

    UNION ALL

    SELECT E.EmployeeId, E.EmployeeName, E.ManagerId
    FROM Employees E
    INNER JOIN EmployeeHierarchy H
    ON E.ManagerId = H.EmployeeId
)
SELECT *
FROM EmployeeHierarchy;
```

## CTE vs Subquery

| Point | CTE | Subquery |
| ----- | --- | -------- |
| Readability | Better for complex queries | Can become hard to read |
| Reuse In Same Query | Can be referenced by name | Usually repeated |
| Syntax | Uses `WITH` | Written inside query |
| Common Use | Complex validation logic | Simple filtering |

## Real Project Example

Find latest status record for each order:

```sql
WITH LatestStatus AS (
    SELECT OrderId, Status, UpdatedDate,
           ROW_NUMBER() OVER (PARTITION BY OrderId ORDER BY UpdatedDate DESC) AS RowNo
    FROM OrderStatusHistory
)
SELECT *
FROM LatestStatus
WHERE RowNo = 1;
```

## Common Interview Questions

1. What is a CTE?
2. What is the syntax of CTE?
3. Difference between CTE and subquery?
4. What is recursive CTE?
5. How do you find duplicates using CTE?
6. Can CTE improve readability?

## Interview Answer

A CTE is a temporary named result set created using the `WITH` clause. It exists only for that query and improves readability of complex SQL. As a tester, I use CTEs for duplicate checks, latest record validation, migration comparison, and writing clean database validation queries.

## Quick Revision

- CTE starts with `WITH`.
- CTE exists only for one query.
- CTE improves readability.
- Recursive CTE handles hierarchy.
- CTE with `ROW_NUMBER` is useful for duplicate checks.
