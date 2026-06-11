# Database Testing - QA Specific

## Simple Explanation

Database testing means verifying that backend data is correct, complete, consistent, secure, and properly stored.

For QA, SQL is mainly used to validate whether application actions are correctly reflected in the database.

## Why Database Testing Is Important

UI may show correct data, but backend data can still be wrong.

Database testing helps find issues like:

- Data not saved.
- Wrong data saved.
- Duplicate records.
- Missing related records.
- Wrong status update.
- NULL value in mandatory column.
- Incorrect migration data.
- Access permission issues.

## Types of Database Testing

| Type | What To Check | Example |
| ---- | ------------- | ------- |
| Structural Testing | Tables, columns, data types, constraints | New column added correctly |
| Data Integrity Testing | Relationships and valid data | Order has valid UserId |
| Functional Testing | Procedures, triggers, views | Procedure creates correct order |
| Migration Testing | Source vs target data | Row count and data match |
| Performance Testing | Query speed | Report query is slow |
| Security Testing | Access and permissions | Read-only user cannot update |

## Structural Testing

Check database structure:

- Table exists.
- Column exists.
- Data type is correct.
- Constraints are applied.
- Indexes are created if required.

Example:

If requirement adds `AlternateMobileNumber`, verify column exists with correct data type.

## Data Integrity Testing

Check data correctness and relationships.

Examples:

- Every order should have a valid user.
- Payment should be linked to correct order.
- Mandatory fields should not be NULL.
- Duplicate email should not exist.

Query example:

```sql
SELECT O.OrderId, O.UserId
FROM Orders O
LEFT JOIN Users U
ON O.UserId = U.UserId
WHERE U.UserId IS NULL;
```

This finds orders without valid users.

## Functional Database Testing

Validate:

- Stored procedure output.
- Trigger side effects.
- View data.
- Business rules implemented in DB.

Example:

If order status changes to `Shipped`, audit table should get one entry.

## Migration Testing

Check data after moving from old system to new system.

Common checks:

- Source row count vs target row count.
- Important column values match.
- No missing records.
- No extra records.
- Date and amount formats are correct.

```sql
SELECT COUNT(*) FROM SourceUsers;
SELECT COUNT(*) FROM TargetUsers;
```

## Performance Testing

Check whether queries are slow for large data.

Tester can report:

- Query/page/API response time.
- Data volume.
- Filters used.
- Environment.
- Steps to reproduce.

## Security Testing

Check:

- Unauthorized user cannot access restricted data.
- Read-only user cannot update or delete.
- SQL injection is prevented.
- Sensitive data is masked or protected.

## Real Project Example

After placing an order from UI, tester can verify:

```sql
SELECT OrderId, UserId, Status, Amount, CreatedDate
FROM Orders
WHERE OrderId = 1001;
```

Also verify payment:

```sql
SELECT PaymentId, OrderId, PaymentStatus, Amount
FROM Payments
WHERE OrderId = 1001;
```

## Common Interview Questions

1. What is database testing?
2. What do you validate in database testing?
3. What is data integrity testing?
4. How do you validate data migration?
5. How do you check orphan records?
6. How do you validate UI data with database?
7. What SQL queries do testers commonly use?

## Interview Answer

Database testing is used to verify backend data, structure, relationships, procedures, views, triggers, migration data, performance, and security. As a tester, I use SQL queries to validate whether UI or API actions are correctly saved in the database. I also check data integrity, row counts, duplicate records, NULL values, and related table data.

## Quick Revision

- Database testing validates backend data.
- Check UI/API data against DB.
- Validate structure, constraints, and relationships.
- Use joins to validate related tables.
- Use counts for migration checks.
- Use security checks for permissions.
