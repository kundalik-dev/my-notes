# Aggregate Functions

## Simple Explanation

Aggregate functions perform calculations on multiple rows and return a single result.

Testers use aggregate functions for count validation, report validation, migration testing, and summary checks.

## Common Aggregate Functions

| Function | Used For | Example Result |
| -------- | -------- | -------------- |
| `COUNT()` | Counts rows | Total users |
| `SUM()` | Adds values | Total order amount |
| `AVG()` | Average value | Average salary |
| `MIN()` | Smallest value | Minimum order amount |
| `MAX()` | Largest value | Maximum order amount |

## COUNT

```sql
SELECT COUNT(*) AS TotalUsers
FROM Users;
```

### Tester Use

Used to verify row count after data migration, upload, or automation execution.

## SUM

```sql
SELECT SUM(OrderAmount) AS TotalAmount
FROM Orders
WHERE Status = 'Completed';
```

### Tester Use

Used to validate billing, invoice, or payment totals.

## AVG, MIN, MAX

```sql
SELECT
    AVG(OrderAmount) AS AverageAmount,
    MIN(OrderAmount) AS MinimumAmount,
    MAX(OrderAmount) AS MaximumAmount
FROM Orders;
```

## GROUP BY

`GROUP BY` groups rows and applies aggregate functions on each group.

```sql
SELECT Status, COUNT(*) AS OrderCount
FROM Orders
GROUP BY Status;
```

### Output Example

| Status | OrderCount |
| ------ | ---------- |
| Pending | 10 |
| Completed | 25 |
| Cancelled | 3 |

## HAVING

`HAVING` filters grouped results.

```sql
SELECT Status, COUNT(*) AS OrderCount
FROM Orders
GROUP BY Status
HAVING COUNT(*) > 5;
```

## WHERE vs HAVING

This is a common interview question.

| Point | WHERE | HAVING |
| ----- | ----- | ------ |
| Used For | Filters rows | Filters groups |
| Used Before/After GROUP BY | Before grouping | After grouping |
| Aggregate Function Allowed | Usually no | Yes |
| Example | `WHERE Status = 'Active'` | `HAVING COUNT(*) > 5` |

## Aggregate Without GROUP BY

If there is no `GROUP BY`, aggregate returns result for the full table or filtered rows.

```sql
SELECT COUNT(*) AS ActiveUsers
FROM Users
WHERE Status = 'Active';
```

## Real Project Example

During migration testing, tester can compare row counts:

```sql
SELECT COUNT(*) FROM SourceUsers;
SELECT COUNT(*) FROM TargetUsers;
```

If counts are different, migration may have missing or extra records.

## Common Interview Questions

1. What are aggregate functions?
2. What is `COUNT(*)`?
3. What is the difference between `WHERE` and `HAVING`?
4. Why do we use `GROUP BY`?
5. Can we use aggregate functions without `GROUP BY`?
6. How do testers use aggregate functions?

## Interview Answer

Aggregate functions are used to calculate values from multiple rows. Common aggregate functions are `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`. `GROUP BY` is used to group records before applying aggregate functions, and `HAVING` is used to filter grouped data. As a tester, I use aggregate functions to validate counts, totals, reports, and migration data.

## Quick Revision

- `COUNT` counts records.
- `SUM` adds values.
- `AVG` gives average.
- `MIN` and `MAX` find smallest and largest values.
- `GROUP BY` groups rows.
- `HAVING` filters grouped result.
