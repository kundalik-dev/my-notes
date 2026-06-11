# NULL Handling

## Simple Explanation

`NULL` means missing, unknown, or not available value.

Important:

- `NULL` is not zero.
- `NULL` is not an empty string.
- `NULL` means value is not present.

## Why NULL Is Important For Testers

Testers should understand NULL because:

- Optional fields may be stored as NULL.
- Mandatory fields should not allow NULL.
- Reports may show wrong count if NULL is not handled.
- API response and database value may differ for blank fields.
- NULL comparison mistakes can cause query bugs.

## IS NULL

Use `IS NULL` to find missing values.

```sql
SELECT UserId, UserName, MobileNumber
FROM Users
WHERE MobileNumber IS NULL;
```

## IS NOT NULL

Use `IS NOT NULL` to find available values.

```sql
SELECT UserId, UserName, MobileNumber
FROM Users
WHERE MobileNumber IS NOT NULL;
```

## Wrong Way

Do not use:

```sql
SELECT *
FROM Users
WHERE MobileNumber = NULL;
```

This is wrong because NULL cannot be compared using `=`.

## COALESCE

`COALESCE()` returns the first non-NULL value.

```sql
SELECT UserName,
       COALESCE(MobileNumber, 'Not Available') AS Mobile
FROM Users;
```

## ISNULL

In SQL Server, `ISNULL()` replaces NULL with another value.

```sql
SELECT UserName,
       ISNULL(MobileNumber, 'Not Available') AS Mobile
FROM Users;
```

## NULLIF

`NULLIF()` returns NULL if two values are equal.

```sql
SELECT NULLIF(Status, 'NA') AS FinalStatus
FROM Orders;
```

## NULL In Aggregate Functions

Most aggregate functions ignore NULL values.

Example:

```sql
SELECT COUNT(MobileNumber) AS UsersWithMobile
FROM Users;
```

This counts only rows where `MobileNumber` is not NULL.

```sql
SELECT COUNT(*) AS TotalUsers
FROM Users;
```

This counts all rows.

## COUNT(*) vs COUNT(Column)

| Query | Meaning |
| ----- | ------- |
| `COUNT(*)` | Counts all rows |
| `COUNT(ColumnName)` | Counts only non-NULL values in that column |

## Real Project Example

If mobile number is optional during registration:

- Database can store `MobileNumber` as NULL.
- UI should not show error for optional field.
- API should handle missing mobile number correctly.

Validation query:

```sql
SELECT UserId, Email, MobileNumber
FROM Users
WHERE Email = 'testuser@test.com';
```

## Common Interview Questions

1. What is NULL?
2. Difference between NULL and blank value?
3. Why do we use `IS NULL` instead of `= NULL`?
4. What is `COALESCE`?
5. Difference between `COUNT(*)` and `COUNT(column)`?
6. How do testers validate NULL fields?

## Interview Answer

NULL means missing or unknown value. It is different from zero and empty string. We should use `IS NULL` or `IS NOT NULL` to check NULL values because normal comparison operators do not work with NULL. As a tester, I verify whether optional fields allow NULL and mandatory fields do not store NULL.

## Quick Revision

- NULL means missing value.
- Use `IS NULL`, not `= NULL`.
- `COALESCE` replaces NULL with first available value.
- `COUNT(*)` counts all rows.
- `COUNT(column)` ignores NULL values.
