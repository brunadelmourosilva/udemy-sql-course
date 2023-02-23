drop table people;

CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id));
    
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

select name from cats where name like '%i%';
select cat_id from cats;
select name, breed from cats;
select name, age from cats where breed like 'Tabby';
select cat_id, age from cats where cat_id = age;

-- ----------------------------------------------------
-- ALIASES
select cat_id as alias_id from cats;

-- ----------------------------------------------------
-- UPDATE
update cats set age = 5 where name = 'Egg';
update cats set name = 'Jack' where name like 'Jackson';
update cats set breed = 'British Shorthair' where name like 'Ringo';
update cats set age = 12 where breed like 'Maine Coon'; 

-- ----------------------------------------------------
-- DELETE
delete from cats where name like 'Egg';
delete from cats where age = 4;
delete from cats where cat_id = age;
delete from cats;