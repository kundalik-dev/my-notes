# Transactions and TCL

## Simple Explanation

A transaction is a group of database operations treated as one unit.

Either all operations should be successful, or none should be saved.

TCL means `Transaction Control Language`.

## Why Transactions Are Important For Testers

Transactions are important in real workflows like:

- Payment.
- Order creation.
- Fund transfer.
- Booking.
- Inventory update.
- Data migration.

If one step fails, related changes should rollback to avoid inconsistent data.

## TCL Commands

| Command | Meaning | Example Use |
| ------- | ------- | ----------- |
| `BEGIN TRANSACTION` | Starts transaction | Start order process |
| `COMMIT` | Saves changes permanently | Save successful payment |
| `ROLLBACK` | Undo changes | Undo failed order |
| `SAVEPOINT` | Partial rollback point | Rollback part of transaction |

## Basic Transaction Example

```sql
BEGIN TRANSACTION;

UPDATE Accounts
SET Balance = Balance - 1000
WHERE AccountId = 1;

UPDATE Accounts
SET Balance = Balance + 1000
WHERE AccountId = 2;

COMMIT;
```

If both updates are successful, changes are committed.

## Rollback Example

```sql
BEGIN TRANSACTION;

UPDATE Orders
SET Status = 'Paid'
WHERE OrderId = 101;

ROLLBACK;
```

Rollback cancels the change.

## SAVEPOINT

Savepoint creates a checkpoint inside transaction.

```sql
BEGIN TRANSACTION;

UPDATE Orders
SET Status = 'Processing'
WHERE OrderId = 101;

SAVE TRANSACTION Step1;

UPDATE Payments
SET Status = 'Failed'
WHERE OrderId = 101;

ROLLBACK TRANSACTION Step1;

COMMIT;
```

Syntax can differ by database.

## ACID Properties

| Property | Meaning | Simple Example |
| -------- | ------- | -------------- |
| Atomicity | All or nothing | Payment debit and credit both happen or both rollback |
| Consistency | Data remains valid | Order cannot be paid without payment record |
| Isolation | Transactions do not disturb each other | Two users booking same seat |
| Durability | Committed data stays saved | Data remains after system restart |

## Isolation Problems

| Problem | Meaning |
| ------- | ------- |
| Dirty Read | Reading uncommitted data from another transaction |
| Non-Repeatable Read | Same query gives different value because another transaction updated it |
| Phantom Read | New rows appear when same query runs again |

## Isolation Levels

| Isolation Level | Basic Meaning |
| --------------- | ------------- |
| Read Uncommitted | Can read uncommitted data |
| Read Committed | Reads only committed data |
| Repeatable Read | Same row value remains stable during transaction |
| Serializable | Strictest level, prevents most concurrency issues |

## Real Project Example

In payment testing:

- Order status should become `Paid`.
- Payment record should be created.
- Invoice should be generated.
- If payment fails, order should not remain incorrectly marked as `Paid`.

Tester should verify database consistency after success and failure scenarios.

## Common Interview Questions

1. What is a transaction?
2. What is `COMMIT`?
3. What is `ROLLBACK`?
4. What is ACID?
5. What is dirty read?
6. Why are transactions important in payment testing?

## Interview Answer

A transaction is a group of database operations treated as a single unit. If all operations are successful, we use `COMMIT` to save changes. If any issue occurs, we use `ROLLBACK` to undo changes. Transactions follow ACID properties: Atomicity, Consistency, Isolation, and Durability. As a tester, I verify transaction behavior in workflows like payment, order creation, and booking.

## Quick Revision

- Transaction means all or nothing.
- `COMMIT` saves changes.
- `ROLLBACK` undoes changes.
- `SAVEPOINT` allows partial rollback.
- ACID ensures reliable transactions.
