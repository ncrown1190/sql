--1. Create both tables.

CREATE TABLE book (
  id INT PRIMARY KEY IDENTITY(1,1),
  title NVARCHAR(60),
  author NVARCHAR(60),
  checked_out_by_id INT);

  CREATE TABLE member (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(40),
  card_number CHAR(10));

  --2.Add the following rows to the member table
 INSERT INTO member (name, card_number) 
 VALUES 
 ('Annabelle Aster', '772-93-110'),
 ('Boris Berceli', '000-00-000'),
 ('Carter Corbin', '282-09-382');

 select * from member

 -- 3. Add the following rows to the book table
 INSERT INTO book (title, author, checked_out_by_id) 
 VALUES 
 ('In Search of Lost Time', 'Marcel Proust', 1),
 ('Ulysses', 'James Joyce', 1),
 ('Don Quixote', 'Miguel de Cervantes', 3);
 INSERT INTO book (title, author) 
 VALUES ('Moby Dick', 'Herman Melville');

 select * from book

 --4. Update the member with the id of 2 to have a card number of “357-15-964”.
 UPDATE member 
 SET card_number = '357-15-964' 
 WHERE id = 2;

 select * from member

 --5 Remove the member with the id of 2.
 DELETE FROM member 
 WHERE id = 2;

 --6. Select all members that have the card number 772-93-110.
 SELECT * FROM member 
 WHERE card_number = '772-93-110';

 select * from book;

 --7. Select all books sorted by title
 SELECT * FROM book ORDER BY title;

 --8.Annabelle checked out another book… Update Moby Dick to be checked out by Annabelle
 UPDATE book 
 SET checked_out_by_id = 1 
 WHERE title = 'Moby Dick';

 --9. Annabelle turned in a book… Update Ulysses to be checked out by no one (null).
 UPDATE book 
 SET checked_out_by_id = NULL 
 WHERE title = 'Ulysses';

 --10. Write a JOIN that lists all the books and who they’re checked out to. 
 --Include the books that are not checked out.
  SELECT * FROM book
 Left Join member ON
 book.checked_out_by_id = member.id;

 --11. Write a JOIN that lists the titles of all the books that are checked out 
 -- to someone named Annabelle Aster (don't just use the ID)
 SELECT book.title 
 FROM book JOIN member 
 ON book.checked_out_by_id = member.id 
 WHERE member.name = 'Annabelle Aster';

 --12. Write a JOIN that lists the name and card number of all members 
 --who have checked out books by the author Herman Melville.
 SELECT name, card_number from member
 LEFT JOIN book
 ON member.id = book.checked_out_by_id
 WHERE book.author = 'Herman Melville';

 --       OR

 SELECT member.name, member.card_number 
 FROM book  JOIN member 
 ON book.checked_out_by_id = member.id 
 WHERE book.author = 'Herman Melville';