# JOINs

## Simple Explanation

JOINs are used to combine data from two or more tables based on a related column.

In real projects, data is usually stored in multiple tables. Testers should know JOINs to validate complete business data.

Example:

- User details may be in `Users` table.
- Order details may be in `Orders` table.
- Payment details may be in `Payments` table.

To validate a complete order flow, we may need to join these tables.

## Sample Tables

### Users

| UserId | UserName |
| ------ | -------- |
| 1 | Rahul |
| 2 | Priya |

### Orders

| OrderId | UserId | Amount |
| ------- | ------ | ------ |
| 101 | 1 | 500 |
| 102 | 1 | 700 |

## INNER JOIN

Returns only matching records from both tables.

```sql
SELECT Users.UserName, Orders.OrderId, Orders.Amount
FROM Users
INNER JOIN Orders
ON Users.UserId = Orders.UserId;
```

### Interview Point

If there is no matching record in either table, that row is not returned.

## LEFT JOIN

Returns all records from left table and matching records from right table.

```sql
SELECT Users.UserName, Orders.OrderId
FROM Users
LEFT JOIN Orders
ON Users.UserId = Orders.UserId;
```

### Tester Use

Useful to find users who do not have orders.

```sql
SELECT Users.UserId, Users.UserName
FROM Users
LEFT JOIN Orders
ON Users.UserId = Orders.UserId
WHERE Orders.OrderId IS NULL;
```

## RIGHT JOIN

Returns all records from right table and matching records from left table.

```sql
SELECT Users.UserName, Orders.OrderId
FROM Users
RIGHT JOIN Orders
ON Users.UserId = Orders.UserId;
```

## FULL OUTER JOIN

Returns all records from both tables.

If matching data is not available, NULL values are shown.

```sql
SELECT Users.UserName, Orders.OrderId
FROM Users
FULL OUTER JOIN Orders
ON Users.UserId = Orders.UserId;
```

## SELF JOIN

A self join joins a table with itself.

Example: Employee and manager data in same table.

```sql
SELECT E.EmployeeName, M.EmployeeName AS ManagerName
FROM Employees E
LEFT JOIN Employees M
ON E.ManagerId = M.EmployeeId;
```

## CROSS JOIN

Returns all possible combinations of rows.

```sql
SELECT Products.ProductName, Sizes.SizeName
FROM Products
CROSS JOIN Sizes;
```

### Interview Point

Cross join can create a large number of rows, so use carefully.

## JOIN Types Summary

| Join Type | Returns |
| --------- | ------- |
| `INNER JOIN` | Only matching records from both tables |
| `LEFT JOIN` | All left table records and matching right table records |
| `RIGHT JOIN` | All right table records and matching left table records |
| `FULL OUTER JOIN` | All records from both tables |
| `SELF JOIN` | Table joined with itself |
| `CROSS JOIN` | All combinations of rows |

## JOIN vs Subquery

| Point | JOIN | Subquery |
| ----- | ---- | -------- |
| Use | Combine columns from tables | Use result of one query inside another |
| Readability | Good for related data | Good for filtering based on another result |
| Performance | Often better for large related data | Depends on database and query |

## Real Project Example

After placing an order, tester can validate user and order details:

```sql
SELECT U.UserName, U.Email, O.OrderId, O.Status, O.Amount
FROM Users U
INNER JOIN Orders O
ON U.UserId = O.UserId
WHERE O.OrderId = 101;
```

## Common Interview Questions

1. What is a JOIN?
2. Difference between `INNER JOIN` and `LEFT JOIN`?
3. What is `FULL OUTER JOIN`?
4. What is self join?
5. What is cross join?
6. How do testers use joins?
7. How to find records in one table but not in another?

## Interview Answer

JOINs are used to combine data from two or more tables using a related column. `INNER JOIN` returns only matching records. `LEFT JOIN` returns all records from the left table and matching records from the right table. As a tester, I use JOINs to validate related data across tables, such as user, order, and payment details.

## Quick Revision

- JOIN combines table data.
- `INNER JOIN` returns matching rows.
- `LEFT JOIN` is useful to find missing related records.
- `SELF JOIN` joins a table with itself.
- `CROSS JOIN` creates combinations.
