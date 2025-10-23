# alx-airbnb-database

A project based on airbnb cloning
-add requirements.md
-add normalization.md

# Database Schema Script (0x01)

This directory contains the SQL script to create the initial database schema for the ALX Airbnb project.

## Files

- `schema.sql`: Creates all tables, constraints, and indexes.

## Usage

Run in MySQL:

```sql
SOURCE database-script-0x01/schema.sql;


Design Notes

    All primary keys are UUIDs (CHAR(36)).
    Foreign key constraints enforce referential integrity.
    Indexes added on frequently queried columns (email, property_id, etc.).
    Tables created in dependency order (parent before child).

Design Notes

    All primary keys are UUIDs (CHAR(36)).
    Foreign key constraints enforce referential integrity.
    Indexes added on frequently queried columns (email, property_id, etc.).
    Tables created in dependency order (parent before child).
```
