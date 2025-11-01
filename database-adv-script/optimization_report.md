# Query Optimization Report – Airbnb Clone

## Objective
Refactor a complex query that joins `booking`, `user`, `property`, and `payment` tables to improve execution time and reduce resource usage.

---

## 1. Initial Query

```sql
SELECT *
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id;


EXPLAIN SELECT * FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pay ON b.booking_id = pay.booking_id;



