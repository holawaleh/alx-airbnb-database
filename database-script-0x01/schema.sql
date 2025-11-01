CREATE TABLE user(
   user_id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20)  -- starts with +234
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON user(email);

CREATE TABLE property(
    property_id CHAR(36) PRIMARY KEY,
    host_id CHAR(36) NOT NULL,
    FOREIGN KEY (host_id) REFERENCES user(user_id),
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    description TEXT,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    user_id CHAR(36) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   
);


CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_user_id ON booking(user_id);


CREATE TABLE payment (
    payment_id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,

    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);


CREATE INDEX idx_payment_booking_id ON payment(booking_id);

CREATE TABLE review (
    review_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE INDEX idx_review_property_id ON review(property_id);
CREATE INDEX idx_review_user_id ON review(user_id);


CREATE TABLE message (
    message_id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (sender_id) REFERENCES user(user_id),
    FOREIGN KEY (recipient_id) REFERENCES user(user_id)
);

CREATE INDEX idx_message_sender_id ON message(sender_id);
CREATE INDEX idx_message_recipient_id ON message(recipient_id);

