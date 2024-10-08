CREATE TABLE users (
  id INT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  viewkey VARCHAR(100) NOT NULL,
  balance DECIMAL(20, 8) NOT NULL DEFAULT 0,
  withdrawal_pin_code VARCHAR(20) NULL
);

CREATE TABLE ads (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  title VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  price_fiat DECIMAL(20, 8) NOT NULL,
  price_crypto DECIMAL(20, 8) NULL,
  amount_min DECIMAL(20, 8) NOT NULL,
  amount_max DECIMAL(20, 8) NOT NULL,
  payment_methods VARCHAR(100) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE deposits (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  subaddress VARCHAR(100) NOT NULL,
  amount DECIMAL(20, 8) NOT NULL,
  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  confirmed TINYINT(1) NOT NULL DEFAULT 0
);

CREATE TABLE transactions (
  id INT PRIMARY KEY,
  buyer_id INT NOT NULL,
  seller_id INT NOT NULL,
  ad_id INT NOT NULL,
  amount DECIMAL(20, 8) NOT NULL,
  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) NOT NULL DEFAULT 'pending'
);

CREATE TABLE withdrawals (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  amount DECIMAL(20, 8) NOT NULL,
  wallet_address VARCHAR(100) NOT NULL,
  timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) NOT NULL DEFAULT 'pending'
);
