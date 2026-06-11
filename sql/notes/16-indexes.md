# Indexes

## Simple Explanation

An index is used to improve the speed of data search in a table.

It works like an index in a book. Instead of scanning all rows, the database can find data faster using the index.

## Why Indexes Are Important For Testers

Testers should understand indexes because:

- Slow search pages may be caused by missing indexes.
- Report queries may take more time if indexes are not proper.
- Database performance issues can affect application performance.
- Unique indexes can prevent duplicate data.
- Too many indexes can slow insert, update, and delete operations.

## Common Types of Indexes

| Index Type | Meaning | Example |
| ---------- | ------- | ------- |
| Clustered Index | Sorts and stores table rows physically | Primary key index |
| Non-Clustered Index | Separate structure with pointer to data row | Index on Email |
| Composite Index | Index on multiple columns | City + Status |
| Unique Index | Prevents duplicate values | Email index |

## Clustered Index

A clustered index decides the physical order of data in a table.

Important points:

- Usually one clustered index per table.
- Often created on primary key.
- Data rows are stored in the order of clustered index.

Example:

```sql
CREATE CLUSTERED INDEX IX_Users_UserId
ON Users (UserId);
```

## Non-Clustered Index

A non-clustered index is a separate structure that points to actual table rows.

```sql
CREATE INDEX IX_Users_Email
ON Users (Email);
```

### Tester Use

If login is slow and query searches by email, an index on `Email` may improve performance.

## Composite Index

Composite index is created on more than one column.

```sql
CREATE INDEX IX_Users_City_Status
ON Users (City, Status);
```

Useful when queries filter using both columns.

## Unique Index

Unique index does not allow duplicate values.

```sql
CREATE UNIQUE INDEX IX_Users_Email
ON Users (Email);
```

### Tester Use

Try adding duplicate email and verify duplicate record is not allowed.

## When Indexes Help

Indexes help when:

- Table has large data.
- Column is frequently used in `WHERE`.
- Column is used in `JOIN`.
- Column is used in `ORDER BY`.
- Search functionality depends on that column.

## When Indexes Can Slow Down

Indexes can slow down:

- `INSERT`
- `UPDATE`
- `DELETE`

Reason: database must update table data and index data.

## Create and Drop Index

```sql
CREATE INDEX IX_Orders_Status
ON Orders (Status);
```

```sql
DROP INDEX IX_Orders_Status ON Orders;
```

Syntax may differ based on database.

## Real Project Example

Search page issue:

If user search by email takes too much time:

```sql
SELECT UserId, UserName, Email
FROM Users
WHERE Email = 'test@test.com';
```

Development team may check if `Email` column has an index.

## Common Interview Questions

1. What is an index?
2. Why do we use indexes?
3. Difference between clustered and non-clustered index?
4. What is composite index?
5. Can indexes slow down database operations?
6. What is unique index?
7. How do indexes help testers?

## Interview Answer

An index is used to improve query performance by helping the database find records faster. Clustered index controls the physical order of data, while non-clustered index is a separate structure that points to data rows. Indexes improve read performance, but too many indexes can slow insert, update, and delete operations. As a tester, I understand indexes mainly for performance issues and duplicate data validation.

## Quick Revision

- Index improves search speed.
- Clustered index controls physical order.
- Non-clustered index has pointers to rows.
- Composite index uses multiple columns.
- Unique index prevents duplicates.
- Too many indexes can slow write operations.
