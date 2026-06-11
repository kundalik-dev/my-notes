# DDL - Data Definition Language

## Simple Explanation

DDL means `Data Definition Language`.

DDL commands are used to `create`, `change`, `rename`, or `delete` database objects like tables, columns, schemas, indexes, and views.

In interviews, remember this point clearly:

- DDL works on database structure.
- DDL commands are usually auto-committed.
- After executing DDL, rollback is usually not possible.

## Why DDL Is Important For Testers

As a tester, we may not create production tables, but we should understand DDL because:

- We verify table structure after deployment.
- We check whether new columns are added correctly.
- We validate column data types and constraints.
- We review database changes in release notes.
- We test whether application changes match database changes.
- We understand issues like missing column, wrong data type, or dropped table.

Example: If a new `MobileNumber` field is added in the application, the database table should also have a proper column for it.

## Common DDL Commands

| Command    | Used For                                 | Example Use                             |
| ---------- | ---------------------------------------- | --------------------------------------- |
| `CREATE`   | Create a new database object             | Create a new table                      |
| `ALTER`    | Modify an existing object                | Add, modify, or drop a column           |
| `DROP`     | Delete an object permanently             | Delete a table                          |
| `TRUNCATE` | Remove all rows but keep table structure | Clear all test data from a table        |
| `RENAME`   | Rename an object                         | Rename old table name to new table name |

## CREATE TABLE

`CREATE TABLE` is used to create a new table with columns and data types.

```sql
CREATE TABLE Users (
    UserId INT,
    UserName VARCHAR(100),
    Email VARCHAR(150),
    CreatedDate DATETIME
);
```

### Interview Point

`CREATE TABLE` defines the table name, column names, data types, and optional constraints.

### Tester Point

Tester can verify:

- Table is created with correct name.
- Required columns are present.
- Data types are correct.
- Mandatory constraints are applied.

## ALTER TABLE

- `ALTER TABLE` is used to change an existing table structure.
- It can add, delete, modify columns from existing table.
- `ALTER TABLE` can also add and drop `contraints` from existing tables.

### Add New Column

```sql
ALTER TABLE Users
ADD MobileNumber VARCHAR(15);
```

### Modify Column Data Type

```sql
ALTER TABLE Users
ALTER COLUMN UserName VARCHAR(150);
```

### Drop Column

```sql
ALTER TABLE Users
DROP COLUMN MobileNumber;
```

### Interview Point

`ALTER TABLE` is used when table structure needs to be changed after table creation.

### Tester Point

If a new field is added in UI, API, or requirement document, tester should check whether the related database column is also available.

## DROP TABLE

`DROP TABLE` permanently deletes the table structure and data.

```sql
DROP TABLE Users;
```

### Important Point

After `DROP TABLE`, the table itself is removed. Data and structure are both deleted.

### Tester Point

Testers should be very careful with `DROP` commands. It should not be used on important environments unless clearly approved.

## TRUNCATE TABLE

`TRUNCATE TABLE` removes all rows from a table but keeps the table structure.

```sql
TRUNCATE TABLE Users;
```

### Important Point

`TRUNCATE` is faster than `DELETE` when removing all records because it does not delete rows one by one.

### Tester Point

In lower environments, `TRUNCATE` may be used to quickly clean test data from a table. But it should be used carefully because it removes all records.

## RENAME TABLE

`RENAME` is used to change the name of a table or database object.

Syntax depends on the database.

### MySQL Example

```sql
RENAME TABLE Users TO AppUsers;
```

### SQL Server Example

```sql
EXEC sp_rename 'Users', 'AppUsers';
```

### Tester Point

If table names change, old SQL validation queries may fail. Tester should update SQL queries used for testing.

## DROP vs DELETE vs TRUNCATE

This is a very common interview question.

| Point                   | DROP                    | DELETE                  | TRUNCATE                   |
| ----------------------- | ----------------------- | ----------------------- | -------------------------- |
| Command Type            | DDL                     | DML                     | DDL                        |
| Removes Data            | Yes                     | Yes                     | Yes                        |
| Removes Table Structure | Yes                     | No                      | No                         |
| Can Use WHERE           | No                      | Yes                     | No                         |
| Rollback                | Usually not possible    | Possible before commit  | Usually not possible       |
| Speed                   | Fast                    | Slower for many rows    | Fast                       |
| Use Case                | Remove table completely | Delete selected records | Remove all records quickly |

### Simple Memory Trick

- `DROP`: removes table.
- `DELETE`: removes selected rows.
- `TRUNCATE`: removes all rows, keeps table.

## Auto Commit In DDL

DDL commands are usually auto-committed.

It means once a DDL command is executed, changes are saved automatically.

Example:

- If we execute `DROP TABLE`, table deletion is committed automatically in many databases.
- We usually cannot rollback it like normal DML changes.

## Real Project Example

Suppose a new requirement says:

"User should be able to save alternate mobile number."

As a tester, I can verify:

- UI has alternate mobile number field.
- API accepts alternate mobile number.
- Database has a column like `AlternateMobileNumber`.
- Data type is suitable, like `VARCHAR(15)`.
- Value is saved correctly after form submission.

## Common Interview Questions

1. What is DDL?
2. Which commands come under DDL?
3. What is the difference between `DROP`, `DELETE`, and `TRUNCATE`?
4. Can we rollback DDL commands?
5. What is the difference between `CREATE` and `ALTER`?
6. What happens when we use `DROP TABLE`?
7. Why should testers know DDL?

## Interview Answer

DDL stands for Data Definition Language. It is used to define and modify database structure. Common DDL commands are `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, and `RENAME`. These commands work on tables and other database objects. DDL commands are usually auto-committed, so rollback is generally not possible. As a tester, I use DDL knowledge to understand table structure, verify columns, data types, and database changes after deployment.

## Quick Revision

- DDL changes database structure.
- Common DDL commands are `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, and `RENAME`.
- DDL is usually auto-committed.
- `CREATE` creates a table.
- `ALTER` changes table structure.
- `DROP` deletes table structure and data.
- `TRUNCATE` deletes all rows but keeps table structure.
- `DELETE` is DML, not DDL.
- Testers should understand DDL to verify database structure changes.
