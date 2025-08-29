# Database Entities and Relationships

This document describes the main entities in the system, their attributes, and the relationships between them.

---

## **Entities and Attributes**

### **1. User**
Represents a system user who can be a guest, host, or admin.

| Attribute       | Type      | Constraints                                  |
|-----------------|-----------|---------------------------------------------|
| user_id         | UUID      | Primary Key, Indexed                         |
| first_name      | VARCHAR   | NOT NULL                                     |
| last_name       | VARCHAR   | NOT NULL                                     |
| email           | VARCHAR   | UNIQUE, NOT NULL                             |
| password_hash   | VARCHAR   | NOT NULL                                     |
| phone_number    | VARCHAR   | NULL                                         |
| role            | ENUM      | Values: guest, host, admin; NOT NULL        |
| created_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                    |

---

### **2. Property**
Represents a property listed by a host for booking.

| Attribute       | Type      | Constraints                                  |
|-----------------|-----------|---------------------------------------------|
| property_id     | UUID      | Primary Key, Indexed                         |
| host_id         | UUID      | Foreign Key → User(user_id)                  |
| name            | VARCHAR   | NOT NULL                                     |
| description     | TEXT      | NOT NULL                                     |
| location        | VARCHAR   | NOT NULL                                     |
| pricepernight   | DECIMAL   | NOT NULL                                     |
| created_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                    |
| updated_at      | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP                  |

---

### **3. Booking**
Represents a reservation made by a user for a property.

| Attribute       | Type      | Constraints                                  |
|-----------------|-----------|---------------------------------------------|
| booking_id      | UUID      | Primary Key, Indexed                         |
| property_id     | UUID      | Foreign Key → Property(property_id)         |
| user_id         | UUID      | Foreign Key → User(user_id)                 |
| start_date      | DATE      | NOT NULL                                     |
| end_date        | DATE      | NOT NULL                                     |
| total_price     | DECIMAL   | NOT NULL                                     |
| status          | ENUM      | Values: pending, confirmed, canceled; NOT NULL |
| created_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                    |

---

### **4. Payment**
Represents a payment made for a booking.

| Attribute       | Type      | Constraints                                  |
|-----------------|-----------|---------------------------------------------|
| payment_id      | UUID      | Primary Key, Indexed                         |
| booking_id      | UUID      | Foreign Key → Booking(booking_id)           |
| amount          | DECIMAL   | NOT NULL                                     |
| payment_date    | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                    |
| payment_method  | ENUM      | Values: credit_card, paypal, stripe; NOT NULL |

---

### **5. Review**
Represents a user review of a property.

| Attribute       | Type      | Constraints                                  |
|-----------------|-----------|---------------------------------------------|
| review_id       | UUID      | Primary Key, Indexed                         |
| property_id     | UUID      | Foreign Key → Property(property_id)         |
| user_id         | UUID      | Foreign Key → User(user_id)                 |
| rating          | INTEGER   | CHECK: rating >=1 AND <=5; NOT NULL         |
| comment         | TEXT      | NOT NULL                                     |
| created_at      | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                    |

---

### **6. Message**
Represents a message sent between users.

| Attribute       | Type      | Constraints                                  |
|-----------------|-----------|---------------------------------------------|
| message_id      | UUID      | Primary Key, Indexed                         |
| sender_id       | UUID      | Foreign Key → User(user_id)                 |
| recipient_id    | UUID      | Foreign Key → User(user_id)                 |
| message_body    | TEXT      | NOT NULL                                     |
| sent_at         | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                    |

---

## **Relationships Between Entities**

1. **User → Booking**
   - One `User` can have many `Bookings`.
   - A `Booking` belongs to one `User`.

2. **Property → Booking**
   - One `Property` can have many `Bookings`.
   - A `Booking` is linked to one `Property`.

3. **Booking → Payment**
   - One `Booking` can have one or more `Payments`.
   - A `Payment` is linked to one `Booking`.

4. **User → Review**
   - One `User` can write many `Reviews`.
   - A `Review` is written by one `User`.

5. **Property → Review**
   - One `Property` can have many `Reviews`.
   - A `Review` is linked to one `Property`.

6. **User → Message**
   - One `User` can send many messages.
   - One `User` can receive many messages.
   - A `Message` has a `sender` and a `recipient` (both referencing `User`).

---

