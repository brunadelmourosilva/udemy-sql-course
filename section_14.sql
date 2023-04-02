

CREATE TABLE reviewers(
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL
)

CREATE TABLE series(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100),
	released_year YEAR,
	genre VARCHAR(100)
)

CREATE TABLE reviews(
	id INT PRIMARY KEY AUTO_INCREMENT,
	rating DECIMAL(2, 1),
	series_id INT,
	reviewers_id INT,
	FOREIGN KEY (series_id) REFERENCES series(id),
	FOREIGN KEY (reviewers_id) REFERENCES reviewers(id)
)

show tables

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

 
INSERT INTO reviews(series_id, reviewers_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

   
-- EXERCICES
   
 -- challenge 1
   select s.title, r.rating 
   from series s 
   join reviews r on r.series_id = s.id 
   
-- challenge 2
   select s.title, round(avg(r.rating), 2) as avg_rating
   from series s 
   join reviews r on r.series_id = s.id 
   group by s.title -- make the media of ratings by group of titles
   order by avg_rating asc
   
-- challenge 3
   select r.first_name, r.last_name, r2.rating 
   from reviewers r 
   join reviews r2 on r.id = r2.reviewers_id  
   
-- challenge 4
   select s.title as unreviewd_series from series s 
   left join reviews r on r.series_id = s.id 
   where r.rating is null
   
-- challenge 5
   select s.genre, avg(r.rating) as avg_rating
   from series s 
   join reviews r on s.id = r.series_id
   group by s.genre
   having avg_rating > 8
   
-- challenge 6
	select r.first_name, r.last_name, 
	count(r2.rating) as COUNT, 
	ifnull(min(r2.rating), 0) as MIN, 
	ifnull(max(r2.rating), 0) as MAX, 
	ifnull(round(avg(r2.rating), 5), 0) as AVG,
	case
		when count(r2.rating) > 0 then "ACTIVE"
		else "INACTIVE"
	end as STATUS
	from reviewers r 
	left join reviews r2 on r.id = r2.reviewers_id 
	group by r.first_name, r.last_name
   
   -- see the left join combination
   -- grouping by names
   -- making the count per ratings
   -- making the min/max ratings
   -- using the case statement to show the status by the count of ratings
	
-- challenge 7
	select s.title, r.rating, concat(r2.first_name, ' ', r2.last_name) as reviewer  
	from reviews r 
	join series s on s.id = r.series_id 
	join reviewers r2 on r2.id = r.reviewers_id 
	order by s.title 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   