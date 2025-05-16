--  Initial Query (Unoptimized)

-- SELECT 
--     b.booking_id,
--     b.start_date,
--     b.end_date,
--     b.total_price,
--     b.status,
--     u.user_id,
--     u.first_name,
--     u.last_name,
--     u.email,
--     p.property_id,
--     p.name AS property_name,
--     p.location,
--     pay.payment_id,
--     pay.amount,
--     pay.payment_method,
--     pay.payment_date
-- FROM Booking b
-- JOIN "User" u ON b.user_id = u.user_id
-- JOIN Property p ON b.property_id = p.property_id
-- LEFT JOIN Payment pay ON pay.booking_id = b.booking_id;


-- Refactored Query

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id
WHERE b.status = 'Confirmed' AND pay.amount > 100;

🧪 Before Index:
EXPLAIN ANALYZE
SELECT \* FROM Booking WHERE user_id = '11111111-1111-1111-1111-111111111111';  
Output:
Seq Scan on booking (cost=0.00..1000.00 rows=50000 width=...)

🧪 After Index:
-- After CREATE INDEX idx_booking_user_id ON Booking(user_id);

EXPLAIN ANALYZE
SELECT \* FROM Booking WHERE user_id = '11111111-1111-1111-1111-111111111111';
Output:
Index Scan using idx_booking_user_id on booking (cost=0.25..30.00 rows=10 width=...)
