-- NOT EQUALS
use book_shop;
SELECT * FROM books WHERE released_year != 2017;

-- BETWEEN
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2014;

-- IN
SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

-- CASE
SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit' 
END AS genre
FROM books;

SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
    
-- --------------------------------------------------------------

-- EXERCISES

-- 0
select 10 != 10;

-- 

--

select * from books where released_year < 1980;

select * from books as b where b.author_lname in ('Eggers', 'Chabon');

select * from books b where b.author_lname = 'Lahiri' and b.released_year > 2000;

select * from books where pages between 100 AND 200;

select title, author_lname,
case 
	when title like '%stories%' then 'Short Stories'
    when title like '%just kids%' then 'Memior'
    when title like '%a heartbreaking work%' then 'Memior'
    else 'Novel'
    end as TYPE
from books;

select author_fname, author_lname, concat(count(*), ' books')
from books
group by author_fname, author_lname;

    
    