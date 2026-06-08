# SQL Topic List — Complete Learning Guide

## 1. SQL Basics

- What is SQL? What is a Database?
- Types of SQL commands: DDL, DML, DCL, TCL
- SQL data types: INT, VARCHAR, CHAR, TEXT, DATE, DATETIME, BOOLEAN, DECIMAL, FLOAT
- SQL syntax rules: case sensitivity, semicolons, comments (`--`, `/* */`)
- What is a Table, Row (Record), and Column (Field)?
- What is a Schema?

---

## 2. DDL — Data Definition Language

- `CREATE TABLE` — create a new table
- `ALTER TABLE` — add, modify, or drop columns
- `DROP TABLE` — permanently delete a table
- `TRUNCATE TABLE` — remove all rows but keep structure
- `RENAME TABLE` — rename a table
- Difference between DROP, DELETE, and TRUNCATE

---

## 3. DML — Data Manipulation Language

- `INSERT INTO` — add new rows
- `INSERT INTO ... SELECT` — insert from another table
- `UPDATE ... SET ... WHERE` — update existing rows
- `DELETE FROM ... WHERE` — delete specific rows
- Difference between UPDATE and DELETE

---

## 4. SELECT Queries and Filtering

- Basic `SELECT` and `SELECT *`
- Column aliases with `AS`
- `WHERE` clause — filtering rows
- Logical operators: `AND`, `OR`, `NOT`
- `IN` — match a list of values
- `BETWEEN` — range filtering
- `LIKE` — pattern matching (`%` and `_`)
- `IS NULL` / `IS NOT NULL`
- `DISTINCT` — remove duplicate results
- `ORDER BY` — sort results (ASC / DESC)
- `LIMIT` / `TOP` / `ROWNUM` — restrict number of rows returned

---

## 5. Aggregate Functions

- `COUNT()` — count rows
- `SUM()` — sum of values
- `AVG()` — average value
- `MIN()` — minimum value
- `MAX()` — maximum value
- `GROUP BY` — group rows for aggregation
- `HAVING` — filter after grouping
- Difference between `WHERE` and `HAVING`
- Using aggregate functions without `GROUP BY`

---

## 6. JOINs

- `INNER JOIN` — only matching rows from both tables
- `LEFT JOIN` (LEFT OUTER JOIN) — all rows from left table
- `RIGHT JOIN` (RIGHT OUTER JOIN) — all rows from right table
- `FULL OUTER JOIN` — all rows from both tables
- `SELF JOIN` — join a table with itself
- `CROSS JOIN` — cartesian product (every row × every row)
- Joining more than two tables
- Join vs Subquery — when to use which

---

## 7. Subqueries

- Subquery in `WHERE` clause
- Subquery in `FROM` clause (inline view / derived table)
- Subquery in `SELECT` clause
- Correlated subquery — references outer query
- `IN` with subquery
- `EXISTS` and `NOT EXISTS`
- Difference between `IN` and `EXISTS`

---

## 8. String Functions

- `LEN()` / `LENGTH()` — string length
- `UPPER()` / `LOWER()` — change case
- `TRIM()` / `LTRIM()` / `RTRIM()` — remove spaces
- `SUBSTRING()` / `SUBSTR()` — extract part of string
- `LEFT()` / `RIGHT()` — extract from left or right
- `CHARINDEX()` / `INSTR()` — find position of character
- `REPLACE()` — replace part of string
- `CONCAT()` — combine strings
- `REVERSE()` — reverse a string

---

## 9. Date and Time Functions

- `GETDATE()` / `NOW()` / `SYSDATE` — current date and time
- `DATEADD()` — add days/months/years to a date
- `DATEDIFF()` — difference between two dates
- `DAY()` / `MONTH()` / `YEAR()` — extract date parts
- `FORMAT()` — format a date as string
- `CAST()` and `CONVERT()` — convert data types
- `EOMONTH()` — last day of a month
- `DATEPART()` — extract specific part of date

---

## 10. NULL Handling

- What is NULL in SQL?
- `IS NULL` / `IS NOT NULL`
- `COALESCE()` — return first non-NULL value
- `ISNULL()` — replace NULL with a value (SQL Server)
- `NULLIF()` — return NULL if two values are equal
- How NULL behaves in comparisons and aggregates
- NULL in `ORDER BY` (where does it sort?)

---

## 11. Constraints

- `PRIMARY KEY` — unique identifier, not null
- `FOREIGN KEY` — links to another table's primary key
- `UNIQUE` — no duplicate values in column
- `NOT NULL` — column cannot be empty
- `DEFAULT` — assign default value if none provided
- `CHECK` — validate data before insert/update
- Difference between PRIMARY KEY and UNIQUE KEY
- Composite primary key

---

## 12. Keys and Relationships

- Primary Key
- Foreign Key and referential integrity
- Candidate Key
- Composite Key
- Surrogate Key vs Natural Key
- One-to-One, One-to-Many, Many-to-Many relationships

---

## 13. Indexes

- What is an index and why it improves performance
- Clustered Index — physically sorts table rows
- Non-Clustered Index — separate structure with row pointers
- Composite Index — index on multiple columns
- Unique Index
- When indexes help and when they can slow down writes
- How to create and drop an index

---

## 14. Views

- What is a View?
- Create, use, and drop a View
- Updatable Views vs Read-Only Views
- View vs Table — key differences
- When to use a View in real projects
- Indexed Views (Materialized Views)

---

## 15. Stored Procedures

- What is a Stored Procedure?
- Create, execute, alter, and drop a stored procedure
- Input and output parameters
- Stored Procedure vs Function — key differences
- When to use stored procedures in QA/testing

---

