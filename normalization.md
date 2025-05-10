Database Normalization to 3NF

## 🔹 First Normal Form (1NF)
- All tables already follow 1NF:
  - Atomic values (no lists or nested records)
  - Unique rows (enforced via primary keys)

## 🔹 Second Normal Form (2NF)
- All non-key attributes are fully functionally dependent on their full primary keys.
- No partial dependencies in any composite keys (since PKs are UUIDs).

## 🔹 Third Normal Form (3NF)
- We ensure **no transitive dependencies** (i.e., non-key attributes should not depend on other non-key attributes).

### ✅ Adjustments to Achieve 3NF:

1. **Remove derived attribute** from `Booking`:
   - Remove `total_price` if it can be calculated from:
     - `(DATEDIFF(end_date, start_date) * Property.pricepernight)`
   - Keep it only if:
     - Price can change after booking (e.g., discounts, dynamic pricing)
     - You want historical accuracy

2. **Optional: Extract Location into its own table**:
   - If properties have repeated location values and you want normalization:
     ```text
     Location (
       location_id UUID PRIMARY KEY,
       city VARCHAR,
       country VARCHAR,
       full_address TEXT
     )
     ```
     - Add `location_id` FK to `Property`.

3. **Merge or Separate Payment Table**:
   - If every booking has exactly one payment:
     - Could merge into `Booking` as:
       ```text
       payment_method ENUM,
       payment_amount DECIMAL,
       payment_date TIMESTAMP
       ```
     - But if you want flexibility (refunds, partial payments), keep as-is.

4. **Add ENUM constraints as CHECKs or reference tables (optional)**:
   - Normalize ENUMs into reference tables for better integrity (e.g., `Roles`, `BookingStatus`, `PaymentMethod`)
     - Example:
       ```text
       Role (
         role_id INT PRIMARY KEY,
         name VARCHAR UNIQUE
       )
       ```

## ✅ Final Result
- All tables will have only attributes that directly depend on the primary key.
- No derived or transitive attributes stored redundantly.
- Better data integrity and consistency for long-term maintenance.
