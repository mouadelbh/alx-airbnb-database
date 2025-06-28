-- Insert Hosts
INSERT INTO users (user_id, first_name, last_name, email, password_hash, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Wonderland', 'alice@bnb.com', 'pass123', 'host'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Builder', 'bob@bnb.com', 'pass456', 'host');

-- Insert Guests
INSERT INTO users (user_id, first_name, last_name, email, password_hash, role)
VALUES
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Chaplin', 'charlie@bnb.com', 'pass789', 'guest'),
('44444444-4444-4444-4444-444444444444', 'Daisy', 'Duck', 'daisy@bnb.com', 'passabc', 'guest');

-- Insert Properties
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 'Ocean View Apartment', 'Beautiful sea-facing apartment.', 'Miami, FL', 120.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', 'Mountain Cabin', 'Cozy cabin in the woods.', 'Aspen, CO', 90.00);

-- Insert Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '33333333-3333-3333-3333-333333333333', '2025-07-01', '2025-07-05', 480.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', '2025-08-10', '2025-08-12', 180.00, 'pending');

-- Insert Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 480.00, 'stripe');

-- Insert Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('ddddddd1-dddd-dddd-dddd-dddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '33333333-3333-3333-3333-333333333333', 5, 'Amazing place with a great view!');

-- Insert Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '33333333-3333-3333-3333-333333333333', '11111111-1111-1111-1111-111111111111', 'Hi Alice, is your apartment available next weekend?');
