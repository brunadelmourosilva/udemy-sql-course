use book_shop;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
-- DISTINCT
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;

-- ORDER BY
SELECT * FROM books ORDER BY author_lname DESC;
SELECT * FROM books ORDER BY released_year;
SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY 2 desc;
SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY author_lname, author_fname;

-- LIMIT
SELECT title FROM books LIMIT 3;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 1,3; -- start in 1, retrieve 3 elements

-- LIKE
SELECT title, author_fname, author_lname, pages FROM books WHERE title LIKE '%:%';
SELECT * FROM books WHERE author_fname LIKE '____'; -- quantity of characters

-- To select books with '%' in their title:
SELECT * FROM books WHERE title LIKE '%\%%';
 
-- To select books with an underscore '_' in title:
SELECT * FROM books WHERE title LIKE '%\_%';

-- ----------------------------------------
-- EXERCISES

SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';