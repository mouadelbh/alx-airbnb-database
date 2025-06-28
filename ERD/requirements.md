# Airbnb Database Module - Entity-Relationship Diagram (ERD)

## Entities and Attributes

### 1. User

| Attribute      | Data Type                     | Constraints                  |
|----------------|-------------------------------|------------------------------|
| user_id        | UUID                          | Primary Key, Unique, Indexed |
| first_name     | VARCHAR                      | NOT NULL                     |
| last_name      | VARCHAR                      | NOT NULL                     |
| email          | VARCHAR                      | UNIQUE, NOT NULL             |
| password_hash  | VARCHAR                      | NOT NULL                     |
| phone_number   | VARCHAR                      | NULLABLE                     |
| role           | ENUM ('guest', 'host', 'admin') | NOT NULL                 |
| created_at     | TIMESTAMP                    | DEFAULT CURRENT_TIMESTAMP    |

---

### 2. Property

| Attribute      | Data Type                     | Constraints                        |
|----------------|-------------------------------|----------------------------------|
| property_id    | UUID                          | Primary Key, Unique, Indexed     |
| host_id        | UUID                          | Foreign Key → User(user_id), NOT NULL |
| name           | VARCHAR                      | NOT NULL                         |
| description    | TEXT                         | NOT NULL                         |
| location       | VARCHAR                      | NOT NULL                         |
| pricepernight  | DECIMAL                      | NOT NULL                         |
| created_at     | TIMESTAMP                    | DEFAULT CURRENT_TIMESTAMP        |
| updated_at     | TIMESTAMP                    | ON UPDATE CURRENT_TIMESTAMP      |

---

### 3. Booking

| Attribute      | Data Type                     | Constraints                         |
|----------------|-------------------------------|-----------------------------------|
| booking_id     | UUID                          | Primary Key, Unique, Indexed      |
| property_id    | UUID                          | Foreign Key → Property(property_id), NOT NULL |
| user_id        | UUID                          | Foreign Key → User(user_id), NOT NULL         |
| start_date     | DATE                         | NOT NULL                          |
| end_date       | DATE                         | NOT NULL                          |
| total_price    | DECIMAL                      | NOT NULL                          |
| status         | ENUM ('pending', 'confirmed', 'canceled') | NOT NULL                |
| created_at     | TIMESTAMP                    | DEFAULT CURRENT_TIMESTAMP         |

---

### 4. Payment

| Attribute      | Data Type                     | Constraints                        |
|----------------|-------------------------------|----------------------------------|
| payment_id     | UUID                          | Primary Key, Unique, Indexed     |
| booking_id     | UUID                          | Foreign Key → Booking(booking_id), NOT NULL |
| amount         | DECIMAL                      | NOT NULL                        |
| payment_date   | TIMESTAMP                    | DEFAULT CURRENT_TIMESTAMP        |
| payment_method | ENUM ('credit_card', 'paypal', 'stripe') | NOT NULL               |

---

### 5. Review

| Attribute      | Data Type                     | Constraints                         |
|----------------|-------------------------------|-----------------------------------|
| review_id      | UUID                          | Primary Key, Unique, Indexed      |
| property_id    | UUID                          | Foreign Key → Property(property_id), NOT NULL |
| user_id        | UUID                          | Foreign Key → User(user_id), NOT NULL         |
| rating         | INTEGER                      | NOT NULL, CHECK (rating BETWEEN 1 AND 5)  |
| comment        | TEXT                         | NOT NULL                         |
| created_at     | TIMESTAMP                    | DEFAULT CURRENT_TIMESTAMP         |

---

### 6. Message

| Attribute      | Data Type                     | Constraints                         |
|----------------|-------------------------------|-----------------------------------|
| message_id     | UUID                          | Primary Key, Unique, Indexed      |
| sender_id      | UUID                          | Foreign Key → User(user_id), NOT NULL       |
| recipient_id   | UUID                          | Foreign Key → User(user_id), NOT NULL       |
| message_body   | TEXT                         | NOT NULL                         |
| sent_at        | TIMESTAMP                    | DEFAULT CURRENT_TIMESTAMP         |

---

## Relationships

| Relationship              | Type          | Description                                                             |
|---------------------------|---------------|-------------------------------------------------------------------------|
| User (host) → Property    | One-to-Many   | A user with role `host` can own multiple properties.                    |
| Property → Booking        | One-to-Many   | A property can have multiple bookings from different users.             |
| User (guest) → Booking    | One-to-Many   | A user can make multiple bookings.                                      |
| Booking → Payment         | One-to-One    | Each booking has at least one associated payment.                       |
| User → Review             | One-to-Many   | A user can write multiple reviews for properties they booked or visited.|
| Property → Review         | One-to-Many   | A property can have multiple reviews by different users.                |
| User (sender) → Message   | One-to-Many   | A user can send many messages to different users.                       |
| User (recipient) → Message| One-to-Many   | A user can receive many messages from different users.                  |

---

## Cardinality and Participation Summary

- Each **Property** must have exactly one **host** (User).
- Each **Booking** is linked to exactly one **Property** and one **User** (guest).
- Each **Payment** is linked to exactly one **Booking**.
- Each **Review** is linked to one **User** and one **Property**.
- **Messages** have a sender and a recipient, both are Users.

---

## Visual Representation

![visual diagram][./image.png]

---

# End of ERD Document
