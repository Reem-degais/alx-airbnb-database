-- ========================================
-- Sample Data Population Script
-- ========================================

-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('1', 'Sara', 'Ali', 'sara@example.com', 'hashed_pw1', '1234567890', 'guest', CURRENT_TIMESTAMP),
    ('2', 'Ahmed', 'Mohamed', 'ahmed@example.com', 'hashed_pw2', '0987654321', 'host', CURRENT_TIMESTAMP),
    ('3', 'Reem', 'Ahmed', 'reem@example.com', 'hashed_pw3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('p1', '2', 'Cozy Apartment', 'A lovely 2-bedroom apartment in the city center.', 'Jubail', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('p2', '2', 'Beach House', 'A modern house with ocean views.', 'Dmmam', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('b1', 'p1', '1', '2025-09-10', '2025-09-15', 600.00, 'confirmed', CURRENT_TIMESTAMP),
    ('b2', 'p2', '1', '2025-10-01', '2025-10-05', 1000.00, 'pending', CURRENT_TIMESTAMP);

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('pay1', 'b1', 600.00, CURRENT_TIMESTAMP, 'credit_card'),
    ('pay2', 'b2', 1000.00, CURRENT_TIMESTAMP, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('r1', 'p1', '1', 5, 'Amazing apartment, very clean and central!', CURRENT_TIMESTAMP),
    ('r2', 'p2', '1', 4, 'Beautiful beach house, but a bit pricey.', CURRENT_TIMESTAMP);

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('m1', '1', '2', 'Hi Ahmed, is the apartment available in September?', CURRENT_TIMESTAMP),
    ('m2', '2', '1', 'Hi Sara, yes it is available!', CURRENT_TIMESTAMP);
