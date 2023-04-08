
-- create a view
create view full_reviews as
select title, released_year, genre, rating, first_name, last_name
from reviews r 
join reviewers r2 on r2.id = r.reviewers_id 
join series s on s.id = r.series_id 

-- now we can treat that view as a virtual table
-- (AT LEAST WHEN IT COMES TO SELECTING)
SELECT * FROM full_reviews;
select genre, avg(rating) from full_reviews fr
group by genre


-- updatable/insertable views
-- views is not updatable if it contains any of the following:
-- aggregate functions or window functions(sum, min, avg, max, count)
-- distinct, group by, having, union/all, subquery
-- ...
create view ordered_series as
select * from series s order by s.released_year

select * from ordered_series

-- replacing/altering views
create or replace view ordered_series as
select * from series s order by s.released_year desc

alter view ordered_series as
select * from series order by released_year

drop view ordered_series 

-- HAVING CLAUSE
select title, avg(rating) as rating_avg
from full_reviews fr 
group by title
having rating_avg > 5

-- WITH ROLLUP: it's the media of the entire table
select title, avg(rating)
from full_reviews fr 
group by title
with rollup

select title, count(rating) as rating_count
from full_reviews fr 
group by title
with rollup
 

-- the behavior of multiple group by works with each group, and not the entire table 
select first_name, released_year, genre, AVG(rating)
from full_reviews
group by released_year, genre, first_name with rollup


-- SQL MODES
select @@global.sql_mode

select @@session.sql_mode

SET GLOBAL sql_mode = 'modes'

SET SESSION sql_mode = 'modes'


-- SQL MODES - STRICT_TRANS_TABLES
-- avoid that the transaction can be stopped, setting some condition to avoid an error.













