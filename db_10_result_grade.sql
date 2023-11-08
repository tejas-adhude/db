-- Create the database
CREATE DATABASE IF NOT EXISTS SchoolDatabase;

-- Use the database
USE SchoolDatabase;

-- Create a table to store student information
CREATE TABLE Students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

-- Insert sample data into the Students table
INSERT INTO Students (name, marks) VALUES
    ('Student A', 85),
    ('Student B', 60),
    ('Student C', 45),
    ('Student D', 95),
    ('Student E', 75);

-- Create a function to convert marks to grades
-- Create a function to convert marks to grades
DELIMITER //
CREATE FUNCTION CalculateGrade(marks INT) RETURNS VARCHAR(10)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE grade VARCHAR(10);

    IF marks >= 90 THEN
        SET grade = 'A';
    ELSEIF marks >= 80 THEN
        SET grade = 'B';
    ELSEIF marks >= 70 THEN
        SET grade = 'C';
    ELSEIF marks >= 60 THEN
        SET grade = 'D';
    ELSE
        SET grade = 'F';
    END IF;

    RETURN grade;
END//
DELIMITER ;

-- Test the function by getting grades for students
SELECT name, marks, CalculateGrade(marks) AS grade FROM Students;
