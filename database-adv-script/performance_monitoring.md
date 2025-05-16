✅ Continuous Monitoring and Refinement of Database Performance
🔍 1. Monitor Queries Using EXPLAIN ANALYZE or SHOW PROFILE
Example Query (frequently used):

SELECT
b.booking_id,
u.first_name,
p.name AS property_name,
b.start_date,
b.status
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-06-01' AND '2025-06-30'
ORDER BY b.start_date;
PostgreSQL:
sql
Copy
Edit
EXPLAIN ANALYZE
SELECT ...
MySQL (alternative):
sql
Copy
Edit
SHOW PROFILE FOR QUERY <query_id>;

⚠️ 2. Identify Bottlenecks
From EXPLAIN ANALYZE, you may observe:

Seq Scan on Booking — full table scan instead of index usage

Nested Loop Joins on User and Property — slow for large datasets

Sorting without indexes on start_date

🛠️ 3. Suggested Changes

✅ A. Add or Confirm Useful Indexes

-- Booking table
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Property table
CREATE INDEX idx_property_name ON Property(name);

-- User table
CREATE INDEX idx_user_first_name ON "User"(first_name);
✅ B. Schema Adjustments (if needed)
Ensure the Booking table is partitioned by start_date if it’s large.

Consider denormalizing or adding a materialized view if the same complex joins are repeatedly used.

🧪 4. Re-run Query and Compare
After indexes are added, re-run the EXPLAIN ANALYZE:

EXPLAIN ANALYZE
SELECT ...
