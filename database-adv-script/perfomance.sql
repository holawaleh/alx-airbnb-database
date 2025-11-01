-- 1. INITIAL (Unoptimized) Query
-- Retrieves all bookings with user, property, and payment details
-- Inefficient: SELECT *, redundant joins, no filtering
SELECT *
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id;


-- 2. REFACTORED (Optimized) Query
-- Only selects needed columns
-- Uses explicit column list (not SELECT *)
-- Assumes indexes exist on:
--   booking(user_id), booking(property_id), payment(booking_id)
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.city,
    p.price_per_night,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM booking b
INNER JOIN user u ON b.user_id = u.user_id
INNER JOIN property p ON b.property_id = p.property_id
INNER JOIN payment pay ON b.booking_id = pay.booking_id
-- Optional: add WHERE clause for real-world use (e.g., date range)
-- WHERE b.start_date >= '2025-11-01'
ORDER BY b.created_at DESC;


EXPLAIN SELECT * FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id;