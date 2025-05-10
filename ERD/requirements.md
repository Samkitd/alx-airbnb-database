 Entities and Attributes
1. User
user_id (PK, UUID, Indexed)

first_name (VARCHAR, NOT NULL)

last_name (VARCHAR, NOT NULL)

email (VARCHAR, UNIQUE, NOT NULL, Indexed)

password_hash (VARCHAR, NOT NULL)

phone_number (VARCHAR, NULL)

role (ENUM: guest, host, admin, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

2. Property
property_id (PK, UUID, Indexed)

host_id (FK → User.user_id)

name (VARCHAR, NOT NULL)

description (TEXT, NOT NULL)

location (VARCHAR, NOT NULL)

pricepernight (DECIMAL, NOT NULL)

created_at (TIMESTAMP)

updated_at (TIMESTAMP)

3. Booking
booking_id (PK, UUID, Indexed)

property_id (FK → Property.property_id)

user_id (FK → User.user_id)

start_date (DATE, NOT NULL)

end_date (DATE, NOT NULL)

total_price (DECIMAL, NOT NULL)

status (ENUM: pending, confirmed, canceled)

created_at (TIMESTAMP)

4. Payment
payment_id (PK, UUID, Indexed)

booking_id (FK → Booking.booking_id)

amount (DECIMAL, NOT NULL)

payment_date (TIMESTAMP)

payment_method (ENUM: credit_card, paypal, stripe)

5. Review
review_id (PK, UUID, Indexed)

property_id (FK → Property.property_id)

user_id (FK → User.user_id)

rating (INTEGER: 1–5, NOT NULL)

comment (TEXT, NOT NULL)

created_at (TIMESTAMP)

6. Message
message_id (PK, UUID, Indexed)

sender_id (FK → User.user_id)

recipient_id (FK → User.user_id)

message_body (TEXT, NOT NULL)

sent_at (TIMESTAMP)



######################################################################################

 Entity Relationships
Relationship	Type	Notes
User ↔ Booking	1:N	A user can make many bookings
User ↔ Property	1:N	A host user can create many properties
User ↔ Review	1:N	A user can write many reviews
User ↔ Message	1:N (sender), 1:N (recipient)	Users can send/receive many messages
Property ↔ Booking	1:N	A property can have many bookings
Property ↔ Review	1:N	A property can have many reviews
Booking ↔ Payment	1:1	A booking has one payment
Booking ↔ User	N:1	User who booked the property
Message ↔ User	N:1	Sender and recipient are both users
