-- Sample dataset for E-Commerce Sales & Customer Analytics
-- 30 customers, 20 products, 120 orders and 284 order items

BEGIN TRANSACTION;

INSERT INTO customers (customer_id, customer_name, email, city, state, signup_date) VALUES
(1, 'Varun Kumar', 'customer1@example.com', 'Visakhapatnam', 'Andhra Pradesh', '2025-08-29'),
(2, 'Asha Singh', 'customer2@example.com', 'Hyderabad', 'Telangana', '2025-03-07'),
(3, 'Sneha Gupta', 'customer3@example.com', 'Pune', 'Maharashtra', '2025-03-14'),
(4, 'Rahul Reddy', 'customer4@example.com', 'Chennai', 'Tamil Nadu', '2025-06-25'),
(5, 'Isha Rao', 'customer5@example.com', 'Visakhapatnam', 'Andhra Pradesh', '2025-07-31'),
(6, 'Rohan Patel', 'customer6@example.com', 'Mumbai', 'Maharashtra', '2025-03-20'),
(7, 'Aarav Naidu', 'customer7@example.com', 'Vijayawada', 'Andhra Pradesh', '2025-05-11'),
(8, 'Meera Das', 'customer8@example.com', 'Bengaluru', 'Karnataka', '2025-01-15'),
(9, 'Kavya Sharma', 'customer9@example.com', 'Vijayawada', 'Andhra Pradesh', '2025-04-22'),
(10, 'Arjun Verma', 'customer10@example.com', 'Delhi', 'Delhi', '2025-03-29'),
(11, 'Nisha Rao', 'customer11@example.com', 'Hyderabad', 'Telangana', '2025-10-23'),
(12, 'Sanjay Kumar', 'customer12@example.com', 'Mumbai', 'Maharashtra', '2025-04-09'),
(13, 'Priya Singh', 'customer13@example.com', 'Pune', 'Maharashtra', '2025-04-04'),
(14, 'Aditya Reddy', 'customer14@example.com', 'Vijayawada', 'Andhra Pradesh', '2025-09-08'),
(15, 'Divya Naidu', 'customer15@example.com', 'Chennai', 'Tamil Nadu', '2025-09-01'),
(16, 'Manoj Gupta', 'customer16@example.com', 'Pune', 'Maharashtra', '2025-07-10'),
(17, 'Ananya Patel', 'customer17@example.com', 'Hyderabad', 'Telangana', '2025-02-02'),
(18, 'Vikram Sharma', 'customer18@example.com', 'Bengaluru', 'Karnataka', '2025-05-25'),
(19, 'Pooja Reddy', 'customer19@example.com', 'Mumbai', 'Maharashtra', '2025-02-23'),
(20, 'Kiran Das', 'customer20@example.com', 'Delhi', 'Delhi', '2025-08-23'),
(21, 'Varun Gupta', 'customer21@example.com', 'Chennai', 'Tamil Nadu', '2025-06-05'),
(22, 'Rahul Singh', 'customer22@example.com', 'Bengaluru', 'Karnataka', '2025-07-14'),
(23, 'Isha Sharma', 'customer23@example.com', 'Visakhapatnam', 'Andhra Pradesh', '2025-01-22'),
(24, 'Aarav Rao', 'customer24@example.com', 'Vijayawada', 'Andhra Pradesh', '2025-09-28'),
(25, 'Sneha Naidu', 'customer25@example.com', 'Pune', 'Maharashtra', '2025-02-06'),
(26, 'Rohan Das', 'customer26@example.com', 'Delhi', 'Delhi', '2025-07-01'),
(27, 'Meera Verma', 'customer27@example.com', 'Hyderabad', 'Telangana', '2025-10-08'),
(28, 'Kavya Kumar', 'customer28@example.com', 'Chennai', 'Tamil Nadu', '2025-02-13'),
(29, 'Arjun Patel', 'customer29@example.com', 'Visakhapatnam', 'Andhra Pradesh', '2025-06-14'),
(30, 'Nisha Singh', 'customer30@example.com', 'Mumbai', 'Maharashtra', '2025-09-20');

