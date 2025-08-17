-- Customers Table
drop table if exists customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

-- Products Table
drop table if exists products;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    platform VARCHAR(20), -- Zepto or Blinkit
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders Table
drop table if exists orders;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_time TIME,
    total_bill DECIMAL(10,2),
    quantity INT,
    product_id INT,
    customer_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

show tables;

