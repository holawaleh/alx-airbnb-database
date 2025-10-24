Insert Users

INSERT INTO user (user_id, first_name, last_name, email, password_hash, role)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'Awwal', 'Afolarin', 'awwal@hotlink.com', 'hash123','guest'),
  ('22222222-2222-2222-2222-222222222222', 'Idera', 'Toyin', 'toyin@gmail.com', 'hash456', 'host'),
  ('33333333-3333-3333-3333-333333333333', 'Adbulsalam', 'Kolapo', 'kolapo@yahoo.com', 'hash789', NULL, 'admin');


-- Insert Properties (host_id = Idera UUID)
INSERT INTO property (property_id, host_id, name, description, pricepernight)
VALUES
  ('44444444-4444-4444-4444-444444444444', '22222222-2222-2222-2222-222222222222',
   'Taiwo Road', 'A business space.', 120.00),
  
  ('55555555-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222',
   'Lawal estate', 'A bungalow.',  250.00);

-- Insert Bookings
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('66666666-6666-6666-6666-666666666666',
   '44444444-4444-4444-4444-444444444444',  
   '11111111-1111-1111-1111-111111111111',  
   '2025-11-01', '2025-11-05',               -- 4 nights
   480.00,                                   -- 4 × $120
   'confirmed');

 -- Insert Payment
INSERT INTO payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('77777777-7777-7777-7777-777777777777',
   '66666666-6666-6666-6666-666666666666',  
   480.00,
   'credit_card');

-- Insert Review
INSERT INTO review (review_id, property_id, user_id, rating, comment)
VALUES
  ('88888888-8888-8888-8888-888888888888',
   '44444444-4444-4444-4444-444444444444',  
   '11111111-1111-1111-1111-111111111111',  
   5,
   'Secured environement, conducive for work.');

-- Insert Message
INSERT INTO message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('99999999-9999-9999-9999-999999999999',
   '11111111-1111-1111-1111-111111111111',  -- Awwal(sender)
   '22222222-2222-2222-2222-222222222222',  -- Idera(recipient)
   'Hi Idera! Do you provide free internet too?');