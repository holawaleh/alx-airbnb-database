Step 1: Review of Current Schema

The initial schema includes the following tables:

- **User**: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`
- **Property**: `property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`
- **Booking**: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`
- **Payment**: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`
- **Review**: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`
- **Message**: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`

All tables use UUIDs as primary keys and enforce foreign key constraints as specified.

---

## 🧪 Step 2: Normalization Analysis

### ✅ First Normal Form (1NF)

- **Requirement**: Each column contains atomic (indivisible) values; no repeating groups.
- **Assessment**: All attributes are scalar (e.g., `email` is a single string, not a list).  
  ✅ **Compliant**.

### ✅ Second Normal Form (2NF)

- **Requirement**: Must be in 1NF, and all non-key attributes must depend on the **entire primary key** (relevant for composite keys).
- **Assessment**:
  - All tables use a **single-column primary key** (`user_id`, `property_id`, etc.).
  - Therefore, partial dependencies are **not possible**.
    ✅ **Compliant**.

### ✅ Third Normal Form (3NF)

- **Requirement**: Must be in 2NF, and **no transitive dependencies**—i.e., non-key attributes must not depend on other non-key attributes.
- **Assessment**:

#### 🔸 **User Table**

- All attributes (`first_name`, `email`, etc.) depend **only** on `user_id`.  
  ✅ No transitive dependencies.

#### 🔸 **Property Table**

- `host_id` → references `User(user_id)` (foreign key, allowed).
- `location`, `pricepernight`, etc., describe the property and depend only on `property_id`.

  ✅ **Compliant**.

#### 🔸 **Booking Table**

- `total_price` is derived from `pricepernight × nights`.  
  ❗ **Risk**: Storing `total_price` could introduce redundancy if `pricepernight` changes later.

  **intentional and justified**—not a transitive dependency.
  ✅ **Compliant**.

#### 🔸 **Payment Table**

- All fields depend directly on `payment_id`.
- `booking_id` is a foreign key.  
  ✅ **Compliant**.

#### 🔸 **Review Table**

- `rating` and `comment` depend on the review itself (`review_id`), not on other non-key attributes.  
  ✅ **Compliant**.

#### 🔸 **Message Table**

- `sender_id` and `recipient_id` are foreign keys to `User`.
- `message_body` depends only on `message_id`.  
  ✅ **Compliant**.

## ✅ Conclusion

The database schema **fully satisfies Third Normal Form (3NF)**:

- No repeating groups (1NF ✔️)
- No partial dependencies (2NF ✔️)
- No transitive dependencies (3NF ✔️)

The design ensures **data integrity**, **minimizes redundancy**, and supports the functional requirements of an Airbnb-like platform.

No table restructuring is needed. The current schema is **3NF-compliant and production-ready**.
