crete database viewDemo
use viewDemo

-- Creating tables
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Inserting sample data
INSERT INTO Authors (author_id, author_name) VALUES
(1, 'Author A'),
(2, 'Author B'),
(3, 'Author C');

INSERT INTO Books (book_id, book_title, author_id) VALUES
(101, 'Book 1', 1),
(102, 'Book 2', 1),
(103, 'Book 3', 2),
(104, 'Book 4', 3);

--Query to fetch all books and their authors:
CREATE VIEW BookAuthors AS
SELECT b.book_title, a.author_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;

SELECT * FROM BookAuthors;

-- Query to count the number of books each author has written
SELECT author_id, author_name, (SELECT COUNT(*) FROM Books WHERE Books.author_id = Authors.author_id) AS book_count FROM Authors;

-- Query to get the details of authors who have written more than two books:
SELECT * FROM Authors 
WHERE author_id IN (
    SELECT author_id
    FROM Books
    GROUP BY author_id
    HAVING COUNT(*) > 2
);

--Query to display the books and their authors where the book title contains a specific word:
CREATE VIEW BookSearch AS
SELECT b.book_title, a.author_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id;

SELECT * FROM BookSearch
WHERE book_title LIKE '%specific_word%';

--Query to find authors who haven't written any books:
SELECT * FROM Authors
WHERE author_id NOT IN (SELECT author_id FROM Books);