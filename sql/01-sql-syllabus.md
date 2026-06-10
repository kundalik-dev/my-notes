# SQL Interview Syllabus — Automation Testing (6 Years Experience)

## About This Syllabus

This syllabus is designed for a QA professional with 6 years of experience preparing for automation testing interviews. SQL questions at this level focus on data validation, test data management, writing queries for testing purposes, and understanding DB concepts — not deep DBA knowledge.

---

## Level Expectation at 6 Years

At this experience level, interviewers expect:

- Confident writing of SELECT queries without help.
- Use of JOINs, GROUP BY, HAVING, and subqueries comfortably.
- Understanding of indexes, constraints, and transactions.
- Ability to write SQL to validate data for automation test cases.
- Basic stored procedure and view knowledge.
- DB testing concepts (data integrity, schema validation).

---

## Module 1 — SQL Basics (Revision)

> Even at senior level, basics are asked in interviews. Revise quickly.

### Topics

- What is SQL? DDL, DML, DCL, TCL
- Data types: INT, VARCHAR, DATE, BOOLEAN, DECIMAL
- CREATE, INSERT, UPDATE, DELETE, DROP, TRUNCATE, ALTER
- WHERE, AND, OR, NOT, IN, BETWEEN, LIKE, IS NULL
- ORDER BY, DISTINCT, LIMIT / TOP / ROWNUM

### Key Interview Questions

1. What is the difference between DELETE, DROP, and TRUNCATE?
2. What is the difference between WHERE and HAVING?
3. What is the difference between CHAR and VARCHAR?
4. How do you find NULL values in a column?
5. What does DISTINCT do?

### Must-Know Answer

**DELETE vs TRUNCATE vs DROP:**
- DELETE removes rows one by one, supports WHERE, can be rolled back.
- TRUNCATE removes all rows at once, faster, cannot be rolled back in most databases.
- DROP removes the entire table with structure.

---

## Module 2 — SELECT Queries and Filtering

### Topics

- SELECT with aliases
- Filtering with WHERE conditions
- Pattern matching with LIKE (`%`, `_`)
- NULL handling: IS NULL, IS NOT NULL, COALESCE, ISNULL
- Sorting with ORDER BY (ASC/DESC)
- Limiting results: TOP (SQL Server), LIMIT (MySQL), ROWNUM (Oracle)

### Practice Queries

```sql
-- Find all users with email containing 'test'
SELECT * FROM users WHERE email LIKE '%test%';

-- Find orders placed in the last 7 days
SELECT * FROM orders WHERE order_date >= DATEADD(DAY, -7, GETDATE());

-- Replace NULL with a default value
SELECT name, COALESCE(phone, 'Not Provided') AS phone FROM customers;

-- Get top 5 highest salary employees
SELECT TOP 5 name, salary FROM employees ORDER BY salary DESC;
```

### Key Interview Questions

1. How do you search for records where a column contains a specific word?
2. How do you handle NULL values in a query?
3. What is the use of COALESCE?

---

## Module 3 — Aggregate Functions and GROUP BY

### Topics

- COUNT, SUM, AVG, MIN, MAX
- GROUP BY with aggregate functions
- HAVING clause (filter after grouping)
- Difference between WHERE and HAVING

### Practice Queries

```sql
-- Count total test cases per module
SELECT module, COUNT(*) AS total_cases FROM test_cases GROUP BY module;

-- Find modules with more than 10 failed test cases
SELECT module, COUNT(*) AS failed_count
FROM test_cases
WHERE status = 'FAILED'
GROUP BY module
HAVING COUNT(*) > 10;

-- Average execution time per test suite
SELECT suite_name, AVG(execution_time) AS avg_time
FROM test_results
GROUP BY suite_name;
```

### Key Interview Questions

1. What is the difference between WHERE and HAVING?
2. Can you use aggregate functions without GROUP BY?
3. How do you find the second highest salary?

### Must-Know Answer

**Second highest salary:**
```sql
SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);
```

---

## Module 4 — JOINs (Very Important)

