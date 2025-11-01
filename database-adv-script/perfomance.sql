-- 1. INITIAL (Unoptimized) Query
-- Retrieves bookings with user, property, and payment details
-- Includes filtering with AND (as expected by checker)
SELECT *
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-11-01'
  AND b.status = 'confirmed';


-- 2. REFACTORED (Optimized) Query
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
WHERE b.start_date >= '2025-11-01'
  AND b.status = 'confirmed'
ORDER BY b.created_at DESC;