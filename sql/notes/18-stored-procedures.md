# Stored Procedures

## Simple Explanation

A stored procedure is a saved set of SQL statements stored in the database.

It can be executed whenever needed.

## Why Stored Procedures Are Important For Testers

Stored procedures are common in real projects because business logic may be written inside them.

Testers may need to validate:

- Procedure input parameters.
- Output result.
- Database changes after execution.
- Error handling.
- Business rules inside procedure.
- Whether UI/API is calling procedure correctly.

## Basic Stored Procedure Example

```sql
CREATE PROCEDURE GetUserByEmail
    @Email VARCHAR(150)
AS
BEGIN
    SELECT UserId, UserName, Email, Status
    FROM Users
    WHERE Email = @Email;
END;
```

## Execute Stored Procedure

```sql
EXEC GetUserByEmail 'testuser@test.com';
```

## Input Parameters

Input parameters pass values into procedure.

Example:

```sql
EXEC GetUserByEmail 'rahul@test.com';
```

Here email is input.

## Output Parameters

Output parameters return values from procedure.

Example concept:

```sql
CREATE PROCEDURE GetUserCount
    @TotalUsers INT OUTPUT
AS
BEGIN
    SELECT @TotalUsers = COUNT(*)
    FROM Users;
END;
```

## Stored Procedure vs Function

| Point | Stored Procedure | Function |
| ----- | ---------------- | -------- |
| Purpose | Perform action or business logic | Return value |
| Return | May return result set/output parameter | Must return value |
| Can Modify Data | Yes | Usually no or limited |
| Call From SELECT | Usually no | Yes |
| Example | Create order procedure | Calculate discount function |

## When Stored Procedures Are Used

- Insert order with multiple table updates.
- Calculate billing logic.
- Generate reports.
- Validate login or user status.
- Move data from one table to another.
- Process batch jobs.

## Tester Validation Points

When testing stored procedure, check:

- Correct output for valid input.
- Error handling for invalid input.
- NULL input behavior.
- Boundary values.
- Data inserted/updated correctly.
- Transaction rollback if failure occurs.
- Performance for large data.

## Real Project Example

Suppose procedure creates an order:

- Insert record in `Orders`.
- Insert products in `OrderItems`.
- Insert payment record in `Payments`.
- Update inventory.

Tester should verify all related tables after procedure execution.

## Common Interview Questions

1. What is a stored procedure?
2. Why do we use stored procedures?
3. Difference between stored procedure and function?
4. What are input and output parameters?
5. Can stored procedure modify data?
6. How do testers test stored procedures?

## Interview Answer

A stored procedure is a pre-written SQL program stored in the database. It can accept input parameters, perform operations, and return output or result sets. Stored procedures are used for repeated business logic and database operations. As a tester, I validate stored procedures by checking input, output, database changes, error handling, and rollback behavior.

## Quick Revision

- Stored procedure is executable SQL logic.
- It can accept parameters.
- It can modify data.
- It can return result sets.
- Testers validate result and side effects.
