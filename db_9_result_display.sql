-- Create the database
CREATE DATABASE IF NOT EXISTS student_database;

-- Use the created database
USE student_database;

-- Create a table to store student information
CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50),
    student_age INT,
    student_grade VARCHAR(10)
);

-- Insert some sample data into the students table with Indian names
INSERT INTO students (student_name, student_age, student_grade) VALUES
('Aditi', 20, 'A'),
('Rohan', 21, 'B'),
('Aarav', 19, 'C'),
('Dia', 22, 'A');

-- Create a stored procedure to display student information
DELIMITER //

CREATE PROCEDURE GetStudentInformation()
BEGIN
    SELECT * FROM students;
END//

DELIMITER ;

-- Call the stored procedure to display student information
CALL GetStudentInformation();
