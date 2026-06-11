# Views

## Simple Explanation

A view is a saved SQL query that behaves like a virtual table.

It does not usually store data itself. It shows data from one or more base tables.

## Why Views Are Important For Testers

Testers should know views because:

- Reports may use views.
- Views can hide complex joins.
- Views can show only selected columns.
- Views can hide sensitive data.
- Defects can happen if view logic is wrong.

## Create View

```sql
CREATE VIEW ActiveUsers AS
SELECT UserId, UserName, Email
FROM Users
WHERE Status = 'Active';
```

## Use View

```sql
SELECT *
FROM ActiveUsers;
```

## Drop View

```sql
DROP VIEW ActiveUsers;
```

## View vs Table

| Point | View | Table |
| ----- | ---- | ----- |
| Stores Data | Usually no | Yes |
| Based On | SQL query | Physical storage |
| Used For | Simplify query, security, reporting | Store actual data |
| Update Allowed | Sometimes | Yes |
| Example | Active users view | Users table |

## Updatable View

Some views can be updated if they are simple and based on one table.

Example:

```sql
CREATE VIEW UserEmails AS
SELECT UserId, Email
FROM Users;
```

This may be updatable depending on database rules.

## Read-Only View

Views with joins, aggregate functions, `GROUP BY`, or calculated columns are often read-only.

Example:

```sql
CREATE VIEW OrderSummary AS
SELECT Status, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Status;
```

## When Views Are Used In Real Projects

- Report data.
- Dashboard data.
- Hiding sensitive columns.
- Reusing complex SQL logic.
- Giving limited database access to users.

## Indexed View / Materialized View

Some databases support views that physically store result data.

- SQL Server: Indexed View
- Oracle/PostgreSQL: Materialized View

These can improve performance but need maintenance when base data changes.

## Real Project Example

Suppose dashboard shows only active users.

Application may use:

```sql
SELECT *
FROM ActiveUsers;
```

Tester should verify that inactive users are not visible in the view output.

## Common Interview Questions

1. What is a view?
2. Difference between view and table?
3. Can we update a view?
4. Why do we use views?
5. What is materialized view?
6. How do testers validate views?

## Interview Answer

A view is a virtual table based on a SQL query. It is used to simplify complex queries, restrict data access, and support reporting. A table stores actual data, but a normal view does not store data directly. As a tester, I validate whether view output matches the expected data from base tables.

## Quick Revision

- View is a saved query.
- View acts like a virtual table.
- View can simplify complex joins.
- View can hide sensitive data.
- Table stores data, view usually does not.
