CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Example: January 2025 partition
CREATE TABLE Booking_2025_01 PARTITION OF Booking
FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

-- February 2025
CREATE TABLE Booking_2025_02 PARTITION OF Booking
FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');