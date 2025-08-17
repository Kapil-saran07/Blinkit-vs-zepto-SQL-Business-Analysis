-- Customers
INSERT INTO customers VALUES
(1, 'Amit Sharma', 25, 'Male', 'amit@gmail.com', 'Delhi', 'Delhi'),
(2, 'Priya Singh', 32, 'Female', 'priya@gmail.com', 'Mumbai', 'Maharashtra'),
(3, 'Ravi Kumar', 45, 'Male', 'ravi@gmail.com', 'Bangalore', 'Karnataka'),
(4, 'Neha Gupta', 29, 'Female', 'neha@gmail.com', 'Chennai', 'Tamil Nadu'),
(5, 'Karan Patel', 52, 'Male', 'karan@gmail.com', 'Ahmedabad', 'Gujarat'),
(6, 'Simran Kaur', 41, 'Female', 'simran@gmail.com', 'Jaipur', 'Rajasthan');

-- Products
INSERT INTO products VALUES
(101, 'Milk 1L', 'Zepto', 'Dairy', 60),
(102, 'Bread', 'Blinkit', 'Bakery', 40),
(103, 'Eggs 12pcs', 'Zepto', 'Poultry', 70),
(104, 'Apples 1kg', 'Blinkit', 'Fruits', 120),
(105, 'Detergent', 'Zepto', 'Household', 250),
(106, 'Chips', 'Blinkit', 'Snacks', 30),
(107, 'Rice 5kg', 'Zepto', 'Grains', 400),
(108, 'Oil 1L', 'Blinkit', 'Grocery', 180);

-- Orders
INSERT INTO orders VALUES
(201, '2024-01-12', '10:30:00', 120, 2, 101, 1),
(202, '2024-01-13', '18:45:00', 240, 2, 104, 2),
(203, '2024-02-05', '09:20:00', 500, 2, 107, 3),
(204, '2024-02-08', '20:10:00', 100, 3, 106, 1),
(205, '2024-02-12', '11:15:00', 250, 1, 105, 4),
(206, '2024-03-01', '14:00:00', 180, 1, 108, 5),
(207, '2024-03-05', '19:30:00', 210, 3, 102, 2),
(208, '2024-03-10', '08:15:00', 140, 2, 103, 6);

select * from customers;
select * from products;
select * from orders;