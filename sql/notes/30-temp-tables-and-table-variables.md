# Temp Tables and Table Variables

## Simple Explanation

Temp tables and table variables temporarily store data during query execution.

They are useful when complex queries need intermediate results.

## Why Testers Should Know This

Testers may see temp tables in:

- Stored procedures.
- Data migration scripts.
- Report queries.
- Complex validation queries.
- Batch processing.

Basic understanding helps testers read and understand SQL scripts.

## Local Temp Table

Local temp table starts with `#`.

```sql
CREATE TABLE #ActiveUsers (
    UserId INT,
    UserName VARCHAR(100)
);
```

Scope:

- Available only in current session.
- Automatically removed when session ends.

## Global Temp Table

Global temp table starts with `##`.

```sql
CREATE TABLE ##GlobalUsers (
    UserId INT,
    UserName VARCHAR(100)
);
```

Scope:

- Available to multiple sessions.
- Removed when all sessions using it are closed.

## Table Variable

Table variable starts with `@`.

```sql
DECLARE @ActiveUsers TABLE (
    UserId INT,
    UserName VARCHAR(100)
);
```

Scope:

- Available only in current batch, function, or procedure.

## CTE

CTE is temporary only for one query.

```sql
WITH ActiveUsers AS (
    SELECT UserId, UserName
    FROM Users
    WHERE Status = 'Active'
)
SELECT *
FROM ActiveUsers;
```

## Temp Table vs Table Variable vs CTE

| Point | Temp Table | Table Variable | CTE |
| ----- | ---------- | -------------- | --- |
| Syntax | `#Temp` | `@Table` | `WITH` |
| Scope | Session | Batch/procedure | Single query |
| Best For | Larger intermediate data | Small temporary data | Readable query logic |
| Can Reuse | Yes in session | Yes in batch | Only within query |

## When To Use What

- Use CTE for readable one-query logic.
- Use table variable for small temporary data.
- Use temp table for larger intermediate results.
- Use temp table when data is reused multiple times in a procedure.

## Real Project Example

During migration validation:

1. Store source result in temp table.
2. Store target result in temp table.
3. Compare both results.

Example:

```sql
SELECT UserId, Email
INTO #SourceUsers
FROM SourceUsers;

SELECT UserId, Email
INTO #TargetUsers
FROM TargetUsers;
```

## Common Interview Questions

1. What is a temp table?
2. Difference between local and global temp table?
3. What is a table variable?
4. Difference between temp table and table variable?
5. Difference between CTE and temp table?
6. When do we use temp tables?

## Interview Answer

Temp tables and table variables are used to store temporary data during query execution. Local temp tables start with `#`, global temp tables start with `##`, and table variables start with `@`. CTEs are temporary result sets used only within one query. As a tester, I mainly need awareness because these are common in procedures, reports, and migration scripts.

## Quick Revision

- `#temp` is local temp table.
- `##temp` is global temp table.
- `@table` is table variable.
- CTE exists only for one query.
- Temp tables are useful for intermediate data.
