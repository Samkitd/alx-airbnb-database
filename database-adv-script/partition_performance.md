# 1. Test Query Performance

🔬 A. Run EXPLAIN on query BEFORE partitioning:

# EXPLAIN ANALYZE

SELECT \* FROM Booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';

Expected Result (Before):

Seq Scan on Booking

High cost

Long execution time

B. Run EXPLAIN on query AFTER partitioning:

# EXPLAIN ANALYZE

SELECT \* FROM Booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';

Expected Result (After):

Index/Bitmap Scan on Booking_2025_01

Partition pruning (only the relevant partition is scanned)

Reduced cost and execution time
