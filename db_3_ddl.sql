create database myShop;
use myShop;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(50),
    Price DECIMAL(10, 2),
    Description TEXT
);

ALTER TABLE Customers
ADD Address VARCHAR(100);

CREATE INDEX idx_email ON Customers(Email);

DROP TABLE Products;