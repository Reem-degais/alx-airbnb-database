# AirBnB Database Sample Data

This directory provides **SQL scripts to populate the AirBnB database schema** with sample data.  
The sample data is designed to reflect **real-world usage**, including multiple users, properties, bookings, payments, reviews, and messages.

---

## 📌 Tables and Sample Data

### 1. Users
Sample users include different roles: `guest`, `host`, and `admin`.

| user_id | first_name | last_name | email             | role  |
|---------|------------|-----------|-----------------|-------|
| 1 | Sara      | Ali   | sara@example.com | guest |
| 2 | Ahmed     | Khaled     | ahmed@example.com   | host  |
| 3 | Reem      | Ahmed    | reem@example.com | admin |

**Notes:**  
- `email` is unique.  
- Passwords are stored as hashed strings.  

---

### 2. Properties
- Properties are owned by hosts.  
- Each property includes a name, description, location, and price per night.

| property_id | host_id | name          | location      | pricepernight |
|------------|---------|---------------|---------------|---------------|
| p1    | 2 | Cozy Apartment | Jubail     | 120.00        |
| p2    | 2 | Beach House    | Dmmam  | 250.00        |

---

### 3. Bookings
- Bookings link guests to properties.  
- Includes start/end dates, total price, and status (`pending`, `confirmed`).

| booking_id | property_id | user_id | start_date | end_date   | total_price | status    |
|-----------|-------------|--------|------------|------------|-------------|----------|
| b1  | p1     | 1 | 2025-09-10 | 2025-09-15 | 600.00      | confirmed |
| b2  | p2     | 1 | 2025-10-01 | 2025-10-05 | 1000.00     | pending   |

---

### 4. Payments
- Payments are linked to bookings and include amount and payment method (`credit_card`, `paypal`, `stripe`).

| payment_id | booking_id | amount | payment_method |
|------------|------------|--------|----------------|
| pay1    | b1   | 600.00 | credit_card    |
| pay2    | b2   | 1000.00| paypal         |

---

### 5. Reviews
- Reviews are linked to properties and users.  
- Ratings are integers between 1 and 5.

| review_id | property_id | user_id | rating | comment                               |
|-----------|------------|--------|--------|---------------------------------------|
| r1   | p1    | 1 | 5      | Amazing apartment, very clean!        |
| r2   | p2    | 1 | 4      | Beautiful beach house, a bit pricey.  |

---

### 6. Messages
- Messages simulate communication between users (guest ↔ host).

| message_id | sender_id | recipient_id | message_body                                  |
|------------|-----------|--------------|-----------------------------------------------|
| m1    | 1    | 2       | Hi Ahmed, is the apartment available in September? |
| m2    | 2    | 1       | Hi Sara, yes, it is available!               |

---

## ⚡ Notes
- UUIDs are used for all primary keys.  
- `created_at` and `sent_at` timestamps are set to `CURRENT_TIMESTAMP` by default.  
- This dataset provides a **complete minimal example** for testing relationships, joins, and queries.  
