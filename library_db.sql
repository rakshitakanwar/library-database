CREATE DATABASE library_db;
USE library_db;

-- Authors Table
CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birth_year INT
);

-- Books Table
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    publication_year INT,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Members Table
CREATE TABLE members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    join_date DATE
);

-- Borrow Table (Many-to-Many between books and members)
CREATE TABLE borrow (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
SHOW TABLES;
DESCRIBE authors;
DESCRIBE books;
DESCRIBE members;
DESCRIBE borrow;
-- Insert into authors
INSERT INTO authors (name, birth_year) VALUES ('J.K. Rowling', 1965), ('George Orwell', 1903);

-- Insert into books
INSERT INTO books (title, publication_year, author_id) VALUES
('Harry Potter', 1997, 1),
('1984', 1949, 2);

-- Insert into members
INSERT INTO members (full_name, join_date) VALUES ('Alice Smith', '2022-01-10'), ('Bob Johnson', '2023-05-15');

-- Insert into borrow
INSERT INTO borrow (book_id, member_id, borrow_date, return_date) VALUES (1, 1, '2023-06-01', '2023-06-10');

