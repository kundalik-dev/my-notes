# SQL for Automation Testing

## Simple Explanation

SQL is useful in automation testing for preparing test data, validating backend data, and cleaning test data.

Automation should not depend only on UI validation when backend validation is important.

## Where SQL Is Used In Automation

| Use Case | Meaning | Example |
| -------- | ------- | ------- |
| Test Data Setup | Create required data before test | Insert test user |
| Test Validation | Verify DB after UI/API action | Check order status |
| Test Data Cleanup | Remove test data after execution | Delete test user |
| API Validation | Compare API response with DB | User status from API and DB |
| Data Comparison | Compare expected and actual records | Migration or report check |

## Verify Data After Test Execution

After registration test:

```sql
SELECT UserId, Email, Status
FROM Users
WHERE Email = 'automationuser@test.com';
```

Automation can assert:

- Record exists.
- Email is correct.
- Status is correct.

## Validate API Response Against DB

API response:

```json
{
  "email": "automationuser@test.com",
  "status": "Active"
}
```

DB query:

```sql
SELECT Email, Status
FROM Users
WHERE Email = 'automationuser@test.com';
```

Tester can compare API response values with DB values.

## Set Up Test Data

```sql
INSERT INTO Users (UserName, Email, Status)
VALUES ('Automation User', 'automationuser@test.com', 'Active');
```

Use setup only in test environments.

## Clean Up Test Data

```sql
DELETE FROM Users
WHERE Email = 'automationuser@test.com';
```

Always use clear `WHERE` condition during cleanup.

## Find Duplicate Test Data

```sql
SELECT Email, COUNT(*) AS DuplicateCount
FROM Users
GROUP BY Email
HAVING COUNT(*) > 1;
```

## Check Orphan Records

Find orders without valid users:

```sql
SELECT O.OrderId, O.UserId
FROM Orders O
LEFT JOIN Users U
ON O.UserId = U.UserId
WHERE U.UserId IS NULL;
```

## Compare Row Counts

```sql
SELECT COUNT(*) AS SourceCount
FROM SourceUsers;

SELECT COUNT(*) AS TargetCount
FROM TargetUsers;
```

## SQL Assertions In Automation

Automation can validate:

- Record exists.
- Record count is correct.
- Column value matches expected value.
- Status changed correctly.
- Duplicate record is not created.

Pseudo example:

```text
UI action: Create user
DB query: SELECT Email FROM Users WHERE Email = test email
Assertion: Email should match expected test email
```

## Best Practices For Automation

- Do not run destructive SQL on shared environments.
- Always clean test data carefully.
- Use unique test data, like timestamp-based email.
- Keep DB queries simple and readable.
- Do not depend on unstable data.
- Use transactions if cleanup safety is needed.
- Avoid adding too many DB validations in UI tests unless required.

## Real Project Example

For order creation automation:

1. Create user from API or DB setup.
2. Place order from UI.
3. Query `Orders` table.
4. Verify order status and amount.
5. Query `Payments` table.
6. Verify payment status.
7. Clean test data if required.

## Common Interview Questions

1. How do you use SQL in automation testing?
2. How do you verify backend data after UI automation?
3. How do you clean test data?
4. How do you compare API response with DB?
5. How do you find duplicate records?
6. What precautions should be taken with SQL in automation?

## Interview Answer

In automation testing, SQL is used for test data setup, backend validation, API response validation, and test data cleanup. For example, after creating a user from UI, I can run a SQL query to verify that the user record is saved correctly in the database. I always use proper `WHERE` conditions and avoid destructive queries in shared environments.

## Quick Revision

- SQL helps setup, validate, and cleanup data.
- Use unique test data.
- Validate UI/API results with DB.
- Use `WHERE` carefully in cleanup.
- DB validation should be meaningful, not excessive.
