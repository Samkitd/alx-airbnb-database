INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Smith', 'alice@example.com', 'hashedpassword1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword2', '0987654321', 'host', CURRENT_TIMESTAMP),
('33333333-3333-3333-3333-333333333333', 'Carol', 'Admin', 'carol@example.com', 'hashedpassword3', NULL, 'admin', CURRENT_TIMESTAMP);

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Sunny Apartment', 'A bright 2-bedroom apartment.', 'New York, NY', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Cabin', 'Woodland cabin perfect for couples.', 'Aspen, CO', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-06-01', '2025-06-05', 480.00, 'confirmed', CURRENT_TIMESTAMP),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-07-10', '2025-07-15', 1000.00, 'pending', CURRENT_TIMESTAMP);

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('ccccccc1-cccc-cccc-cccc-cccccccccccc', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 480.00, CURRENT_TIMESTAMP, 'credit_card');

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('ddddddd1-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Great location and very clean!', CURRENT_TIMESTAMP),
('ddddddd2-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 4, 'Peaceful stay but a bit cold at night.', CURRENT_TIMESTAMP);

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeeee', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, is the cabin available on July 10?', CURRENT_TIMESTAMP),
('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeeee', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available. Let me know if you want to confirm.', CURRENT_TIMESTAMP);
