-- Step 1: Recreate the booking table with RANGE partitioning by YEAR-MONTH
-- Note: In practice, you'd migrate data; here we show DDL structure

DROP TABLE IF EXISTS booking_partitioned;

CREATE TABLE booking_partitioned (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
)
PARTITION BY RANGE (YEAR(start_date) * 100 + MONTH(start_date)) (
    PARTITION p202501 VALUES LESS THAN (202502), -- Jan 2025
    PARTITION p202502 VALUES LESS THAN (202503), -- Feb 2025
    PARTITION p202503 VALUES LESS THAN (202504), -- Mar 2025
    PARTITION p202504 VALUES LESS THAN (202505), -- Apr 2025
    PARTITION p202505 VALUES LESS THAN (202506), -- May 2025
    PARTITION p202506 VALUES LESS THAN (202507), -- Jun 2025
    PARTITION p202507 VALUES LESS THAN (202508), -- Jul 2025
    PARTITION p202508 VALUES LESS THAN (202509), -- Aug 2025
    PARTITION p202509 VALUES LESS THAN (202510), -- Sep 2025
    PARTITION p202510 VALUES LESS THAN (202511), -- Oct 2025
    PARTITION p202511 VALUES LESS THAN (202512), -- Nov 2025
    PARTITION p202512 VALUES LESS THAN (202601), -- Dec 2025
    PARTITION p_future VALUES LESS THAN MAXVALUE  -- Future dates
);

-- Step 2: Example query that benefits from partition pruning
-- This query will only scan partition p202511 (Nov 2025)
SELECT * 
FROM booking_partitioned 
WHERE start_date BETWEEN '2025-11-01' AND '2025-11-30';

-- Step 3: EXPLAIN to verify partition pruning
EXPLAIN SELECT * 
FROM booking_partitioned 
WHERE start_date BETWEEN '2025-11-01' AND '2025-11-30';