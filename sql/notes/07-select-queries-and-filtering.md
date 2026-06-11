# SELECT Queries and Filtering

## Simple Explanation

`SELECT` is used to fetch data from database tables.

For testers, `SELECT` is the most commonly used SQL command because it helps verify backend data.

## Basic SELECT

```sql
SELECT * FROM Users;
```

`SELECT *` returns all columns.

In interviews, say:

- `SELECT *` is useful for quick checking.
- In real project queries, it is better to select only required columns.

```sql
SELECT UserId, UserName, Email
FROM Users;
```

## Column Alias

Alias gives a temporary name to a column in query output.

```sql
SELECT UserName AS Name, Email AS EmailAddress
FROM Users;
```

## WHERE Clause

`WHERE` filters records based on condition.

```sql
SELECT UserId, UserName, Email
FROM Users
WHERE Status = 'Active';
```

## Common Filtering Operators

| Operator | Used For | Example |
| -------- | -------- | ------- |
| `=` | Exact match | `Status = 'Active'` |
| `<>` or `!=` | Not equal | `Status <> 'Inactive'` |
| `>` | Greater than | `Amount > 1000` |
| `<` | Less than | `Age < 18` |
| `>=` | Greater than or equal | `CreatedDate >= '2026-01-01'` |
| `<=` | Less than or equal | `Amount <= 5000` |

## AND, OR, NOT

```sql
SELECT *
FROM Users
WHERE Status = 'Active'
AND City = 'Pune';
```

```sql
SELECT *
FROM Users
WHERE City = 'Pune'
OR City = 'Mumbai';
```

```sql
SELECT *
FROM Users
WHERE NOT Status = 'Inactive';
```

## IN

`IN` is used to match multiple values.

```sql
SELECT *
FROM Orders
WHERE Status IN ('Pending', 'Completed', 'Cancelled');
```

## BETWEEN

`BETWEEN` is used for range filtering.

```sql
SELECT *
FROM Orders
WHERE OrderAmount BETWEEN 1000 AND 5000;
```

## LIKE

`LIKE` is used for pattern matching.

| Pattern | Meaning |
| ------- | ------- |
| `'A%'` | Starts with A |
| `'%a'` | Ends with a |
| `'%test%'` | Contains test |
| `'_a%'` | Second character is a |

```sql
SELECT *
FROM Users
WHERE Email LIKE '%gmail.com';
```

## IS NULL and IS NOT NULL

Use these to check missing values.

```sql
SELECT *
FROM Users
WHERE MobileNumber IS NULL;
```

```sql
SELECT *
FROM Users
WHERE MobileNumber IS NOT NULL;
```

## DISTINCT

`DISTINCT` removes duplicate values from output.

```sql
SELECT DISTINCT City
FROM Users;
```

## ORDER BY

`ORDER BY` sorts query result.

```sql
SELECT *
FROM Orders
ORDER BY CreatedDate DESC;
```

- `ASC`: ascending order.
- `DESC`: descending order.

## LIMIT, TOP, and ROWNUM

Used to restrict number of rows returned.

| Database | Syntax |
| -------- | ------ |
| SQL Server | `SELECT TOP 10 * FROM Users;` |
| MySQL | `SELECT * FROM Users LIMIT 10;` |
| Oracle | `SELECT * FROM Users WHERE ROWNUM <= 10;` |

## Real Project Example

After creating a user from UI, tester can verify the record:

```sql
SELECT UserId, UserName, Email, Status
FROM Users
WHERE Email = 'automationuser@test.com';
```

## Common Interview Questions

1. What is `SELECT`?
2. What is the use of `WHERE`?
3. Difference between `WHERE` and `HAVING`?
4. What is `LIKE`?
5. What is the difference between `IN` and `BETWEEN`?
6. Why should we avoid `SELECT *`?
7. How do you find duplicate or unique values?

## Interview Answer

`SELECT` is used to fetch data from database tables. We can use `WHERE` to filter records, `ORDER BY` to sort data, `DISTINCT` to remove duplicates, and operators like `IN`, `BETWEEN`, `LIKE`, `IS NULL`, and `IS NOT NULL` for specific filtering. As a tester, I commonly use `SELECT` queries to verify whether UI or API actions are saved correctly in the database.

## Quick Revision

- `SELECT` fetches data.
- `WHERE` filters rows.
- `LIKE` searches patterns.
- `IN` checks multiple values.
- `BETWEEN` checks range.
- `DISTINCT` removes duplicates.
- `ORDER BY` sorts data.
