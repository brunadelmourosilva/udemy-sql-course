
create database shop;

-- FOREIGN KEY

CREATE TABLE customers(
id INT PRIMARY KEY auto_increment,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(20)
)

create table orders(
id int primary key auto_increment,
order_date date,
amount decimal(8, 2),
customer_id int,
foreign key (customer_id) references customers(id)
)

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
      
-- INNER JOIN
      
select * from customers c 
join orders o on o.customer_id = c.id

-- INNER JOIN WITH GROUP BY
-- gets the common values between the two tables

select c.first_name, c.last_name, sum(amount) as total from customers c 
	join orders o on o.customer_id = c.id 
	group by c.first_name , c.last_name 
	order by total
	
-- LEFT JOIN
-- gets all the values from the left table and also, the values 
-- from the right side, regardless if there are relation or not.
-- select all the customers
select first_name, last_name, order_date, amount
from customers c 
left join orders o 
on o.customer_id = c.id 

select first_name, last_name, order_date, amount
from orders o
left join customers c 
on o.customer_id = c.id 

select first_name, last_name, ifnull(sum(amount), 0) as money_spent
from customers c
left join orders o
on o.customer_id = c.id 
group by first_name, last_name
	
-- RIGHT JOIN
-- gets all the values from the right table and also, the values 
-- from the left side, regardless if there are relation or not.
-- select all the orders
insert into orders (amount, order_date) values (100, now())

SELECT 
    first_name, last_name, order_date, amount
FROM
    customers
        RIGHT JOIN
    orders ON customers.id = orders.customer_id	
    
-- ON DELETE CASCADE
desc orders    

-- deleting constraint to refactor this
alter table orders drop foreign key orders_ibfk_1

-- creating a new constraint
alter table orders add foreign key (customer_id) references customers(id) on delete cascade

select * from orders

select * from customers
	
delete from customers where id = 5	

-- https://5balloons.info/alter-table-to-remove-foreign-key-or-add-delete-cascade-mysql

-- EXERCICES

create database school

use school

create table students(
	id int primary key auto_increment not null,
	first_name varchar(10)
)

desc students

create table papers(
	title varchar(20),
	grade int,
	student_id int,
	foreign key (student_id) references students(id) on delete cascade
)

desc papers

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

insert into papers(student_id) values (199)

-- inner join

select first_name, title, grade from students s 
join papers p on p.student_id = s.id 
order by grade desc
	
-- left join 
select first_name, title, grade from students s 
left join papers p on p.student_id = s.id 
	
select first_name, ifnull(title, "MISSING"), ifnull(grade, 0) from students s 
left join papers p on p.student_id = s.id

select first_name, ifnull(avg(grade) , 0) as average from students s 
left join papers p on p.student_id = s.id
group by first_name
order by average desc

select first_name, ifnull(avg(grade) , 0) as average,
case 
	when ifnull(avg(grade) , 0) >= 75 then "PASSING"
	else "FAILING"
end as passing_status
from students s 
left join papers p on p.student_id = s.id
group by first_name
order by average desc
	
	
	
	
	
	
	
	
	