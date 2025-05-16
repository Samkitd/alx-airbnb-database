-- User table
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_user_id ON "User"(user_id);  -- Redundant if PK, but shown for clarity

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_created_at ON Booking(created_at);

-- Property table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_id ON Property(property_id);  -- Redundant if PK, shown for visibility

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
