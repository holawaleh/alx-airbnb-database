-- To find all properties in my database from Jos with average rating < 4.5
SELECT p.name, AVG(r.rating) as avg_rating
FROM properties p
JOIN reviews r ON p.property_id = r.property_id
WHERE p.city = 'jos'
GROUP BY p.property_id
HAVING AVG(r.rating) <4.5;

SELECT * FROM bookings WHERE start_date >= '2025-12-01';


-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings.
-- Only shows bookings that have a valid user (guest).
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email
FROM booking b
INNER JOIN user u ON b.user_id = u.user_id;


-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews.
-- Every property appears, even if it has 0 reviews.
SELECT 
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM property p
LEFT JOIN review r ON p.property_id = r.property_id;


-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, 
-- even if the user has no booking OR a booking is not linked to a user.

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM user u
LEFT JOIN booking b ON u.user_id = b.user_id

FULL OUTER JOIN booking b ON u.user_id = b.user_id;

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM user u
RIGHT JOIN booking b ON u.user_id = b.user_id
WHERE u.user_id IS NULL;

