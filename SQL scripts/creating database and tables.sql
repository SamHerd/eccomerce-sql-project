CREATE DATABASE ecommerce_data;
USE ecommerce_data;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
signup_date DATE,
customer_segment VARCHAR(50)
);

CREATE TABLE sessions (
session_id INT PRIMARY KEY,
customer_id INT,
start_time DATETIME,
device VARCHAR(20),
location VARCHAR(50),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2)
);

CREATE TABLE page_views (
session_id INT,
page_id INT,
time_spent INT,
clicked_cta TINYINT,
FOREIGN KEY (session_id) REFERENCES sessions(session_id)
);

CREATE TABLE cart_actions (
customer_id INT,
product_id INT,
action_type ENUM('Add', 'Remove', 'Purchase'),
timestamp DATETIME,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE transactions (
transaction_id INT PRIMARY KEY,
customer_id INT,
transaction_date DATE,
amount DECIMAL(10,2),
payment_method VARCHAR(50),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
