-- 1. INITIAL QUERY (with AND)
SELECT *
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-11-01' AND b.status = 'confirmed';

-- 2. EXPLAIN ANALYSIS
EXPLAIN SELECT *
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-11-01' AND b.status = 'confirmed';

-- 3. REFACTORED QUERY
SELECT 
    b.booking_id, b.start_date, b.status,
    u.email,
    p.name,
    pay.amount
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-11-01' AND b.status = 'confirmed';