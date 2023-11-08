CREATE DATABASE company;
USE company;

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (name, department, salary) VALUES
('Rahul Gupta', 'Sales', 50000.00),
('Priya Sharma', 'Marketing', 60000.00),
('Aarav Kumar', 'IT', 75000.00),
('Isha Verma', 'HR', 55000.00);

DELIMITER //
CREATE PROCEDURE fetch_employees()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_name VARCHAR(50);
    DECLARE emp_salary DECIMAL(10, 2);
    DECLARE cur CURSOR FOR SELECT name, salary FROM employees;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO emp_name, emp_salary;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Displaying employee information
        SELECT CONCAT('Employee: ', emp_name, ' - Salary: ', emp_salary);
    END LOOP;

    CLOSE cur;
END //
DELIMITER ;

-- Call the procedure
CALL fetch_employees();