### Topics

- INNER JOIN — only matching rows from both tables
- LEFT JOIN — all rows from left, matching from right (NULL if no match)
- RIGHT JOIN — all rows from right, matching from left
- FULL OUTER JOIN — all rows from both tables
- SELF JOIN — join a table with itself
- CROSS JOIN — cartesian product

### Practice Queries

```sql
-- Get all test cases with their assigned tester name
SELECT tc.test_case_id, tc.title, u.name AS tester
FROM test_cases tc
INNER JOIN users u ON tc.assigned_to = u.user_id;

-- Get all test cases including unassigned ones (no tester)
SELECT tc.test_case_id, tc.title, u.name AS tester
FROM test_cases tc
LEFT JOIN users u ON tc.assigned_to = u.user_id;

-- Find employees who are also managers (self join)
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;
```

### Key Interview Questions

1. What is the difference between INNER JOIN and LEFT JOIN?
2. What is a SELF JOIN? Give a real example.
3. What happens if there is no match in a LEFT JOIN?
4. When would you use FULL OUTER JOIN?

---

## Module 5 — Subqueries and Nested Queries

### Topics

- Subquery in WHERE clause
- Subquery in FROM clause (derived table)
- Subquery in SELECT clause
- Correlated subquery
- EXISTS and NOT EXISTS

### Practice Queries

```sql
-- Find test cases that have no test results recorded
SELECT * FROM test_cases
WHERE test_case_id NOT IN (SELECT test_case_id FROM test_results);

-- Find employees earning more than the average salary
SELECT name, salary FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Using EXISTS
SELECT * FROM test_cases tc
WHERE EXISTS (
    SELECT 1 FROM bugs b WHERE b.test_case_id = tc.test_case_id
);
```

### Key Interview Questions

1. What is a correlated subquery?
2. What is the difference between IN and EXISTS?
3. How do you find records that do not exist in another table?

---

## Module 6 — String and Date Functions

### Topics

**String Functions:**
- LEN / LENGTH, UPPER, LOWER, TRIM, LTRIM, RTRIM
- SUBSTRING / SUBSTR, CHARINDEX / INSTR
- REPLACE, CONCAT, LEFT, RIGHT

**Date Functions:**
- GETDATE() / NOW() / SYSDATE
- DATEADD, DATEDIFF
- FORMAT, CONVERT, CAST
- DAY(), MONTH(), YEAR()

### Practice Queries

```sql
-- Extract first name from full name
SELECT LEFT(full_name, CHARINDEX(' ', full_name) - 1) AS first_name FROM employees;

-- Find test results from the current month
SELECT * FROM test_results
WHERE MONTH(run_date) = MONTH(GETDATE()) AND YEAR(run_date) = YEAR(GETDATE());

-- Calculate how many days since a bug was raised
SELECT bug_id, DATEDIFF(DAY, raised_date, GETDATE()) AS days_open FROM bugs;
```

### Key Interview Questions

1. How do you extract the year from a date column?
2. What is DATEDIFF used for?
3. How do you convert a string to uppercase in SQL?

---

## Module 7 — Window Functions (Senior Level Must-Know)

### Topics

- ROW_NUMBER() — unique row number per partition
- RANK() — rank with gaps for ties
- DENSE_RANK() — rank without gaps
- NTILE(n) — divide rows into n buckets
- LAG() / LEAD() — access previous/next row value
- PARTITION BY with window functions

### Practice Queries

```sql
-- Rank employees by salary within each department
SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

-- Assign row number to test results per test case
SELECT test_case_id, run_date, status,
       ROW_NUMBER() OVER (PARTITION BY test_case_id ORDER BY run_date DESC) AS run_number
FROM test_results;

-- Get only the latest run per test case
SELECT * FROM (
    SELECT test_case_id, run_date, status,
           ROW_NUMBER() OVER (PARTITION BY test_case_id ORDER BY run_date DESC) AS rn
    FROM test_results
) t WHERE rn = 1;
```

### Key Interview Questions

