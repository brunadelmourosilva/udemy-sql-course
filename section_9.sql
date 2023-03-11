use book_shop;

-- COUNT
SELECT COUNT(*) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;

-- GROUP BY
SELECT 
    author_lname, COUNT(*) AS books_written FROM books
GROUP BY author_lname
ORDER BY books_written DESC;

-- TODO: VISUALIZAR FORMA DE MULTIPLOS GROUP BY PARA VARIOS CAMPOS
SELECT 
    author_lname, released_year AS books_written FROM books
GROUP BY author_lname, released_year
ORDER BY books_written DESC;

-- MIN/MAX
SELECT MAX(pages) FROM books;
SELECT MIN(author_lname) FROM books;

-- SUBQUERIES
SELECT title, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT title, released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);

-- GROUPING BY MULTIPLE COLUMNS(aparece pelas colunas agrupadas em comum a mesma row)
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*) FROM books GROUP BY author;

-- MIN/MAX WITH GROUP BY
SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;
SELECT 
	author_lname, 
        author_fname,
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release
FROM books GROUP BY author_lname, author_fname;

-- SUM  
SELECT author_lname, COUNT(*), SUM(pages) FROM books GROUP BY author_lname;

-- AVG
SELECT released_year, AVG(stock_quantity), COUNT(*) FROM books GROUP BY released_year;

-- EXERCISES
select COUNT(*) from books;

select released_year, COUNT(*) from books group by released_year order by released_year desc;

select SUM(stock_quantity) from books;

select CONCAT(author_fname, ' ', author_lname) AS author, AVG(released_year), COUNT(*) FROM books group by author;
select author_fname, author_lname, AVG(released_year), COUNT(*) FROM books group by author_fname, author_lname; -- same the line above

select CONCAT(author_fname, ' ', author_lname) as author, pages from books where pages = (select MAX(pages) from books);

 -- quantity of published books for each year, counting how many times the year appears in each row
select released_year as year, 
COUNT(*) as '# books', 
AVG(pages) as 'avg pages' 
from books
group by released_year 
order by released_year asc;


