use book_shop;
desc books;

-- CONCAT
select concat(author_fname, ' ', author_lname) as author_name from books;
select concat_ws(' - ', title, author_fname) as title_author_name from books;

-- SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4);
SELECT SUBSTRING('Hello World', 7);
SELECT SUBSTRING('Hello World', -3);
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;

-- COMBINING FUNCTIONS
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS 'short title'
FROM
    books; -- formatting SQL - vassoura
select concat(substr(author_fname, 1, 1), '.', substr(author_lname, 1, 1), '.') as author_initials from books;

-- REPLACE
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');
SELECT REPLACE(title, 'e ', '3') FROM books;
SELECT REPLACE(title, ' ', '-') FROM books;

-- REVERSE
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- CHAR LENGTH
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

-- UPPER AND LOWER
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;

-- OTHER STRING FUNCTIONS
SELECT INSERT('Hello Bobby', 6, 0, 'There'); 
 
SELECT LEFT('omghahalol!', 3);
SELECT RIGHT('omghahalol!', 4);
SELECT REPEAT('ha', 4);
SELECT TRIM('  pickle  ');
SELECT TRIM(LEADING '.' FROM '....pickle');

-- ----------------------------------------
-- EXERCISES
SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

SELECT REPLACE(title, ' ', '->') as title FROM books;

SELECT  author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;
    
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;

 
SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;
 
SELECT title, CHAR_LENGTH(title) AS character_count FROM books;
 
SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;