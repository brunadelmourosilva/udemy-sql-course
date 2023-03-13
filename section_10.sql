use book_shop;

CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

-- ------------------------------------------------------------------

-- CURRENT TIME
SELECT CURTIME();
 
SELECT CURDATE();
 
SELECT NOW();

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

-- DATE FUNCTIONS
SELECT 
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM people;
 
SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;

-- TIME FUNCTIONS
SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime)
FROM people;

-- FORMATTING DATES
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %D') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;
 
SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

-- DATE MATH

-- TIMESTAMPS CREATE/UPDATE
create table captions(text varchar(150), created_at timestamp default current_timestamp, updated_at timestamp on update current_timestamp);	

insert into captions (text) values ('i love life!');
select * from captions;
update captions set text='i love life updated!!!' where id = 1;

-- EXERCISES

-- CHAR TYPE IS A GOOD USE FOR FIXED LENGTHS. FOR EXAMPLE, TO INSERT COUNTRIES ACRONYMS, THE BEST WAY WOULD BE USE CHAR.

-- DIFFERENCE BETWWEEN DATETIME AND TIMESTAMP: TIMESTAMP IS MORE MEMORY EFFICIENT AND STORE A MUCH SMALLER RANGE OF DATES. 
--  TIMESTAMP ALSO TAKES UP LESS SPACE.
-- TIMESTAMP IS USED FOR THINGS LIKE META-DATA ACOUNT WHEN SOMETHING IS CREATED OR UPDATED.
-- OTHERWISE THEY BOTH STORES DATES AND TIMES TOGHETER.

select current_time(); -- or curtime()

select current_date(); -- or curdate()

select dayofweek(curdate());

select dayname(curdate());

select date_format(curdate(), '%m/%d/%Y');

SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT current_timestamp -- or now()
);

INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');

SELECT * FROM tweets;
