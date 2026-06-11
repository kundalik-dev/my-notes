# SQL Difference Tables

## Simple Explanation

Interviewers commonly ask difference questions in SQL.

As a tester, these differences help explain database concepts clearly and avoid confusion during SQL validation.

## RDBMS vs NoSQL

| Point | RDBMS | NoSQL |
| ----- | ----- | ----- |
| Full Form | Relational Database Management System | Not Only SQL |
| Data Storage | Stores data in tables | Stores data as documents, key-value, columns, or graphs |
| Structure | Fixed schema | Flexible schema |
| Query Language | SQL | Depends on database |
| Relationship | Supports table relationships using keys | Relationships are handled differently |
| Examples | SQL Server, MySQL, Oracle, PostgreSQL | MongoDB, Cassandra, Redis |
| Best For | Structured data and transactions | Large-scale flexible or unstructured data |

### Interview Answer

RDBMS stores data in tables with rows and columns and uses SQL for querying. NoSQL databases store data in flexible formats like documents or key-value pairs. In testing, most SQL validation is done with RDBMS databases like SQL Server, MySQL, or Oracle.

## DELETE vs TRUNCATE

| Point | DELETE | TRUNCATE |
| ----- | ------ | -------- |
| Command Type | DML | DDL |
| Purpose | Deletes selected rows | Deletes all rows |
| WHERE Clause | Allowed | Not allowed |
| Rollback | Possible before commit | Usually not possible |
| Speed | Slower for large data | Faster |
| Table Structure | Remains | Remains |
| Identity Reset | Usually does not reset | May reset identity, depends on DB |
| Trigger | Delete trigger may fire | Usually trigger does not fire, depends on DB |

### Example

```sql
DELETE FROM Users
WHERE UserId = 101;
```

```sql
TRUNCATE TABLE Users;
```

### Interview Answer

`DELETE` is a DML command used to remove selected rows and can use a `WHERE` clause. `TRUNCATE` is a DDL command used to remove all rows from a table quickly. `DELETE` can usually be rolled back before commit, but `TRUNCATE` is usually auto-committed.

## DROP vs DELETE vs TRUNCATE

| Point | DROP | DELETE | TRUNCATE |
| ----- | ---- | ------ | -------- |
| Command Type | DDL | DML | DDL |
| Removes Data | Yes | Yes | Yes |
| Removes Table Structure | Yes | No | No |
| WHERE Clause | No | Yes | No |
| Rollback | Usually not possible | Possible before commit | Usually not possible |
| Use Case | Remove table completely | Delete selected records | Remove all records quickly |

## WHERE vs HAVING

| Point | WHERE | HAVING |
| ----- | ----- | ------ |
| Used For | Filter rows | Filter grouped records |
| Used With Aggregate | No, generally | Yes |
| Execution | Before `GROUP BY` | After `GROUP BY` |
| Example | `WHERE Status = 'Active'` | `HAVING COUNT(*) > 1` |

## PRIMARY KEY vs UNIQUE KEY

| Point | Primary Key | Unique Key |
| ----- | ----------- | ---------- |
| Purpose | Main unique identifier | Prevent duplicate values |
| NULL Allowed | No | Usually one NULL may be allowed, depends on DB |
| Count Per Table | Usually one | Multiple allowed |
| Example | `UserId` | `Email` |

## INNER JOIN vs LEFT JOIN

| Point | INNER JOIN | LEFT JOIN |
| ----- | ---------- | --------- |
| Returns | Only matching records | All left table records and matching right records |
| Missing Match | Not shown | Shown with NULL from right table |
| Tester Use | Validate matched related data | Find missing related records |

## UNION vs UNION ALL

| Point | UNION | UNION ALL |
| ----- | ----- | --------- |
| Duplicates | Removes duplicates | Keeps duplicates |
| Performance | Slower | Faster |
| Use Case | Need unique result | Need full combined result |

## Quick Revision

- RDBMS uses tables and SQL.
- NoSQL has flexible data storage.
- `DELETE` can use `WHERE`.
- `TRUNCATE` removes all rows.
- `DROP` removes table structure.
- `WHERE` filters rows.
- `HAVING` filters grouped result.
- `INNER JOIN` shows matching records.
- `LEFT JOIN` can show missing related records.
