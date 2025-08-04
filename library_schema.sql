
CREATE TABLE Authors (
    author_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    genre TEXT,
    author_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    join_date DATE
);

CREATE TABLE Borrow (
    borrow_id INTEGER PRIMARY KEY,
    book_id INTEGER,
    member_id INTEGER,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO Authors VALUES (1, 'J.K. Rowling'), (2, 'George Orwell');

INSERT INTO Books VALUES 
(1, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1),
(2, '1984', 'Dystopian', 2);

INSERT INTO Members VALUES 
(1, 'Alice Johnson', '2024-01-15'),
(2, 'Bob Smith', '2024-03-10');

INSERT INTO Borrow VALUES
(1, 1, 1, '2025-08-01', '2025-08-10'),
(2, 2, 2, '2025-08-02', NULL);

SELECT b.title, a.name AS author FROM Books b JOIN Authors a ON b.author_id = a.author_id;

SELECT m.name AS member, bk.title AS book, br.borrow_date, br.return_date
FROM Borrow br
JOIN Members m ON br.member_id = m.member_id
JOIN Books bk ON br.book_id = bk.book_id;

