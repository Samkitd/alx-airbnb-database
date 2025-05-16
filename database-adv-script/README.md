🔗 1. INNER JOIN – Users & Bookings
🎯 Purpose: Returns only bookings that have a matching user.

✅ Only shows rows where Booking.user_id = User.user_id.

👤 Useful for listing confirmed bookings with full user info.

🏠 2. LEFT JOIN – Properties & Reviews
🏘️ Purpose: Lists all properties, even if they have no reviews.

💬 Review fields will be NULL if no review exists for a property.

✅ Great for identifying unrated properties or displaying all listings.

🔄 3. FULL OUTER JOIN – Users & Bookings
🔍 Purpose: Shows all users and all bookings — even unmatched ones.

🧩 Combines:

Users with bookings ✅

Users without bookings ❌

Bookings without users ❓

🔧 Useful for data auditing and spotting orphaned records.


