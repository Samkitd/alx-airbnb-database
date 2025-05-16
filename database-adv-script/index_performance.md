# 1: Identify High-Usage Columns

🔍 Based on typical queries:

User table:
user_id — used in JOINs with Booking, Message, etc.

email — used in lookups (e.g., login, unique checks)

Booking table:
booking_id — used for primary key lookup

user_id, property_id — used in JOINs and filters

status, created_at — often filtered or ordered by

Property table:
property_id — used in JOINs (Review, Booking, etc.)

host_id — JOIN with User

location — potentially used in filters (e.g., search by city)

# 2: Measure Performance (Using EXPLAIN and ANALYZE)

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
