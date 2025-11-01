# Database Performance Monitoring & Refinement – Airbnb Clone

## Objective
Continuously monitor query performance, identify bottlenecks, and refine the schema to optimize the Airbnb Clone database.

---

## 1. Monitored Queries

We analyzed three high-impact queries using `EXPLAIN ANALYZE` (PostgreSQL) / `EXPLAIN` + `SHOW PROFILES` (MySQL).

### Query A: Find bookings for a user in the last 30 days
```sql
SELECT * FROM booking 
WHERE user_id = 'usr_abc123' 
  AND start_date >= '2025-10-02';

SELECT * FROM property 
WHERE city = 'Lagos' 
  AND price_per_night <= 50000;

SELECT p.name, AVG(r.rating) 
FROM property p 
LEFT JOIN review r ON p.property_id = r.property_id 
GROUP BY p.property_id;

EXPLAIN SELECT * FROM booking 
WHERE user_id = 'usr_abc123' AND start_date >= '2025-10-02';


EXPLAIN SELECT * FROM property 
WHERE city = 'Lagos' AND price_per_night <= 50000;