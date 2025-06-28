CREATE TABLE users {
	user_id UUID PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	password_hash VARCHAR(255) NOT NULL,
	phone_number VARCHAR(20),
	role ENUM('guest', 'host', 'admin') NOT NULL DEFAULT 'guest',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
};

CREATE TABLE properties {
	property_id UUID PRIMARY KEY,
	host_id UUID NOT NULL,
	name VARCHAR(100) NOT NULL,
	description TEXT NOT NULL,
	location VARCHAR(100) NOT NULL,
	price_per_night DECIMAL(10, 2) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES users(user_id)
};

CREATE TABLE bookings {
	booking_id UUID PRIMARY KEY,
	property_id UUID NOT NULL,
	user_id UUID NOT NULL,
	start_date DATE NOT NULL.
	end_date DATE NOT NULL,
	total_price DECIMAL(10, 2) NOT NULL,
	status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(property_id),
	CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id)
};

CREATE TABLE payments {
	payment_id UUID PRIMARY KEY,
	booking_id UUID NOT NULL,
	amount DECIMAL(10, 2) NOT NULL,
	payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
	status ENUM('pending', 'completed', 'failed') NOT NULL DEFAULT 'pending',
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
};

CREATE TABLE reviews (
	review_id UUID PRIMARY KEY,
	property_id UUID NOT NULL,
	user_id UUID NOT NULL,
	rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
	comment TEXT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES properties(property_id)
);

CREATE TABLE messages (
	message_id UUID PRIMARY KEY,
	sender_id UUID NOT NULL,
	recipient_id UUID NOT NULL,
	message_body TEXT NOT NULL,
	sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES users(user_id),
	CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);
