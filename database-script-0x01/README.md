# Database Schema (SQL)

This directory contains the SQL script to create the database schema for the application.  
The script defines all **tables, primary keys, foreign keys, constraints, and indexes**.

# 📌 Tables Overview
## 📌 Entities and Attributes

### 1. User
- **user_id**: Primary Key (UUID)
- **first_name**: VARCHAR, NOT NULL
- **last_name**: VARCHAR, NOT NULL
- **email**: VARCHAR, UNIQUE, NOT NULL
- **password_hash**: VARCHAR, NOT NULL
- **phone_number**: VARCHAR, NULL
- **role**: ENUM (`guest`, `host`, `admin`), NOT NULL
- **created_at**: TIMESTAMP, default `CURRENT_TIMESTAMP`

**Indexes**
- `idx_user_email` → ensures fast lookups on unique email addresses.

---

### 2. Property
- **property_id**: Primary Key (UUID)
- **host_id**: Foreign Key → references `User(user_id)`
- **name**: VARCHAR, NOT NULL
- **description**: TEXT, NOT NULL
- **location**: VARCHAR, NOT NULL
- **pricepernight**: DECIMAL, NOT NULL
- **created_at**: TIMESTAMP, default `CURRENT_TIMESTAMP`
- **updated_at**: TIMESTAMP, auto-updates on modification

**Constraints**
- `fk_property_host` → ensures every property is owned by a valid user.

**Indexes**
- `idx_property_property_id` → supports fast joins and lookups.

---

### 3. Booking
- **booking_id**: Primary Key (UUID)
- **property_id**: Foreign Key → references `Property(property_id)`
- **user_id**: Foreign Key → references `User(user_id)`
- **start_date**: DATE, NOT NULL
- **end_date**: DATE, NOT NULL
- **total_price**: DECIMAL, NOT NULL
- **status**: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL
- **created_at**: TIMESTAMP, default `CURRENT_TIMESTAMP`

**Constraints**
- `fk_booking_property` → booking must reference an existing property.
- `fk_booking_user` → booking must reference a valid user.

**Indexes**
- `idx_booking_property_id` → speeds up queries for bookings by property.
- `idx_booking_booking_id` → improves joins with related tables.

---

### 4. Payment
- **payment_id**: Primary Key (UUID)
- **booking_id**: Foreign Key → references `Booking(booking_id)`
- **amount**: DECIMAL, NOT NULL
- **payment_date**: TIMESTAMP, default `CURRENT_TIMESTAMP`
- **payment_method**: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL

**Constraints**
- `fk_payment_booking` → ensures payments are linked to valid bookings.

**Indexes**
- `idx_payment_booking_id` → accelerates queries for payments per booking.

---

### 5. Review
- **review_id**: Primary Key (UUID)
- **property_id**: Foreign Key → references `Property(property_id)`
- **user_id**: Foreign Key → references `User(user_id)`
- **rating**: INT, CHECK (`1 <= rating <= 5`), NOT NULL
- **comment**: TEXT, NOT NULL
- **created_at**: TIMESTAMP, default `CURRENT_TIMESTAMP`

**Constraints**
- `fk_review_property` → review must belong to a property.
- `fk_review_user` → review must belong to a valid user.

---

### 6. Message
- **message_id**: Primary Key (UUID)
- **sender_id**: Foreign Key → references `User(user_id)`
- **recipient_id**: Foreign Key → references `User(user_id)`
- **message_body**: TEXT, NOT NULL
- **sent_at**: TIMESTAMP, default `CURRENT_TIMESTAMP`

**Constraints**
- `fk_message_sender` → sender must be a valid user.
- `fk_message_recipient` → recipient must be a valid user.
