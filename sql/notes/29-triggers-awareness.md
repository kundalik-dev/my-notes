# Triggers - Awareness Level

## Simple Explanation

A trigger is a database object that automatically executes when a specific event happens on a table.

Events can be:

- `INSERT`
- `UPDATE`
- `DELETE`

## Why Testers Should Know Triggers

Testers should have awareness of triggers because application action may cause extra database changes automatically.

Examples:

- Insert audit log after update.
- Update modified date automatically.
- Prevent invalid data changes.
- Maintain history table.
- Update inventory after order placement.

## Types of Triggers

| Trigger Type | Meaning |
| ------------ | ------- |
| BEFORE Trigger | Runs before insert/update/delete |
| AFTER Trigger | Runs after insert/update/delete |
| INSERT Trigger | Runs when new row is inserted |
| UPDATE Trigger | Runs when row is updated |
| DELETE Trigger | Runs when row is deleted |

## Simple Example Concept

When order status is updated:

```text
UPDATE Orders SET Status = 'Shipped'
```

Trigger may automatically insert record into:

```text
OrderAudit
```

## Tester Validation Points

When triggers are involved, verify:

- Main table data is updated.
- Audit/history table has correct entry.
- Trigger does not create duplicate entries.
- Trigger handles failure scenarios.
- Trigger does not slow down application too much.

## Trigger Use Cases In Testing

| Use Case | What To Verify |
| -------- | -------------- |
| Audit Log | Entry created after update |
| Modified Date | Date updated automatically |
| History Table | Old value stored correctly |
| Inventory Update | Stock reduced after order |
| Validation | Invalid operation blocked |

## Real Project Example

If a user updates profile email:

- `Users` table should show new email.
- `UserAudit` table should store old email, new email, updated date, and updated by user.

Validation query:

```sql
SELECT *
FROM UserAudit
WHERE UserId = 101
ORDER BY UpdatedDate DESC;
```

## Common Interview Questions

1. What is a trigger?
2. When does a trigger execute?
3. Difference between BEFORE and AFTER trigger?
4. What are common trigger use cases?
5. How do testers validate trigger behavior?

## Interview Answer

A trigger is an automatic database action that executes when an insert, update, or delete happens on a table. It is commonly used for audit logs, history tables, automatic date updates, and validations. As a tester, I verify both the main table change and the trigger side effects, like audit table entries.

## Quick Revision

- Trigger runs automatically.
- Trigger is event-based.
- Common events are insert, update, delete.
- Testers should validate trigger side effects.
- Audit logging is a common trigger use case.
