create database bankSys;
use bankSys;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(15, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(15, 2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

INSERT INTO Customers (customer_id, first_name, last_name, email, phone)
VALUES
    (1, 'Rahul', 'Sharma', 'rahulsharma@email.com', '123-456-7890'),
    (2, 'Priya', 'Patel', 'priyapatel@email.com', '987-654-3210'),
    (3, 'Ananya', 'Singh', 'ananyasingh@email.com', '111-222-3333'),
    (4, 'Aarav', 'Gupta', 'aaravgupta@email.com', '444-555-6666'),
    (5, 'Isha', 'Verma', 'ishaverma@email.com', '777-888-9999');

INSERT INTO Accounts (account_id, customer_id, account_type, balance)
VALUES
    (101, 1, 'savings', 5000.00),
    (102, 2, 'checking', 2500.00),
    (103, 3, 'savings', 10000.00),
    (104, 4, 'checking', 750.00),
    (105, 5, 'savings', 3000.00);

INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
    (1001, 101, 'deposit', 1000.00, '2023-01-15'),
    (1002, 102, 'withdrawal', 500.00, '2023-02-20'),
    (1003, 103, 'deposit', 1500.00, '2023-03-10'),
    (1004, 104, 'withdrawal', 200.00, '2023-04-05'),
    (1005, 105, 'deposit', 800.00, '2023-05-12');
