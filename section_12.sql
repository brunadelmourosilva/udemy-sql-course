-- UNIQUE
CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
 
-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

-- CHECK
CREATE TABLE users(
username varchar(20) not null,
age int CHECK (age > 0)
);

insert into user(username, age) values('bruna', -2);

-- NAMED CONSTRAINTS
create table dono(
	id integer,
    nome varchar(255),
    constraint primaryKey primary key(id),
    constraint nomeMin20Chars CHECK (length(nome) >= 20)
);

create table cachorro(
	id integer primary key,
    nome varchar(255),
    dono_id integer,
    constraint DonoIdReferenciaOutraTabela foreign key(dono_id) references dono(id)
);

CREATE TABLE contactsConstraint (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    CONSTRAINT uniqueValue UNIQUE (phone)
);

CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

-- ALTER TABLE -- add columns 
create table companies(
name varchar(15)
)

insert into companies (name) values ('CI&T'), ('SUPERA')

ALTER TABLE companies ADD COLUMN phone VARCHAR(15)

alter table companies add column employee_count int not null default 1

-- ALTER TABLE -- drop columns 

alter table companies drop column phone

-- ALTER TABLE -- renaming tables

rename table companies to suppliers

alter table suppliers rename to companies

-- ALTER TABLE -- renaming columns

alter table companies rename column name to company_name

-- ALTER TABLE - modifying columns 

ALTER TABLE companies MODIFY company_name VARCHAR(100) DEFAULT 'unknown'

ALTER TABLE companies CHANGE company_name biz_name VARCHAR(50)

-- ALTER TABLE - constraints

ALTER TABLE houses ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0)

ALTER TABLE houses DROP CONSTRAINT positive_pprice


