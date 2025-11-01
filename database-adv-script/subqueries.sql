-- 1. Non-correlated subquery: Find all properties where the average rating is greater than 4.0
-- This query calculates average rating per property in a subquery, then filters in the outer query.
SELECT 
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    p.city
FROM property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);


-- 2. Correlated subquery: Find users who have made more than 3 bookings
-- The subquery references the outer query's user_id (correlation).
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM user u
WHERE (
    SELECT COUNT(*)
    FROM booking b
    WHERE b.user_id = u.user_id  -- ← correlation: b.user_id linked to u.user_id
) > 3;