INSERT INTO products (product_id, product_name, category, unit_price, stock_quantity) VALUES
(1, 'Wireless Mouse', 'Electronics', 34.86, 31),
(2, 'Mechanical Keyboard', 'Electronics', 91.77, 85),
(3, 'USB-C Hub', 'Electronics', 75.62, 73),
(4, 'Bluetooth Speaker', 'Electronics', 119.54, 20),
(5, 'Webcam', 'Electronics', 139.75, 63),
(6, 'Desk Lamp', 'Home', 107.31, 52),
(7, 'Coffee Maker', 'Home', 78.68, 73),
(8, 'Air Purifier', 'Home', 106.13, 21),
(9, 'Storage Box', 'Home', 128.76, 81),
(10, 'Water Bottle', 'Home', 115.52, 36),
(11, 'SQL Fundamentals', 'Books', 37.92, 33),
(12, 'Python for Data Analysis', 'Books', 139.13, 58),
(13, 'Data Engineering Basics', 'Books', 54.23, 74),
(14, 'AI with Python', 'Books', 107.15, 20),
(15, 'Business Analytics', 'Books', 103.12, 56),
(16, 'Laptop Sleeve', 'Accessories', 24.85, 36),
(17, 'Backpack', 'Accessories', 116.21, 95),
(18, 'Phone Stand', 'Accessories', 47.68, 68),
(19, 'Cable Organizer', 'Accessories', 38.64, 38),
(20, 'Notebook', 'Accessories', 60.71, 109);

