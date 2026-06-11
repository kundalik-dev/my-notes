# SQL Server vs MySQL vs Oracle

## Simple Explanation

SQL concepts are mostly common across databases, but syntax and built-in functions can be different.

As a tester, it is important to know which database is used in the project before writing SQL queries.

## Why This Is Important For Testers

Same logic may need different syntax in different databases.

Example:

- SQL Server uses `TOP`.
- MySQL uses `LIMIT`.
- Oracle uses `ROWNUM` or `FETCH FIRST`.

If tester uses wrong syntax, query may fail even if logic is correct.

## Key Differences

| Feature | SQL Server | MySQL | Oracle |
| ------- | ---------- | ----- | ------ |
| Auto increment | `IDENTITY` | `AUTO_INCREMENT` | `SEQUENCE` |
| Top rows | `TOP N` | `LIMIT N` | `ROWNUM` / `FETCH FIRST` |
| String concat | `+` or `CONCAT()` | `CONCAT()` | `||` or `CONCAT()` |
| Current date | `GETDATE()` | `NOW()` | `SYSDATE` |
| Null replacement | `ISNULL()` | `IFNULL()` | `NVL()` |
| String length | `LEN()` | `LENGTH()` | `LENGTH()` |
| Find position | `CHARINDEX()` | `INSTR()` | `INSTR()` |

## Auto Increment

SQL Server:

```sql
UserId INT IDENTITY(1,1)
```

MySQL:

```sql
UserId INT AUTO_INCREMENT
```

Oracle:

```sql
CREATE SEQUENCE UserSeq START WITH 1 INCREMENT BY 1;
```

## Fetch Top Records

SQL Server:

```sql
SELECT TOP 10 *
FROM Users;
```

MySQL:

```sql
SELECT *
FROM Users
LIMIT 10;
```

Oracle:

```sql
SELECT *
FROM Users
WHERE ROWNUM <= 10;
```

## Current Date

SQL Server:

```sql
SELECT GETDATE();
```

MySQL:

```sql
SELECT NOW();
```

Oracle:

```sql
SELECT SYSDATE FROM dual;
```

## NULL Replacement

SQL Server:

```sql
SELECT ISNULL(MobileNumber, 'Not Available')
FROM Users;
```

MySQL:

```sql
SELECT IFNULL(MobileNumber, 'Not Available')
FROM Users;
```

Oracle:

```sql
SELECT NVL(MobileNumber, 'Not Available')
FROM Users;
```

## String Concatenation

SQL Server:

```sql
SELECT FirstName + ' ' + LastName AS FullName
FROM Users;
```

MySQL:

```sql
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Users;
```

Oracle:

```sql
SELECT FirstName || ' ' || LastName AS FullName
FROM Users;
```

## Tester Interview Points

- Always confirm database type before writing queries.
- SQL basics are common, but functions can differ.
- Date functions are commonly different.
- Top row syntax is different.
- Auto increment handling is different.
- Existing project queries should be followed for syntax style.

## Real Project Example

If project database changes from SQL Server to MySQL, this query must change:

SQL Server:

```sql
SELECT TOP 5 *
FROM Orders
ORDER BY CreatedDate DESC;
```

MySQL:

```sql
SELECT *
FROM Orders
ORDER BY CreatedDate DESC
LIMIT 5;
```

## Common Interview Questions

1. Are SQL Server, MySQL, and Oracle syntax same?
2. How do you fetch top 10 rows in SQL Server and MySQL?
3. What is difference in current date functions?
4. How is auto increment handled?
5. What are common function differences testers should know?

## Interview Answer

SQL concepts are mostly same across SQL Server, MySQL, and Oracle, but syntax and built-in functions can differ. For example, SQL Server uses `TOP`, MySQL uses `LIMIT`, and Oracle uses `ROWNUM` or `FETCH FIRST` for top rows. As a tester, I first check which database is used in the project and then write queries according to that database syntax.

## Quick Revision

- SQL concepts are common.
- Syntax differs by database.
- SQL Server uses `TOP`.
- MySQL uses `LIMIT`.
- Oracle uses `ROWNUM` or `FETCH FIRST`.
- Current date and NULL functions differ.
