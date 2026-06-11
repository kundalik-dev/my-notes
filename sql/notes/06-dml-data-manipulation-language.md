# DML - Data Manipulation Language

## Simple Explanation

DML means `Data Manipulation Language`.

DML commands are used to insert, update, and delete records from database tables.

Important interview point:

- DML works on table data.
- DML commands are not always auto-committed.
- Rollback is possible before `COMMIT`, depending on database and transaction settings.

## Why DML Is Important For Testers

Testers use DML knowledge to:

- Create test data before testing.
- Update backend data for specific test scenarios.
- Clean test data after execution.
- Verify whether UI or API actions changed database records correctly.
- Understand data issues like wrong status, duplicate records, or missing records.

## Common DML Commands

| Command | Used For | Tester Example |
| ------- | -------- | -------------- |
| `INSERT` | Add new records | Add test user or test order |
| `UPDATE` | Modify existing records | Change order status for testing |
| `DELETE` | Delete selected records | Remove test data |

## INSERT

`INSERT` is used to add new records into a table.

```sql
INSERT INTO Users (UserId, UserName, Email, Status)
VALUES (101, 'Rahul', 'rahul@test.com', 'Active');
```

### Tester Point

In test environments, testers may insert test data directly when UI setup is time-consuming.

## INSERT INTO SELECT

This copies data from one table to another.

```sql
INSERT INTO ArchivedUsers (UserId, UserName, Email)
SELECT UserId, UserName, Email
FROM Users
WHERE Status = 'Inactive';
```

### Interview Point

`INSERT INTO SELECT` is useful when we need to copy selected records from one table to another.

## UPDATE

`UPDATE` changes existing records.

```sql
UPDATE Users
SET Status = 'Inactive'
WHERE UserId = 101;
```

### Very Important Warning

Always use `WHERE` with `UPDATE`.

Without `WHERE`, all records may get updated.

```sql
UPDATE Users
SET Status = 'Inactive';
```

This updates every user, which can create a serious issue.

## DELETE

`DELETE` removes selected records from a table.

```sql
DELETE FROM Users
WHERE UserId = 101;
```

### Very Important Warning

Always use `WHERE` with `DELETE`.

Without `WHERE`, all records may be deleted.

## UPDATE vs DELETE

| Point | UPDATE | DELETE |
| ----- | ------ | ------ |
| Purpose | Modify records | Remove records |
| Works On | Existing rows | Existing rows |
| WHERE Needed | Yes, to update selected rows | Yes, to delete selected rows |
| Risk Without WHERE | Updates all rows | Deletes all rows |
| Tester Use | Change status or value | Clean test data |

## Real Project Example

Suppose an order needs to be tested in `Cancelled` status.

If UI flow is long, in a lower environment a tester may update the status directly:

```sql
UPDATE Orders
SET Status = 'Cancelled'
WHERE OrderId = 5001;
```

After that, the tester can validate how the application behaves for cancelled orders.

## Common Interview Questions

1. What is DML?
2. Which commands come under DML?
3. What is the difference between `UPDATE` and `DELETE`?
4. Why is `WHERE` important in `UPDATE` and `DELETE`?
5. Can we rollback DML commands?
6. How do testers use DML in real projects?

## Interview Answer

DML stands for Data Manipulation Language. It is used to work with data stored inside tables. Common DML commands are `INSERT`, `UPDATE`, and `DELETE`. In testing, I use DML concepts to prepare test data, update test records, clean test data, and verify whether application actions are reflected correctly in the database. We should use `WHERE` carefully with `UPDATE` and `DELETE` because missing `WHERE` can affect all rows.

## Quick Revision

- DML works with table data.
- `INSERT` adds records.
- `UPDATE` modifies records.
- `DELETE` removes selected records.
- Use `WHERE` carefully.
- DML rollback is possible before commit in transaction-supported environments.
