-- 1. Aggregation: Find the total number of bookings made by each user
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM user u
LEFT JOIN booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name, u.email
ORDER BY total_bookings DESC;


-- 2. Window Function: Rank properties using ROW_NUMBER() based on total bookings
-- ROW_NUMBER() assigns unique ranks even in case of ties
SELECT 
    p.property_id,
    p.name AS property_name,
    p.city,
    p.price_per_night,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property p
LEFT JOIN booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name, p.city, p.price_per_night
ORDER BY booking_rank ASC;