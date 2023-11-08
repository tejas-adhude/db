-- creating database
CREATE DATABASE LibraryDatabase;
USE LibraryDatabase;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    ISBN VARCHAR(20),
    AvailableCopies INT
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(100)
);

CREATE TABLE BookLoans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

--using DMl queries
-- Inserting books data
INSERT INTO Books (BookID, Title, AuthorID, ISBN, AvailableCopies) 
VALUES (1, 'Book Title 1', 1, 'ISBN123456', 5);

-- Inserting authors data
INSERT INTO Authors (AuthorID, AuthorName) 
VALUES (1, 'Author Name 1');

-- Inserting members data
INSERT INTO Members (MemberID, MemberName) 
VALUES (1, 'Member Name 1');

-- Inserting book loans data
INSERT INTO BookLoans (LoanID, BookID, MemberID, LoanDate, ReturnDate) 
VALUES (1, 1, 1, '2023-11-01', '2023-11-15');

-- Update the number of available copies of a book after it's borrowed
UPDATE Books 
SET AvailableCopies = AvailableCopies - 1 
WHERE BookID = 1;

-- Delete a book entry
DELETE FROM Books 
WHERE BookID = 1;

-- Retrieve all books with their authors
SELECT Books.Title, Authors.AuthorName
FROM Books
INNER JOIN Authors ON Books.AuthorID = Authors.AuthorID;

-- Retrieve books that are currently available
SELECT * 
FROM Books 
WHERE AvailableCopies > 0;

-- Retrieve information about book loans along with member details
SELECT Books.Title, Members.MemberName, BookLoans.LoanDate, BookLoans.ReturnDate
FROM BookLoans
JOIN Books ON Books.BookID = BookLoans.BookID
JOIN Members ON Members.MemberID = BookLoans.MemberID;