# Window Functions

## Simple Explanation

Window functions perform calculations across related rows without reducing the number of rows.

They are useful for ranking, duplicate detection, running totals, and latest-record queries.

## Window Function Syntax

```sql
FunctionName() OVER (
    PARTITION BY column_name
    ORDER BY column_name
)
```

## GROUP BY vs Window Function

| Point | GROUP BY | Window Function |
| ----- | -------- | --------------- |
| Output Rows | Reduces rows | Keeps original rows |
| Used For | Summary result | Row-wise calculation |
| Example | Count orders by status | Rank orders by amount |

## ROW_NUMBER

Gives unique row number.

```sql
SELECT UserId, Email,
       ROW_NUMBER() OVER (ORDER BY UserId) AS RowNo
FROM Users;
```

## Find Duplicate Records Using ROW_NUMBER

```sql
SELECT *
FROM (
    SELECT Email,
           ROW_NUMBER() OVER (PARTITION BY Email ORDER BY UserId) AS RowNo
    FROM Users
) X
WHERE RowNo > 1;
```

### Tester Use

Very useful to find duplicate emails, duplicate mobile numbers, or duplicate test data.

## RANK and DENSE_RANK

```sql
SELECT UserId, OrderAmount,
       RANK() OVER (ORDER BY OrderAmount DESC) AS RankNo,
       DENSE_RANK() OVER (ORDER BY OrderAmount DESC) AS DenseRankNo
FROM Orders;
```

| Point | RANK | DENSE_RANK |
| ----- | ---- | ---------- |
| Tie Handling | Same rank for same value | Same rank for same value |
| Gap After Tie | Yes | No |

Example:

| Amount | RANK | DENSE_RANK |
| ------ | ---- | ---------- |
| 1000 | 1 | 1 |
| 1000 | 1 | 1 |
| 800 | 3 | 2 |

## LAG and LEAD

`LAG` gets previous row value.

`LEAD` gets next row value.

```sql
SELECT OrderId, OrderDate, OrderAmount,
       LAG(OrderAmount) OVER (ORDER BY OrderDate) AS PreviousAmount,
       LEAD(OrderAmount) OVER (ORDER BY OrderDate) AS NextAmount
FROM Orders;
```

## SUM OVER

Used for running total.

```sql
SELECT OrderId, OrderDate, OrderAmount,
       SUM(OrderAmount) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders;
```

## PARTITION BY

`PARTITION BY` creates groups inside the window.

```sql
SELECT UserId, OrderId, OrderAmount,
       ROW_NUMBER() OVER (PARTITION BY UserId ORDER BY OrderDate DESC) AS RowNo
FROM Orders;
```

This can find latest order per user.

## Real Project Example

Find latest order for each user:

```sql
SELECT *
FROM (
    SELECT UserId, OrderId, OrderDate,
           ROW_NUMBER() OVER (PARTITION BY UserId ORDER BY OrderDate DESC) AS RowNo
    FROM Orders
) X
WHERE RowNo = 1;
```

## Common Interview Questions

1. What are window functions?
2. Difference between `GROUP BY` and `PARTITION BY`?
3. Difference between `RANK` and `DENSE_RANK`?
4. What is `ROW_NUMBER`?
5. How do you find duplicate records?
6. How do you get latest record per user?

## Interview Answer

Window functions calculate values across related rows while keeping individual rows in the output. Common window functions are `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`, and `SUM OVER`. As a tester, I can use window functions to find duplicates, rank records, and get latest records per user.

## Quick Revision

- Window functions keep row details.
- `ROW_NUMBER` gives unique sequence.
- `RANK` gives gaps after ties.
- `DENSE_RANK` does not give gaps.
- `LAG` previous row, `LEAD` next row.
- `PARTITION BY` groups rows inside window.
