# 1. Analyze with EXPLAIN

EXPLAIN ANALYZE

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

# Typical problems revealed:

Sequential scans on Booking, User, or Payment tables

Nested loops for joins with large tables

JOINs on unindexed columns (e.g., booking_id, property_id)