1. What is the difference between RANK and DENSE_RANK?
2. How do you get the latest record per group?
3. What is the use of PARTITION BY?
4. What is the difference between ROW_NUMBER and RANK?

---

## Module 8 — Constraints and Keys

### Topics

- PRIMARY KEY — uniquely identifies each row
- FOREIGN KEY — links two tables
- UNIQUE — no duplicate values allowed
- NOT NULL — column cannot be empty
- DEFAULT — default value if none provided
- CHECK — validates data before insert

### Key Interview Questions

1. What is the difference between PRIMARY KEY and UNIQUE KEY?
2. Can a table have multiple UNIQUE keys?
3. What is a FOREIGN KEY and why is it important?
4. What is referential integrity?

### Must-Know Answer

**PRIMARY KEY vs UNIQUE KEY:**
- Primary Key: Only one per table, cannot be NULL, uniquely identifies each row.
- Unique Key: Multiple allowed per table, can have one NULL value, enforces uniqueness.

---

## Module 9 — Indexes

### Topics

- What is an index and why we use it
- Clustered index vs Non-clustered index
- When indexes improve performance
- When indexes can slow down writes
- Composite index

### Key Interview Questions

1. What is an index in SQL?
2. What is the difference between clustered and non-clustered index?
3. Can a table have more than one clustered index?
4. Does an index always improve performance?

### Must-Know Answer

**Clustered vs Non-clustered:**
- Clustered index: Physically sorts table data. Only one per table. Primary Key creates this by default.
- Non-clustered index: Separate structure with pointers to table data. Multiple allowed.

---

## Module 10 — Transactions and ACID Properties

### Topics

- BEGIN TRANSACTION, COMMIT, ROLLBACK
- SAVEPOINT
- ACID: Atomicity, Consistency, Isolation, Durability
- Isolation levels: READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ, SERIALIZABLE

### Key Interview Questions

1. What are ACID properties?
2. What is a transaction in SQL?
3. What is the difference between COMMIT and ROLLBACK?
4. What is a dirty read?

### Must-Know Answer

**ACID:**
- **Atomicity:** All steps in a transaction succeed or all fail together.
- **Consistency:** Database stays in a valid state before and after the transaction.
- **Isolation:** Transactions do not interfere with each other.
- **Durability:** Once committed, changes are permanent even after a crash.

---

## Module 11 — Views, Stored Procedures, Functions

### Topics

- VIEW — saved SELECT query, no stored data
- Stored Procedure — reusable SQL code block with parameters
- User-Defined Function — returns a value, used inside queries
- Difference between SP and Function

### Practice Queries

```sql
-- Create a view for active test cases
CREATE VIEW active_test_cases AS
SELECT * FROM test_cases WHERE status = 'ACTIVE';

-- Stored procedure to get test results by status
CREATE PROCEDURE GetTestResultsByStatus @status VARCHAR(50)
AS
BEGIN
    SELECT * FROM test_results WHERE status = @status;
END;

-- Execute stored procedure
EXEC GetTestResultsByStatus 'FAILED';
```

### Key Interview Questions

1. What is the difference between a View and a Table?
2. What is a stored procedure and when do you use it?
3. What is the difference between a stored procedure and a function?
4. Can a view be updated?

---

## Module 12 — SQL for QA and Database Testing

> This is the most unique part for automation testers. Practice these specifically.

### Topics

- Validating data after automation test execution
- Checking data inserted, updated, or deleted by test
- Verifying foreign key relationships
- Finding duplicate records
- Comparing counts between tables
- Checking data migrations
- Test data setup and cleanup using SQL

### Practice Queries for QA Context

