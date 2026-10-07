-- BETTER DESIGN

-- Description: a library lends books to members. A member can borrow many books
-- A book can be borrowed many time, but only by one member at a time.
-- We want to know when a book borrowed, and when it was returned.

-- members 1---N loans N---1 books


CREATE TABLE members (
	member_id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT UNIQUE
);

CREATE TABLE books (
	book_id INTEGER PRIMARY KEY,
	title TEXT NOT NULL,
	author TEXT,
	year INTEGER
);

CREATE TABLE loans (
	loan_id INTEGER PRIMARY KEY,
	member_id INTEGER NOT NULL,
	book_id INTEGER NOT NULL,
	loan_date TEXT NOT NULL,
	return_date TEXT,
	FOREIGN KEY (member_id) REFERENCES members(member_id),
	FOREIGN KEY (book_id) REFERENCES books(book_id)
);


INSERT INTO members VALUES(1, 'Leo', 'leo@gmail.com'), (2, 'Mira', 'mira@gmail.com');
INSERT INTO books VALUES(1, 'The Hobbit', 'JRR Anderson', 1950), (2, 'Matilda', 'Mel Gibson', 1989);
INSERT INTO loans VALUES(1, 1, 2, '2026-10-01', '2026-10-06'), (2, 2, 2, '2026-10-07', NULL), (3, 1, 1, '2026-10-08', NULL);


SELECT * FROM loans WHERE return_date IS NULL;



















