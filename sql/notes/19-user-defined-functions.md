# User-Defined Functions

## Simple Explanation

A user-defined function is a reusable SQL object created by the user.

It accepts input, performs logic, and returns a value or table.

## Why Functions Are Important For Testers

Functions may be used in:

- Reports.
- Calculated fields.
- Discount calculation.
- Tax calculation.
- Age calculation.
- Data formatting.

If function logic is wrong, application or report output can be wrong.

## Types of User-Defined Functions

| Function Type | Returns | Example |
| ------------- | ------- | ------- |
| Scalar Function | Single value | Full name, age, discount amount |
| Table-Valued Function | Table/result set | Active users, order summary |

## Scalar Function

Returns a single value.

Example:

```sql
CREATE FUNCTION GetFullName
(
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50)
)
RETURNS VARCHAR(101)
AS
BEGIN
    RETURN @FirstName + ' ' + @LastName;
END;
```

Use function:

```sql
SELECT dbo.GetFullName(FirstName, LastName) AS FullName
FROM Users;
```

## Table-Valued Function

Returns a table.

Example concept:

```sql
SELECT *
FROM dbo.GetActiveUsers();
```

## Function Inside SELECT

Functions are commonly used in `SELECT` queries.

```sql
SELECT OrderId,
       OrderAmount,
       dbo.CalculateDiscount(OrderAmount) AS Discount
FROM Orders;
```

## Function vs Stored Procedure

| Point | Function | Stored Procedure |
| ----- | -------- | ---------------- |
| Return | Must return value/table | May or may not return value |
| Use In SELECT | Yes | Usually no |
| Data Modification | Usually not used for DML | Can insert/update/delete |
| Purpose | Calculation or reusable value | Business operation |
| Example | Calculate age | Create order |

## Tester Validation Points

When testing functions:

- Check valid input.
- Check NULL input.
- Check boundary values.
- Compare calculated output with expected result.
- Verify report values using manual calculation.

## Real Project Example

If application shows discount amount, function may calculate discount:

```sql
SELECT OrderId, OrderAmount, dbo.CalculateDiscount(OrderAmount) AS Discount
FROM Orders
WHERE OrderId = 1001;
```

Tester should calculate expected discount manually and compare it with function output.

## Common Interview Questions

1. What is a user-defined function?
2. What is scalar function?
3. What is table-valued function?
4. Difference between function and stored procedure?
5. Can function be used in `SELECT`?
6. How do testers validate functions?

## Interview Answer

A user-defined function is a reusable database object that returns a value or table. Scalar functions return one value, and table-valued functions return rows. Functions are commonly used in `SELECT` queries for calculations or formatting. As a tester, I validate function output using valid, invalid, NULL, and boundary data.

## Quick Revision

- Function returns value.
- Scalar function returns one value.
- Table-valued function returns table.
- Function can be used in `SELECT`.
- Stored procedure can perform actions; function is mainly for return value.
