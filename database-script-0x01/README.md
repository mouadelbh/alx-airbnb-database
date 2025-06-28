# Database Schema Definition – ALX Airbnb Clone Project

## 📌 Directory: `database-script-0x01/`
This directory contains the SQL scripts used to define the relational database schema for the Airbnb clone project as part of the ALX Database Module.

---

## 🎯 Objective
Design and implement a robust, normalized relational schema that supports the core functionality of an Airbnb-like platform, including user management, property listings, bookings, reviews, payments, and messaging.

---

## 📂 Files

| File Name   | Description                                      |
|-------------|--------------------------------------------------|
| `schema.sql`| SQL script that creates all tables, sets primary and foreign keys, and enforces constraints. |
| `README.md` | Explanation of the schema design, constraints, and indexing. |

---

## 🗃️ Entities and Relationships

The database consists of the following main entities:

1. **Users**
   - Stores guest, host, and admin account details.
2. **Properties**
   - Stores listings created by users with the role `host`.
3. **Bookings**
   - Stores reservation data linking guests and properties.
4. **Payments**
   - Tracks payments made for confirmed bookings.
5. **Reviews**
   - Stores user feedback and ratings on properties.
6. **Messages**
   - Facilitates communication between users.

---

## 🔧 Schema Design Highlights

- **Normalization**: Schema is fully normalized to **Third Normal Form (3NF)**.
- **Data Integrity**:
  - Primary keys ensure uniqueness.
  - Foreign keys maintain valid relationships.
  - ENUMs restrict values for roles, statuses, and payment methods.
- **Timestamps**: Tables use `created_at` and `updated_at` to track records.
- **Indexing**:
  - Primary keys are automatically indexed.
  - Additional indexes are created where necessary (e.g., `email`, `property_id`, `booking_id`).

---

## 📜 Execution Instructions

To execute the schema file in a PostgreSQL or SQLite environment:

```bash
sqlite3 airbnb_clone.db < schema.sql
