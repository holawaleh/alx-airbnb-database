# Partitioning Performance Report – Airbnb Clone

## Objective
Improve query performance on the large `booking` table by implementing **RANGE partitioning** on `start_date`.

## Approach
- Partitioned `booking` table by **year-month** (e.g., `p202511` for Nov 2025)
- Used `PARTITION BY RANGE (YEAR(start_date)*100 + MONTH(start_date))`
- Tested with date-range queries common in the app (e.g., “show bookings this month”)

## Test Query
```sql
SELECT * FROM booking_partitioned 
WHERE start_date BETWEEN '2025-11-01' AND '2025-11-30';