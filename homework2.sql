create database homework;

use homework;

create table goods(
id int unique not null auto_increment,
title varchar(100),
quantity int check (quantity between 0 and 10)
);

insert into goods (title, quantity) values('велосипед', 4),
	('лыжи', 5), ('коньки', 7), ('скейт', 2);
    
alter table goods add price integer default 0;

select * from goods;

alter table goods modify price numeric(8,2);

update goods set price = 4.6 where id = 1;
update goods set price = 5.3 where id = 2;
update goods set price = 2.3 where id = 3;
update goods set price = 8.7 where id = 4;

select * from goods;

alter table goods modify price int;

select * from goods;

alter table goods change price item_price int;

alter table goods drop column item_price;

create view v_goods as
select * from goods
where quantity < 5;

select * from v_goods;

create table bachelors(
name varchar(50) not null,
last_name varchar(50) not null,
avg_rate int check(avg_rate between 0 and 5),
gender varchar(100) check(gender in ('M', 'F'))
);

insert into bachelors(name, last_name, avg_rate, gender) values('Liam', 'Liams', 4, 'M'),
	('Oliver', 'Olivers', 3, 'M'),
	('Olivia', 'Olivias', 4, 'F'),
    ('Noah', 'Noahs', 3, 'M'),
    ('Emma', 'Emmas', 2, 'F');
    
select * from bachelors;

alter table bachelors 
add id int primary key auto_increment;

alter table bachelors
modify column gender varchar(1);

alter table bachelors
change name firstname varchar(100);

select * from bachelors
where avg_rate >= 4;

select * from bachelors
where gender = 'F';

select * from bachelors
where avg_rate in (2,3);

create view v_women as
select * from bachelors
where gender = 'F';

select * from v_women;

select distinct avg_rate from bachelors;

