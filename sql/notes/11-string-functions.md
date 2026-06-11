# String Functions

## Simple Explanation

String functions are used to work with text data in SQL.

Testers use string functions to validate names, emails, spaces, prefixes, suffixes, and formatted values.

## Common String Functions

| Function | Used For | Example |
| -------- | -------- | ------- |
| `LEN()` / `LENGTH()` | Find string length | Length of mobile number |
| `UPPER()` | Convert to uppercase | `RAHUL` |
| `LOWER()` | Convert to lowercase | `rahul` |
| `TRIM()` | Remove leading and trailing spaces | Clean input |
| `SUBSTRING()` / `SUBSTR()` | Extract part of text | Get first 3 letters |
| `LEFT()` | Get left side characters | First 5 characters |
| `RIGHT()` | Get right side characters | Last 4 digits |
| `REPLACE()` | Replace text | Replace old domain |
| `CONCAT()` | Join strings | First name + last name |
| `CHARINDEX()` / `INSTR()` | Find character position | Position of `@` in email |

## LEN or LENGTH

```sql
SELECT UserName, LEN(MobileNumber) AS MobileLength
FROM Users;
```

### Tester Use

Validate whether mobile number length is correct.

## UPPER and LOWER

```sql
SELECT UPPER(UserName) AS NameInCaps
FROM Users;
```

```sql
SELECT LOWER(Email) AS EmailLowerCase
FROM Users;
```

### Tester Use

Useful when comparing data without case sensitivity.

## TRIM

```sql
SELECT TRIM(UserName) AS CleanName
FROM Users;
```

### Tester Use

Useful to check whether application removes extra spaces from input fields.

## SUBSTRING

```sql
SELECT SUBSTRING(MobileNumber, 1, 3) AS FirstThreeDigits
FROM Users;
```

## LEFT and RIGHT

```sql
SELECT RIGHT(CardNumber, 4) AS LastFourDigits
FROM Payments;
```

### Tester Use

Useful for payment masking validation, like showing only last 4 digits.

## CHARINDEX or INSTR

Find position of a character.

```sql
SELECT CHARINDEX('@', Email) AS AtSymbolPosition
FROM Users;
```

## REPLACE

```sql
SELECT REPLACE(Email, 'old.com', 'new.com') AS UpdatedEmail
FROM Users;
```

## CONCAT

```sql
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Users;
```

## SQL Server vs MySQL Function Names

| Purpose | SQL Server | MySQL |
| ------- | ---------- | ----- |
| String length | `LEN()` | `LENGTH()` |
| Find position | `CHARINDEX()` | `INSTR()` |
| Extract string | `SUBSTRING()` | `SUBSTRING()` |
| Join strings | `CONCAT()` | `CONCAT()` |

## Real Project Example

Check invalid email records where `@` is missing:

```sql
SELECT UserId, Email
FROM Users
WHERE Email NOT LIKE '%@%';
```

Check mobile numbers not equal to 10 digits:

```sql
SELECT UserId, MobileNumber
FROM Users
WHERE LEN(MobileNumber) <> 10;
```

## Common Interview Questions

1. What are string functions?
2. Difference between `LEN` and `LENGTH`?
3. What is the use of `TRIM`?
4. How do you combine first name and last name?
5. How do you find invalid email records?

## Interview Answer

String functions are used to manipulate text values in SQL. Common examples are `LEN`, `UPPER`, `LOWER`, `TRIM`, `SUBSTRING`, `REPLACE`, and `CONCAT`. As a tester, I use string functions to validate text data, check email format, remove spaces, compare values, and verify masked or formatted fields.

## Quick Revision

- `TRIM` removes spaces.
- `UPPER` and `LOWER` change case.
- `SUBSTRING` extracts text.
- `CONCAT` joins text.
- Function names may differ by database.
