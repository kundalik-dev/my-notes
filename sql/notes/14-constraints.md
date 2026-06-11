# Constraints

## Simple Explanation

Constraints are rules applied to table columns to maintain valid and correct data.

They protect database data from invalid entries.

## Why Constraints Are Important For Testers

Testers should know constraints because many negative test cases are related to database rules:

- Duplicate email should not be allowed.
- Mandatory fields should not be blank.
- Invalid age should be rejected.
- Order should not exist without valid customer.
- Default status should be added automatically.

## Common Constraints

| Constraint | Purpose | Example |
| ---------- | ------- | ------- |
| `PRIMARY KEY` | Uniquely identifies each row | `UserId` |
| `FOREIGN KEY` | Links one table to another table | `Orders.UserId` to `Users.UserId` |
| `UNIQUE` | Does not allow duplicate values | Email |
| `NOT NULL` | Does not allow missing value | UserName |
| `DEFAULT` | Adds default value | Status = Active |
| `CHECK` | Validates condition | Age >= 18 |

## PRIMARY KEY

A primary key uniquely identifies each row.

```sql
CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    UserName VARCHAR(100)
);
```

### Interview Point

Primary key cannot have duplicate values and cannot have NULL values.

## FOREIGN KEY

A foreign key creates a relationship between two tables.

```sql
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
```

### Tester Point

Tester can verify that an order cannot be created for an invalid user id.

## UNIQUE

Unique constraint prevents duplicate values.

```sql
CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    Email VARCHAR(150) UNIQUE
);
```

### Tester Point

Try registering two users with the same email and verify that duplicate email is not allowed.

## NOT NULL

`NOT NULL` means the column must have a value.

```sql
CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL
);
```

### Tester Point

Validate mandatory fields from UI/API and database.

## DEFAULT

Default value is inserted automatically if no value is provided.

```sql
CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    Status VARCHAR(20) DEFAULT 'Active'
);
```

## CHECK

Check constraint validates a condition.

```sql
CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    Age INT CHECK (Age >= 18)
);
```

## PRIMARY KEY vs UNIQUE KEY

| Point | Primary Key | Unique Key |
| ----- | ----------- | ---------- |
| Purpose | Main identifier of row | Prevent duplicate values |
| NULL Allowed | No | Usually one NULL may be allowed, depends on DB |
| Count Per Table | Usually one primary key | Multiple unique keys allowed |
| Example | `UserId` | `Email`, `MobileNumber` |

## Composite Primary Key

A composite primary key uses more than one column.

Example: one student can enroll in many courses, but same student-course combination should be unique.

```sql
CREATE TABLE StudentCourses (
    StudentId INT,
    CourseId INT,
    PRIMARY KEY (StudentId, CourseId)
);
```

## Real Project Example

For registration testing:

- `UserId` should be primary key.
- `Email` should be unique.
- `UserName` should be not null.
- `Status` may have default value `Active`.
- `Age` may have check condition if minimum age is required.

## Common Interview Questions

1. What are constraints?
2. Difference between primary key and unique key?
3. What is foreign key?
4. What is NOT NULL?
5. What is default constraint?
6. What is check constraint?
7. What is composite primary key?

## Interview Answer

Constraints are database rules used to maintain data accuracy and integrity. Common constraints are primary key, foreign key, unique, not null, default, and check. As a tester, I validate constraints by testing duplicate data, missing mandatory values, invalid relationships, and wrong input values.

## Quick Revision

- Constraints protect data quality.
- Primary key is unique and not null.
- Foreign key maintains relationship.
- Unique prevents duplicates.
- Not null makes field mandatory.
- Check validates condition.