INSERT INTO orders (order_id, customer_id, order_date, order_status) VALUES
(1, 21, '2025-09-02', 'Delivered'), (2, 2, '2025-04-04', 'Delivered'), (3, 8, '2025-05-17', 'Delivered'), (4, 13, '2025-10-16', 'Shipped'), (5, 21, '2025-02-09', 'Delivered'), (6, 29, '2025-04-28', 'Delivered'), (7, 14, '2025-02-15', 'Delivered'), (8, 6, '2025-08-23', 'Processing'), (9, 5, '2025-08-08', 'Delivered'), (10, 13, '2025-05-28', 'Delivered'),
(11, 29, '2025-08-14', 'Delivered'), (12, 4, '2025-09-18', 'Delivered'), (13, 12, '2025-03-10', 'Delivered'), (14, 17, '2025-09-28', 'Shipped'), (15, 4, '2025-10-10', 'Delivered'), (16, 24, '2025-05-22', 'Delivered'), (17, 7, '2025-03-24', 'Delivered'), (18, 20, '2025-03-12', 'Delivered'), (19, 22, '2025-07-30', 'Processing'), (20, 21, '2025-05-19', 'Delivered'),
(21, 10, '2025-04-16', 'Delivered'), (22, 3, '2025-09-05', 'Delivered'), (23, 18, '2025-07-14', 'Shipped'), (24, 25, '2025-06-26', 'Delivered'), (25, 20, '2025-10-06', 'Delivered'), (26, 27, '2025-03-28', 'Delivered'), (27, 3, '2025-09-30', 'Delivered'), (28, 30, '2025-08-30', 'Delivered'), (29, 1, '2025-05-08', 'Cancelled'), (30, 16, '2025-04-27', 'Delivered'),
(31, 26, '2025-10-01', 'Delivered'), (32, 13, '2025-03-17', 'Delivered'), (33, 15, '2025-04-30', 'Delivered'), (34, 8, '2025-10-03', 'Delivered'), (35, 19, '2025-05-12', 'Delivered'), (36, 22, '2025-02-19', 'Delivered'), (37, 24, '2025-07-01', 'Delivered'), (38, 30, '2025-06-03', 'Shipped'), (39, 3, '2025-06-15', 'Delivered'), (40, 17, '2025-05-31', 'Delivered'),
(41, 11, '2025-03-07', 'Delivered'), (42, 23, '2025-08-11', 'Delivered'), (43, 9, '2025-09-14', 'Delivered'), (44, 28, '2025-04-08', 'Delivered'), (45, 13, '2025-06-20', 'Delivered'), (46, 2, '2025-10-12', 'Processing'), (47, 25, '2025-03-03', 'Delivered'), (48, 6, '2025-07-22', 'Delivered'), (49, 20, '2025-05-05', 'Delivered'), (50, 18, '2025-09-23', 'Delivered'),
(51, 4, '2025-02-28', 'Delivered'), (52, 29, '2025-09-11', 'Delivered'), (53, 14, '2025-08-18', 'Delivered'), (54, 1, '2025-06-07', 'Delivered'), (55, 16, '2025-07-27', 'Delivered'), (56, 27, '2025-04-20', 'Delivered'), (57, 5, '2025-09-26', 'Delivered'), (58, 22, '2025-06-12', 'Delivered'), (59, 12, '2025-08-05', 'Shipped'), (60, 7, '2025-09-19', 'Delivered'),
(61, 3, '2025-10-08', 'Delivered'), (62, 15, '2025-02-06', 'Delivered'), (63, 21, '2025-03-30', 'Delivered'), (64, 8, '2025-06-24', 'Delivered'), (65, 23, '2025-05-29', 'Delivered'), (66, 30, '2025-07-08', 'Delivered'), (67, 19, '2025-08-29', 'Delivered'), (68, 10, '2025-09-07', 'Delivered'), (69, 26, '2025-03-21', 'Delivered'), (70, 24, '2025-08-16', 'Delivered'),
(71, 13, '2025-07-18', 'Delivered'), (72, 17, '2025-10-04', 'Delivered'), (73, 6, '2025-05-26', 'Delivered'), (74, 29, '2025-02-22', 'Delivered'), (75, 2, '2025-08-09', 'Delivered'), (76, 14, '2025-06-29', 'Delivered'), (77, 25, '2025-09-02', 'Delivered'), (78, 4, '2025-07-06', 'Delivered'), (79, 9, '2025-05-17', 'Delivered'), (80, 18, '2025-10-09', 'Delivered'),
(81, 5, '2025-04-12', 'Delivered'), (82, 11, '2025-09-16', 'Delivered'), (83, 20, '2025-06-02', 'Delivered'), (84, 7, '2025-07-25', 'Delivered'), (85, 27, '2025-10-11', 'Delivered'), (86, 12, '2025-05-09', 'Delivered'), (87, 16, '2025-08-27', 'Delivered'), (88, 22, '2025-04-25', 'Delivered'), (89, 23, '2025-03-15', 'Delivered'), (90, 1, '2025-09-09', 'Delivered'),
(91, 28, '2025-06-18', 'Delivered'), (92, 26, '2025-08-03', 'Delivered'), (93, 13, '2025-09-29', 'Delivered'), (94, 10, '2025-05-21', 'Delivered'), (95, 3, '2025-07-12', 'Delivered'), (96, 24, '2025-02-11', 'Delivered'), (97, 19, '2025-06-11', 'Delivered'), (98, 30, '2025-09-21', 'Delivered'), (99, 15, '2025-08-12', 'Delivered'), (100, 21, '2025-04-06', 'Delivered'),
(101, 4, '2025-10-02', 'Delivered'), (102, 29, '2025-03-27', 'Delivered'), (103, 17, '2025-07-19', 'Delivered'), (104, 6, '2025-09-13', 'Delivered'), (105, 8, '2025-02-25', 'Delivered'), (106, 14, '2025-05-16', 'Delivered'), (107, 20, '2025-08-31', 'Delivered'), (108, 2, '2025-06-05', 'Delivered'), (109, 25, '2025-09-24', 'Delivered'), (110, 27, '2025-04-17', 'Delivered'),
(111, 12, '2025-10-07', 'Delivered'), (112, 7, '2025-03-13', 'Delivered'), (113, 18, '2025-08-06', 'Delivered'), (114, 5, '2025-07-03', 'Delivered'), (115, 23, '2025-09-06', 'Delivered'), (116, 11, '2025-06-16', 'Delivered'), (117, 22, '2025-10-05', 'Delivered'), (118, 30, '2025-05-23', 'Delivered'), (119, 9, '2025-08-21', 'Cancelled'), (120, 26, '2025-07-31', 'Delivered');

-- Order item rows are intentionally loaded in a separate file for readability.
COMMIT;
