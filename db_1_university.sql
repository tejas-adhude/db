CREATE DATABASE university;
USE university;

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(100)
);

INSERT INTO department (department_id, name, location)
VALUES 
(1, 'Computer Vigyan', 'Vigyan Bhavan'),
(2, 'Ganit', 'Ganit Bhavan'), 
(3, 'Bhautiki', 'Bhautiki Bhavan'),
(4, 'Itihas', 'Kala Bhavan'),
(5, 'Jeev Vigyan', 'Vigyan Bhavan');

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO student (student_id, name, age, department_id)
VALUES 
(101, 'Rahul Kumar', 20, 1),
(102, 'Aarti Singh', 22, 2),
(103, 'Aditya Mishra', 21, 3),
(104, 'Manisha Gupta', 23, 4),
(105, 'Ananya Sharma', 20, 5),
(106, 'Deepak Verma', 22, 3),
(107, 'Isha Patel', 24, 4);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    name VARCHAR(100),
    credits INT
);

INSERT INTO Course (course_id, name, credits)
VALUES 
(201, 'Computer Vigyan ki Prarambhikta', 4),
(202, 'Ganit I', 3),
(203, 'Vidyut Chumbakiya Prabandhan', 4),
(204, 'Vishwa Itihas', 3),
(205, 'Microbiology', 4),
(206, 'Kvantaan Yantra Vigyan', 5),
(207, 'Bharatiya Itihas', 3);
