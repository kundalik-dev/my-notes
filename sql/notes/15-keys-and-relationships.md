# Keys and Relationships

## Simple Explanation

Keys identify records in tables.

Relationships connect data between tables.

In interviews, keys and relationships are important because they explain how database tables are connected.

## Types of Keys

| Key Type | Meaning | Example |
| -------- | ------- | ------- |
| Primary Key | Uniquely identifies each row | `UserId` |
| Foreign Key | Refers to primary key of another table | `Orders.UserId` |
| Candidate Key | Column that can become primary key | Email, Aadhaar number |
| Composite Key | Key made from multiple columns | `StudentId + CourseId` |
| Surrogate Key | Artificial/system-generated key | Auto-generated `UserId` |
| Natural Key | Real-world meaningful key | Email, PAN number |

## Primary Key

Primary key uniquely identifies each record.

Example:

```sql
CREATE TABLE Users (
    UserId INT PRIMARY KEY,
    Email VARCHAR(150)
);
```

Important points:

- It must be unique.
- It cannot be NULL.
- It is used to identify one specific row.

## Foreign Key

Foreign key links one table to another table.

```sql
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
```

### Tester Point

If `UserId = 999` does not exist in `Users`, order creation should fail if foreign key is enforced.

## Candidate Key

A candidate key is a column or group of columns that can uniquely identify a row.

Example:

- `UserId`
- `Email`
- `MobileNumber`

Any one of these may be selected as primary key depending on design.

## Composite Key

Composite key uses more than one column.

```sql
CREATE TABLE OrderItems (
    OrderId INT,
    ProductId INT,
    PRIMARY KEY (OrderId, ProductId)
);
```

This prevents the same product from being repeated for the same order, depending on business rule.

## Surrogate Key vs Natural Key

| Point | Surrogate Key | Natural Key |
| ----- | ------------- | ----------- |
| Meaning | Artificial generated key | Real business value |
| Example | `UserId = 101` | `Email = test@test.com` |
| Can Change | Usually does not change | May change |
| Preferred For PK | Commonly yes | Sometimes |

## Types of Relationships

| Relationship | Meaning | Example |
| ------------ | ------- | ------- |
| One-to-One | One record relates to one record | User and UserProfile |
| One-to-Many | One record relates to many records | User and Orders |
| Many-to-Many | Many records relate to many records | Students and Courses |

## One-to-One Relationship

One user has one profile.

```text
Users.UserId -> UserProfiles.UserId
```

## One-to-Many Relationship

One user can place many orders.

```text
Users.UserId -> Orders.UserId
```

This is very common in real projects.

## Many-to-Many Relationship

Many students can enroll in many courses.

This is handled using a junction table.

```text
Students -> StudentCourses -> Courses
```

## Real Project Example

In an e-commerce application:

- `Users` table has customer details.
- `Orders` table has order details.
- `OrderItems` table has products inside each order.
- `Payments` table has payment details.

Tester may join these tables using keys to validate complete order flow.

## Common Interview Questions

1. What is a primary key?
2. What is a foreign key?
3. Difference between primary key and foreign key?
4. What is composite key?
5. What is candidate key?
6. Difference between surrogate key and natural key?
7. Explain one-to-many relationship with example.

## Interview Answer

Keys are used to identify records and relationships are used to connect tables. A primary key uniquely identifies each row, and a foreign key links one table to another table. In testing, I use key relationships to validate data integrity, such as checking whether every order is linked to a valid user.

## Quick Revision

- Primary key identifies a row.
- Foreign key links tables.
- Candidate key can become primary key.
- Composite key uses multiple columns.
- One user can have many orders is one-to-many.
- Many-to-many needs a junction table.
