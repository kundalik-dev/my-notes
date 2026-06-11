# Subqueries

## Simple Explanation

A subquery is a query written inside another query.

It is also called an inner query or nested query.

Testers use subqueries when one query result is needed to filter another query.

## Basic Example

Find users who placed orders:

```sql
SELECT UserName, Email
FROM Users
WHERE UserId IN (
    SELECT UserId
    FROM Orders
);
```

Here:

- Inner query gets `UserId` from `Orders`.
- Outer query gets user details from `Users`.

## Subquery In WHERE Clause

Most common type.

```sql
SELECT *
FROM Orders
WHERE UserId IN (
    SELECT UserId
    FROM Users
    WHERE Status = 'Active'
);
```

## Subquery In FROM Clause

Used like a temporary result table.

```sql
SELECT Status, TotalOrders
FROM (
    SELECT Status, COUNT(*) AS TotalOrders
    FROM Orders
    GROUP BY Status
) AS OrderSummary;
```

## Subquery In SELECT Clause

Used to calculate a value for each row.

```sql
SELECT UserName,
       (SELECT COUNT(*)
        FROM Orders
        WHERE Orders.UserId = Users.UserId) AS OrderCount
FROM Users;
```

## Correlated Subquery

A correlated subquery depends on the outer query.

```sql
SELECT UserName
FROM Users U
WHERE EXISTS (
    SELECT 1
    FROM Orders O
    WHERE O.UserId = U.UserId
);
```

### Interview Point

Correlated subquery runs for each row of the outer query, so it can be slower for large data.

## IN vs EXISTS

| Point | IN | EXISTS |
| ----- | -- | ------ |
| Checks | Value exists in a list | Matching row exists |
| Common Use | Small result list | Large related table checks |
| NULL Handling | Can behave unexpectedly with NULL | Safer in many existence checks |
| Example | `UserId IN (...)` | `EXISTS (...)` |

## NOT EXISTS

Used to find missing related records.

Example: users without orders.

```sql
SELECT UserId, UserName
FROM Users U
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders O
    WHERE O.UserId = U.UserId
);
```

## Real Project Example

Find customers who registered but never placed an order:

```sql
SELECT UserId, UserName, Email
FROM Users U
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders O
    WHERE O.UserId = U.UserId
);
```

This is useful for data validation and business rule testing.

## Common Interview Questions

1. What is a subquery?
2. Where can we write subqueries?
3. What is a correlated subquery?
4. Difference between `IN` and `EXISTS`?
5. What is `NOT EXISTS` used for?
6. Difference between JOIN and subquery?

## Interview Answer

A subquery is a query inside another query. It can be used in `WHERE`, `FROM`, or `SELECT` clauses. A correlated subquery depends on the outer query and executes based on each outer row. As a tester, I use subqueries to filter records based on data from another table, such as finding users with orders or users without orders.

## Quick Revision

- Subquery is nested query.
- Inner query result is used by outer query.
- `IN` checks values in a list.
- `EXISTS` checks matching row existence.
- `NOT EXISTS` is useful for missing record checks.
