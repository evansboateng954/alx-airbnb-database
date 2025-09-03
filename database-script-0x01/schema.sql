CREATE TABLE user (
  user_id CHAR(50) PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(70) NOT NULL UNIQUE,
  password_hash VARCHAR(150) NOT NULL,
  phone_number VARCHAR(18),
  role ENUM('guest', 'host', 'admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);


CREATE TABLE property (
  property_id CHAR(50) PRIMARY KEY,
  host_id CHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(70) NOT NULL,
  pricepernight DECIMAL(10, 3)  NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT ON UPDATE CURRENT_TIMESTAMP
  FOREIGN KEY (host_id) REFERENCES user(user_id) );


CREATE TABLE booking (
  booking_id CHAR(50) PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date: DATE NOT NULL,
  total_price DECIMAL(10, 3) NOT NULL,
  status ENUM ('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
  FOREIGN KEY (property_id) REFERENCES property(property_id));

CREATE TABLE payment (
  payment_id CHAR(50) PRIMARY KEY,
  amount DECIMAL(10, 3) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (booking_id) REFERENCES booking(booking_id));
