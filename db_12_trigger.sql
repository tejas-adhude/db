CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

-- Creating the 'orders' table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    quantity INT,
    total_amount DECIMAL(10, 2)
);

-- Creating a BEFORE INSERT trigger
DELIMITER //

CREATE TRIGGER before_insert_order
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    -- Ensure total amount is calculated before inserting
    SET NEW.total_amount = NEW.quantity * 10; -- For example, $10 per item
END;
//
DELIMITER ;

-- Creating an AFTER UPDATE trigger
DELIMITER //

CREATE TRIGGER after_update_order
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    -- Logging the change
    INSERT INTO orders_log (order_id, action, action_timestamp)
    VALUES (OLD.order_id, 'Updated', NOW());
END;
//
DELIMITER ;

-- Inserting data to test the BEFORE INSERT trigger
INSERT INTO orders (product_name, quantity) VALUES ('Product A', 5);

-- Updating data to test the AFTER UPDATE trigger
UPDATE orders SET quantity = 10 WHERE order_id = 1;