## 16. User-Defined Functions (UDFs)

- Scalar Function — returns a single value
- Table-Valued Function — returns a table
- How to use a function inside a SELECT query
- Function vs Stored Procedure

---

## 17. Transactions and TCL

- What is a Transaction?
- `BEGIN TRANSACTION` / `BEGIN`
- `COMMIT` — save changes permanently
- `ROLLBACK` — undo changes
- `SAVEPOINT` — partial rollback point
- ACID properties: Atomicity, Consistency, Isolation, Durability
- Isolation levels: READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ, SERIALIZABLE
- Dirty Read, Phantom Read, Non-Repeatable Read

---

## 18. Window Functions (Advanced)

- What are Window Functions? (analytic functions)
- `ROW_NUMBER()` — unique row number per partition
- `RANK()` — rank with gaps for ties
- `DENSE_RANK()` — rank without gaps
- `NTILE(n)` — divide rows into n equal buckets
- `LAG()` — access previous row value
- `LEAD()` — access next row value
- `FIRST_VALUE()` / `LAST_VALUE()` — first or last value in window
- `SUM() OVER()` / `AVG() OVER()` — running totals and moving averages
- `PARTITION BY` — divide rows into groups within a window
- Difference between `GROUP BY` and `PARTITION BY`

---

## 19. CTEs — Common Table Expressions

- What is a CTE? (`WITH` clause)
- Simple CTE syntax
- Multiple CTEs in one query
- Recursive CTE — for hierarchical data (org chart, file paths)
- CTE vs Subquery — when to use which
- Delete duplicates using CTE with `ROW_NUMBER()`

---

## 20. Set Operators

- `UNION` — combine results, removes duplicates
- `UNION ALL` — combine results, keeps duplicates
- `INTERSECT` — rows that exist in both queries
- `EXCEPT` / `MINUS` — rows in first query but not in second
- Rules for using set operators (same number of columns, compatible types)

---

## 21. DCL — Data Control Language

- `GRANT` — give permissions to users
- `REVOKE` — remove permissions from users
- Roles and Privileges

---

## 22. Normalization

- What is Normalization and why it matters
- 1NF — First Normal Form (no repeating groups)
- 2NF — Second Normal Form (no partial dependency)
- 3NF — Third Normal Form (no transitive dependency)
- BCNF — Boyce-Codd Normal Form
- Denormalization — when and why
- Normalization vs Denormalization trade-off

---

## 23. SQL Performance and Optimization

- Reading an Execution Plan
- Using indexes effectively
- Avoiding `SELECT *` in production queries
- Avoiding functions on indexed columns in WHERE clause
- When to use EXISTS instead of IN
- Avoiding cursor-based loops — prefer set-based operations
- Query hints (basic awareness)
- Difference between temp tables and table variables

---

## 24. Database Testing (QA-Specific)

- What is Database Testing?
- Structural testing — table structure, constraints, indexes
- Data integrity testing — referential integrity, NULL checks
- Functional testing — stored procedures, triggers, views
- Data migration testing — row count, data accuracy checks
- Performance testing — slow queries, index usage
- Security testing — access control, SQL injection

---

## 25. SQL for Automation Testing (QA Use Cases)

- Verify data after automation test execution
- Validate API response data against DB records
- Set up test data before test run using INSERT
- Clean up test data after test run using DELETE
- Find duplicate records in test data
- Check for orphan/inconsistent records
- Compare row counts between tables
- Validate data types and column values
- Write SQL assertions in test automation

---

## 26. Triggers (Awareness Level)

- What is a Trigger?
- BEFORE and AFTER triggers
- INSERT, UPDATE, DELETE triggers
- Use cases for triggers in testing

---

## 27. Temp Tables and Table Variables

- Temporary table (`#temp`) — session-scoped
- Global temp table (`##temp`) — all sessions
- Table variable (`@table`) — batch/function scope
- When to use temp table vs table variable vs CTE

---

## 28. SQL Server vs MySQL vs Oracle — Key Differences

| Feature | SQL Server | MySQL | Oracle |
|---------|------------|-------|--------|
| Auto increment | IDENTITY | AUTO_INCREMENT | SEQUENCE |
| Top N rows | TOP N | LIMIT N | ROWNUM / FETCH FIRST |
| String concat | + or CONCAT | CONCAT | \|\| or CONCAT |
| Current date | GETDATE() | NOW() | SYSDATE |
| Null check | ISNULL() | IFNULL() | NVL() |

---

## Quick Topic Checklist

### Beginner

- [ ] DDL commands
- [ ] DML commands
- [ ] SELECT with WHERE, ORDER BY, DISTINCT
- [ ] Aggregate functions with GROUP BY and HAVING
- [ ] Basic JOINs (INNER, LEFT)
- [ ] NULL handling with COALESCE

### Intermediate

- [ ] All JOIN types including SELF JOIN
- [ ] Subqueries and correlated subqueries
- [ ] EXISTS vs IN
- [ ] String and Date functions
- [ ] Constraints and Keys
- [ ] Indexes — clustered vs non-clustered
- [ ] Views and Stored Procedures
- [ ] Transactions and ACID

### Advanced

- [ ] Window functions (ROW_NUMBER, RANK, LAG, LEAD)
- [ ] CTEs and Recursive CTEs
- [ ] Set operators (UNION, INTERSECT, EXCEPT)
- [ ] Normalization (1NF to 3NF)
- [ ] Query optimization basics
- [ ] Temp tables vs CTEs

### QA-Specific

- [ ] Database testing types
- [ ] SQL for test data setup and cleanup
- [ ] Data validation queries
- [ ] Duplicate and orphan record detection
- [ ] Migration validation queries
