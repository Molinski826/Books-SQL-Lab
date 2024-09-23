CREATE TABLE member (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(40),
  card_number CHAR(10)
);

CREATE TABLE book (
  id INT IDENTITY(1,1) PRIMARY KEY,
  title NVARCHAR(60),
  author NVARCHAR(60),
  checked_out_by_id INT,
  FOREIGN KEY (checked_out_by_id) REFERENCES member(id)
);

INSERT INTO member (name, card_number) VALUES ('Annabelle Aster', '772-93-110');
INSERT INTO member (name, card_number) VALUES ('Boris Berceli', '000-00-000');
INSERT INTO member (name, card_number) VALUES ('Carter Corbin', '282-09-382');


INSERT INTO book (title, author, checked_out_by_id) VALUES ('In Search of Lost Time', 'Marcel Proust', 1);
INSERT INTO book (title, author, checked_out_by_id) VALUES ('Ulysses', 'James Joyce', 1);
INSERT INTO book (title, author, checked_out_by_id) VALUES ('Don Quixote', 'Miguel de Cervantes', 3);
INSERT INTO book (title, author) VALUES ('Moby Dick', 'Herman Melville');


UPDATE member SET card_number = '357-15-964' WHERE id = 2;
DELETE FROM member WHERE id = 2;
SELECT * FROM member WHERE card_number = '772-93-110';
SELECT * FROM book ORDER BY title;
UPDATE book SET checked_out_by_id = 1 WHERE title = 'Moby Dick';
UPDATE book SET checked_out_by_id = NULL WHERE title = 'Ulysses';
SELECT book.title, member.name AS checked_out_by
FROM book
LEFT JOIN member ON book.checked_out_by_id = member.id;
SELECT book.title
FROM book
JOIN member ON book.checked_out_by_id = member.id
WHERE member.name = 'Annabelle Aster';
SELECT member.name, member.card_number
FROM book
JOIN member ON book.checked_out_by_id = member.id
WHERE book.author = 'Herman Melville';