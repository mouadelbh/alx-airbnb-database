# Database Normalization for Airbnb Module

## Objective

Apply normalization principles to ensure the database design complies with Third Normal Form (3NF), minimizing redundancy and improving data integrity.

---

## Review of the Schema

The main entities are:

- User
- Property
- Booking
- Payment
- Review
- Message

Each entity has a primary key, appropriate attributes, and foreign key references that define relationships.

---

## Step 1: First Normal Form (1NF)

**Requirements of 1NF:**

- Each table cell must contain atomic (indivisible) values.
- Each record must be unique (primary key defined).
- No repeating groups or arrays.

**Review:**

- All attributes contain atomic values (e.g., no lists or arrays).
- Each table has a primary key defined (UUID).
- No multi-valued attributes or repeating groups are present.

**Conclusion:**  
Schema is in **1NF**.

---

## Step 2: Second Normal Form (2NF)

**Requirements of 2NF:**

- Be in 1NF.
- Every non-key attribute is fully functionally dependent on the entire primary key.
- For tables with a composite primary key, no partial dependencies allowed.

**Review:**

- All tables use single-attribute primary keys (UUIDs).
- No composite keys exist, so partial dependencies are not possible.
- Each non-key attribute depends fully on the primary key.

**Conclusion:**  
Schema is in **2NF**.

---

## Step 3: Third Normal Form (3NF)

**Requirements of 3NF:**

- Be in 2NF.
- No transitive dependencies exist (i.e., no non-key attribute depends on another non-key attribute).

**Review:**

- Attributes such as `pricepernight` belong directly to Property.
- Attributes like `status` belong directly to Booking.
- No attribute depends on other non-key attributes.
- Foreign keys correctly reference primary keys of other tables.
- No redundant storage of calculated or derived data.

**Conclusion:**  
Schema satisfies **3NF**.

---

## Summary of Normalization

| Normal Form | Status  | Explanation                              |
|-------------|---------|----------------------------------------|
| 1NF         | Achieved| Atomic attributes, unique rows          |
| 2NF         | Achieved| No partial dependencies with single PK |
| 3NF         | Achieved| No transitive dependencies              |

---

## Additional Notes

- Enum constraints (e.g., roles, statuses) ensure data integrity.
- Foreign key constraints maintain referential integrity.
- Indexes on foreign keys optimize query performance without denormalizing.
- The design prevents data anomalies (insertion, update, deletion).

---

# End of Normalization Report
