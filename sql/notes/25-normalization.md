# Normalization

## Simple Explanation

Normalization is the process of organizing database tables to reduce duplicate data and improve data consistency.

It helps store data in a clean and structured way.

## Why Normalization Is Important For Testers

Testers should understand normalization because:

- Duplicate data can cause inconsistent results.
- Wrong table design can create update issues.
- Data integrity defects may happen due to poor relationships.
- Testers can better understand how data is split across tables.

## Example Problem Without Normalization

| OrderId | CustomerName | CustomerEmail | ProductName |
| ------- | ------------ | ------------- | ----------- |
| 1 | Rahul | rahul@test.com | Laptop |
| 2 | Rahul | rahul@test.com | Mouse |

Customer details are repeated.

If email changes, it must be updated in multiple rows. This can cause inconsistency.

Better design:

- `Customers` table stores customer details.
- `Orders` table stores order details.
- `Products` table stores product details.

## 1NF - First Normal Form

Rules:

- Each column should have atomic value.
- No repeating groups.

Bad example:

| UserId | PhoneNumbers |
| ------ | ------------ |
| 1 | 99999, 88888 |

Good example:

| UserId | PhoneNumber |
| ------ | ----------- |
| 1 | 99999 |
| 1 | 88888 |

## 2NF - Second Normal Form

Rules:

- Table should be in 1NF.
- No partial dependency on part of a composite key.

Simple meaning:

If table has composite key, non-key columns should depend on the full key, not only part of it.

## 3NF - Third Normal Form

Rules:

- Table should be in 2NF.
- No transitive dependency.

Simple meaning:

Non-key columns should not depend on other non-key columns.

Example:

If `City` decides `State`, then store city-state relation separately instead of repeating state everywhere.

## BCNF

BCNF means `Boyce-Codd Normal Form`.

It is a stricter version of 3NF.

Usually interviewers ask basic awareness only unless it is a database-heavy role.

## Denormalization

Denormalization means intentionally adding duplicate data to improve read performance.

Example:

In reporting tables, customer name may be stored with order details to avoid many joins.

## Normalization vs Denormalization

| Point | Normalization | Denormalization |
| ----- | ------------- | --------------- |
| Goal | Reduce duplicate data | Improve read performance |
| Data Integrity | Better | More risk of duplication |
| Query Speed | May need joins | Faster reads in some cases |
| Common Use | Transaction systems | Reports, dashboards |

## Real Project Example

In an e-commerce application:

- `Users` table stores user details.
- `Orders` table stores order summary.
- `OrderItems` table stores products in order.
- `Products` table stores product details.

This avoids repeating all user and product details in every order row.

## Common Interview Questions

1. What is normalization?
2. Why do we use normalization?
3. Explain 1NF, 2NF, and 3NF.
4. What is denormalization?
5. Difference between normalization and denormalization?
6. Why should testers understand normalization?

## Interview Answer

Normalization is the process of organizing database tables to reduce duplicate data and maintain data consistency. 1NF removes repeating groups, 2NF removes partial dependency, and 3NF removes transitive dependency. As a tester, normalization helps me understand table relationships and identify data consistency issues.

## Quick Revision

- Normalization reduces duplicate data.
- 1NF means atomic values.
- 2NF removes partial dependency.
- 3NF removes transitive dependency.
- Denormalization improves read performance by adding some redundancy.