```sql
-- Verify a new user was correctly inserted
SELECT * FROM users WHERE email = 'testuser@example.com';

-- Verify order total is correctly calculated
SELECT order_id, SUM(price * quantity) AS calculated_total
FROM order_items
GROUP BY order_id;

-- Find duplicate email entries (data quality check)
SELECT email, COUNT(*) AS count FROM users
GROUP BY email HAVING COUNT(*) > 1;

-- Compare record count between source and target table (migration check)
SELECT
    (SELECT COUNT(*) FROM source_orders) AS source_count,
    (SELECT COUNT(*) FROM target_orders) AS target_count;

-- Orphan records check (referential integrity)
SELECT * FROM order_items oi
WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.order_id = oi.order_id);

-- Test data cleanup after test run
DELETE FROM users WHERE email LIKE '%testuser%' AND created_date >= CAST(GETDATE() AS DATE);
```

### Key Interview Questions for QA

1. How do you use SQL in your automation testing work?
2. How do you verify data after an API test?
3. How do you validate data migration using SQL?
4. How do you find duplicate records?
5. How do you do database testing?
6. How do you clean up test data after a test run?

### Interview Answer — How Do You Use SQL in Automation Testing?

> Spoken answer for interviews:

"In my automation testing work, I use SQL mainly for three purposes. First, I use SELECT queries to verify that data is correctly saved in the database after my test actions — for example, after submitting a form, I check that the record appears in the database with correct values. Second, I use SQL to set up test data before a test run and clean it up afterward. Third, I use queries to validate data integrity — for example, checking for duplicate records, orphan records, or correct foreign key relationships. I am comfortable writing JOINs, subqueries, and aggregate queries for these validation tasks."

---

## Module 13 — Common SQL Interview Queries to Practice

Practice writing these from memory before your interview:

```sql
-- 1. Second highest salary
SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);

-- 2. Find duplicates
SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name HAVING COUNT(*) > 1;

-- 3. Delete duplicate rows keeping one
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn FROM users
)
DELETE FROM CTE WHERE rn > 1;

-- 4. Latest record per group
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY created_date DESC) AS rn
    FROM orders
) t WHERE rn = 1;

-- 5. Count NULLs in a column
SELECT COUNT(*) - COUNT(column_name) AS null_count FROM table_name;

-- 6. Employees with salary above department average
SELECT e.name, e.salary, e.department
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department = e.department);

-- 7. Cumulative total (running sum)
SELECT name, salary,
       SUM(salary) OVER (ORDER BY name) AS running_total
FROM employees;
```

---

## Quick Revision Checklist

### Must Know (will definitely be asked)

- [ ] DELETE vs TRUNCATE vs DROP
- [ ] INNER JOIN vs LEFT JOIN
- [ ] WHERE vs HAVING
- [ ] PRIMARY KEY vs UNIQUE KEY
- [ ] Clustered vs Non-clustered Index
- [ ] ACID properties
- [ ] Second highest salary query
- [ ] Find duplicate records query
- [ ] ROW_NUMBER vs RANK vs DENSE_RANK
- [ ] Subquery vs JOIN
- [ ] EXISTS vs IN

### Good to Know (asked at senior level)

- [ ] Window functions with PARTITION BY
- [ ] CTE (Common Table Expression)
- [ ] Correlated subquery
- [ ] SELF JOIN with example
- [ ] Isolation levels
- [ ] View vs Stored Procedure
- [ ] Indexes and when they slow down performance
- [ ] Latest record per group using ROW_NUMBER

### QA-Specific (important for automation testing role)

- [ ] How you validate data in DB after test execution
- [ ] Test data setup and cleanup queries
- [ ] Duplicate and orphan record checks
- [ ] Data migration validation queries

---

## Study Plan — 2 Weeks

| Week | Focus Area |
|------|------------|
| Day 1–2 | Module 1, 2, 3 — Basics, SELECT, Aggregates |
| Day 3–4 | Module 4, 5 — JOINs and Subqueries |
| Day 5–6 | Module 6, 7 — String/Date Functions, Window Functions |
| Day 7 | Module 8, 9, 10 — Constraints, Indexes, Transactions |
| Day 8–9 | Module 11 — Views, Stored Procedures |
| Day 10–11 | Module 12 — SQL for QA and DB Testing |
| Day 12–13 | Module 13 — Practice all common queries from memory |
| Day 14 | Mock interview: answer all checklist questions out loud |
