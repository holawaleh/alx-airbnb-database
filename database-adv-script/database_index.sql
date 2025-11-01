-- 1. Index on user.email (for fast login and lookup)
CREATE INDEX idx_user_email ON user(email);

-- 2. Index on property.host_id (for "my listings" dashboard)
CREATE INDEX idx_property_host_id ON property(host_id);

-- 3. Index on property.city (for location-based search in Nigeria)
CREATE INDEX idx_property_city ON property(city);

-- 4. Composite index on property(city, price_per_night) 
--    for filtered searches: "Lagos under ₦50,000"
CREATE INDEX idx_property_city_price ON property(city, price_per_night);

-- 5. Index on booking.user_id (for "my bookings" page)
CREATE INDEX idx_booking_user_id ON booking(user_id);

-- 6. Index on booking.property_id (for property availability checks)
CREATE INDEX idx_booking_property_id ON booking(property_id);

-- 7. Index on booking.start_date (for date-range queries and partitioning prep)
CREATE INDEX idx_booking_start_date ON booking(start_date);


EXPLAIN SELECT * FROM booking 
WHERE property_id = 'prop_123' AND start_date BETWEEN '2025-12-01' AND '2025-12-31';
-- Output: "type: ALL, rows: 10240, Extra: Using where"


CREATE INDEX idx_booking_property_date ON booking(property_id, start_date);