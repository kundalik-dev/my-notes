# Set Operators

## Simple Explanation

Set operators combine or compare results from two or more `SELECT` queries.

They are useful for data comparison, migration testing, and finding missing records.

## Rules For Set Operators

- Both queries should have the same number of columns.
- Column data types should be compatible.
- Column order should match.
- `ORDER BY` is usually written at the end.

## UNION

`UNION` combines results and removes duplicates.

```sql
SELECT Email FROM CurrentUsers
UNION
SELECT Email FROM OldUsers;
```

## UNION ALL

`UNION ALL` combines results and keeps duplicates.

```sql
SELECT Email FROM CurrentUsers
UNION ALL
SELECT Email FROM OldUsers;
```

## UNION vs UNION ALL

| Point | UNION | UNION ALL |
| ----- | ----- | --------- |
| Duplicates | Removes duplicates | Keeps duplicates |
| Performance | Slower because duplicate check is done | Faster |
| Use Case | Need unique result | Need all records |

## INTERSECT

`INTERSECT` returns rows common in both queries.

```sql
SELECT Email FROM SourceUsers
INTERSECT
SELECT Email FROM TargetUsers;
```

### Tester Use

Find records available in both source and target tables.

## EXCEPT or MINUS

Returns rows from first query that are not present in second query.

SQL Server/PostgreSQL:

```sql
SELECT Email FROM SourceUsers
EXCEPT
SELECT Email FROM TargetUsers;
```

Oracle:

```sql
SELECT Email FROM SourceUsers
MINUS
SELECT Email FROM TargetUsers;
```

### Tester Use

Find records missing in target table after migration.

## Set Operator Summary

| Operator | Meaning | Tester Use |
| -------- | ------- | ---------- |
| `UNION` | Combine and remove duplicates | Unique list from two sources |
| `UNION ALL` | Combine and keep duplicates | Full data comparison |
| `INTERSECT` | Common records | Matching records |
| `EXCEPT` / `MINUS` | Records in first but not second | Missing records |

## Real Project Example

Find users present in source table but missing in target table after migration:

```sql
SELECT UserId, Email
FROM SourceUsers
EXCEPT
SELECT UserId, Email
FROM TargetUsers;
```

Find extra users in target:

```sql
SELECT UserId, Email
FROM TargetUsers
EXCEPT
SELECT UserId, Email
FROM SourceUsers;
```

## Common Interview Questions

1. What are set operators?
2. Difference between `UNION` and `UNION ALL`?
3. What is `INTERSECT`?
4. What is `EXCEPT` or `MINUS`?
5. What are rules for using set operators?
6. How are set operators useful in testing?

## Interview Answer

Set operators are used to combine or compare results from multiple `SELECT` queries. `UNION` removes duplicates, `UNION ALL` keeps duplicates, `INTERSECT` returns common rows, and `EXCEPT` or `MINUS` returns rows present in the first query but missing in the second. As a tester, I use them mainly for migration validation and data comparison.

## Quick Revision

- Set operators work between SELECT queries.
- Column count should match.
- `UNION` removes duplicates.
- `UNION ALL` keeps duplicates.
- `EXCEPT`/`MINUS` finds missing records.
