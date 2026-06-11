# SQL Basics

## Simple Explanation

SQL means `Structured Query Language`. It is used to store, read, update, and delete data from a database.

A database is a collection of related data. In testing, we use SQL to verify application data, check test data, and validate backend records.

## Main Points

### What Is SQL?

- SQL is a language used to communicate with databases.
- We use SQL queries to get data from tables.
- Example: checking whether a newly registered user is saved correctly in the database.

### What Is a Database?

- A database stores data in an organized way.
- Example: an application may have tables for users, orders, payments, and products.

### Types of Database

| Database Type       | Meaning                                      | Example                   |
| ------------------- | -------------------------------------------- | ------------------------- |
| Relational Database | Stores data in tables with rows and columns  | SQL Server, MySQL, Oracle |
| NoSQL Database      | Stores data without fixed table structure    | MongoDB, Cassandra        |
| Cloud Database      | Database hosted on cloud platforms           | Azure SQL, Amazon RDS     |
| In-Memory Database  | Stores data mainly in memory for fast access | Redis                     |

For interview preparation, focus mainly on relational databases because SQL is mostly used with table-based databases.

### Types of SQL Commands

| Command Type | Full Form                    | Purpose                                     | Common Commands                                 |
| ------------ | ---------------------------- | ------------------------------------------- | ----------------------------------------------- |
| DDL          | Data Definition Language     | Used to create or change database structure | `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME` |
| DML          | Data Manipulation Language   | Used to modify data inside tables           | `INSERT`, `UPDATE`, `DELETE`                    |
| DQL          | Data Query Language          | Used to fetch data from tables              | `SELECT`                                        |
| DCL          | Data Control Language        | Used to control user permissions            | `GRANT`, `REVOKE`                               |
| TCL          | Transaction Control Language | Used to manage database transactions        | `COMMIT`, `ROLLBACK`, `SAVEPOINT`               |

#### Different Types of SQL Commands

1. DDL: Data Definition Language
   - DDL commands are used to change the structure of a table.
   - Examples: `CREATE`, `ALTER`, `DROP`, `TRUNCATE`
   - DDL commands are auto-committed. It means undo or rollback is usually not possible.

2. DML: Data Manipulation Language
   - DML commands are related to data stored in the database.
   - They are used to modify records.
   - Examples: `INSERT`, `UPDATE`, `DELETE`
   - DML commands are not auto-committed. It means rollback is possible before commit.

3. DQL: Data Query Language
   - DQL commands are used to fetch data from the database.
   - Example: `SELECT`

4. DCL: Data Control Language
   - DCL commands control access and permissions to database objects.
   - Examples: `GRANT`, `REVOKE`

5. TCL: Transaction Control Language
   - TCL commands are used to control changes made by DML commands.
   - They help maintain data consistency.
   - `COMMIT`: saves valid changes permanently.
   - `ROLLBACK`: undo changes if any error occurs.
   - `SAVEPOINT`: creates a checkpoint to rollback partially.

### Common SQL Data Types

| Data Type  | Used For                   | Example                         |
| ---------- | -------------------------- | ------------------------------- |
| `INT`      | Whole numbers              | `101`, `500`                    |
| `VARCHAR`  | Variable length text       | `'Rahul'`, `'test@example.com'` |
| `CHAR`     | Fixed length text          | `'M'`, `'Y'`                    |
| `TEXT`     | Long text data             | `'Long product description'`    |
| `DATE`     | Date only                  | `'2026-06-11'`                  |
| `DATETIME` | Date and time              | `'2026-06-11 10:30:00'`         |
| `BOOLEAN`  | True or false value        | `TRUE`, `FALSE`                 |
| `DECIMAL`  | Exact decimal number       | `999.99`                        |
| `FLOAT`    | Approximate decimal number | `45.67`                         |

### Schema, Table, Row, and Column

- **Schema**: A schema is a logical container inside a database. It groups database objects like tables, views, stored procedures, and functions.
- **Table**: A table stores data for one entity or topic. Example: `Users`, `Orders`, or `Products`.
- **Row**: A row is one complete record in a table. Example: one user record in the `Users` table.
- **Column**: A column is one field or attribute in a table. Example: `UserName`, `Email`, or `PhoneNumber`.

### SQL Syntax Rules

- SQL keywords are usually written in `uppercase` for readability.
- Semicolon `;` is used to end a SQL statement.
- Single-line comment uses `--`.
- Multi-line comment uses `/* */`.
- SQL is `case-insensitive` language

```sql
-- Get all users
SELECT * FROM Users;
```

## Real Project Example

In a QA project, after creating a user from the application UI, we can run a SQL query to verify that the user record is created correctly in the database.

```sql
SELECT UserName, Email
FROM Users
WHERE Email = 'testuser@example.com';
```

## Interview Answer

SQL is a language used to interact with databases. In testing, I use SQL to verify backend data, check inserted records, validate test data, and confirm that application actions are saved correctly in the database.

## Quick Revision

- SQL is used to work with database data.
- Database stores related data.
- DDL changes structure.
- DML works with data.
- DCL controls permissions.
- TCL controls transactions.
- Table contains rows and columns.
- Schema groups database objects.
