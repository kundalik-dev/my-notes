# Date and Time Functions

## Simple Explanation

Date and time functions are used to work with date values in SQL.

Testers use date queries to validate created date, modified date, order date, expiry date, and report filters.

## Common Date Functions

| Purpose | SQL Server | MySQL | Oracle |
| ------- | ---------- | ----- | ------ |
| Current date and time | `GETDATE()` | `NOW()` | `SYSDATE` |
| Add date value | `DATEADD()` | `DATE_ADD()` | `ADD_MONTHS()` |
| Date difference | `DATEDIFF()` | `DATEDIFF()` | Date subtraction |
| Extract year | `YEAR()` | `YEAR()` | `EXTRACT(YEAR FROM date)` |
| Extract month | `MONTH()` | `MONTH()` | `EXTRACT(MONTH FROM date)` |

## Current Date and Time

```sql
SELECT GETDATE() AS CurrentDateTime;
```

Used to check current database server date and time.

## Filter Records By Date

```sql
SELECT *
FROM Orders
WHERE CreatedDate >= '2026-01-01';
```

## DATEADD

Add days, months, or years to a date.

```sql
SELECT DATEADD(day, 7, GETDATE()) AS AfterSevenDays;
```

## DATEDIFF

Find difference between two dates.

```sql
SELECT DATEDIFF(day, OrderDate, DeliveryDate) AS DeliveryDays
FROM Orders;
```

### Tester Use

Validate whether delivery date is calculated correctly.

## DAY, MONTH, YEAR

```sql
SELECT OrderId, DAY(OrderDate) AS OrderDay,
       MONTH(OrderDate) AS OrderMonth,
       YEAR(OrderDate) AS OrderYear
FROM Orders;
```

## CAST and CONVERT

Used to convert data types.

```sql
SELECT CAST(CreatedDate AS DATE) AS OnlyDate
FROM Orders;
```

## EOMONTH

Returns last day of the month.

```sql
SELECT EOMONTH(GETDATE()) AS MonthEndDate;
```

## Tester Interview Points

- Date format may differ between application and database.
- Timezone issues can happen between UI, API, and DB.
- Created date should usually be inserted when record is created.
- Modified date should change when record is updated.
- Date filters in reports should include correct start and end dates.

## Real Project Example

Validate orders created today:

```sql
SELECT OrderId, CreatedDate, Status
FROM Orders
WHERE CAST(CreatedDate AS DATE) = CAST(GETDATE() AS DATE);
```

Validate expired coupons:

```sql
SELECT CouponCode, ExpiryDate
FROM Coupons
WHERE ExpiryDate < GETDATE();
```

## Common Interview Questions

1. How do you get current date in SQL?
2. How do you filter records by date?
3. What is `DATEDIFF`?
4. What is `DATEADD`?
5. How do testers validate date fields?
6. What date issues can happen in real projects?

## Interview Answer

Date and time functions are used to compare, calculate, format, and extract date values. In testing, I use date functions to validate created date, modified date, order date, expiry date, report filters, and date calculations. I also check date format and timezone-related issues when UI, API, and database values are different.

## Quick Revision

- `GETDATE`, `NOW`, `SYSDATE` return current date and time.
- `DATEADD` adds date value.
- `DATEDIFF` finds difference.
- `DAY`, `MONTH`, `YEAR` extract date parts.
- Testers should check date format and timezone issues.
