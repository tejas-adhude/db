create database myshop;
use myshop;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE Order_Details (
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Customers (customer_id, customer_name, email) VALUES
(1, 'Rahul Kumar', 'rahul@example.com'),
(2, 'Priya Sharma', 'priya@example.com');

INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2023-10-15', 250.00),
(102, 2, '2023-10-18', 150.00);

INSERT INTO Products (product_id, product_name, price) VALUES
(501, 'Product X', 50.00),
(502, 'Product Y', 30.00),
(503, 'Product Z', 25.00);

INSERT INTO Order_Details (order_id, product_id, quantity) VALUES
(101, 501, 2),
(101, 502, 3),
(102, 503, 5);

-- Retrieve customer's name, order ID, and total amount for each order:
SELECT c.customer_name, o.order_id, o.total_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

-- Retrieve the total amount spent by each customer:
SELECT c.customer_name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Get the product name, price, and quantity for each order:
SELECT p.product_name, p.price, od.quantity
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id;

-- Retrieve the customer's name and their most recent order date
SELECT c.customer_name, MAX(o.order_date) AS recent_order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Retrieve orders where the total amount exceeds the average total amount of all orders:
SELECT o.order_id, o.total_amount
FROM Orders o
WHERE o.total_amount > (SELECT AVG(total_amount) FROM Orders);
