# Index Performance Analysis – Airbnb Clone

## Objective
Measure query performance before and after adding indexes to optimize common operations.

## Tested Query
```sql
-- Find all bookings in December 2025 for a specific property
SELECT * 
FROM booking 
WHERE property_id = 'prop_123' 
  AND start_date >= '2025-12-01' 
  AND start_date <= '2025-12-31';