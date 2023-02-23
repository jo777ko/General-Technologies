create database library;

use library;

create table readers (
id int,
first_name varchar(50),
last_name varchar(50),
age int,
actived varchar (50),
books int (100),
primary key (id)
);

create table reading_room_staff (
id int,
first_name varchar(50),
last_name varchar(50),
age int,
actived varchar (50),
salary int,
readers int,
primary key (id)
);

create table staff (
id int,
first_name varchar(50),
last_name varchar(50),
age int,
actived varchar (50),
salary int,
primary key (id)
);

insert into readers values(1, 'Liam', 'Liams', 21, 'act', 3),
	(2, 'Olivia', 'Olivias', 22, 'act', 4),
    (3, 'Noah', 'Noahs', 23, 'inact', 5),
    (4, 'Emma', 'Emmas', 24, 'inact', 6);
    
insert into reading_room_staff values(1, 'Oliver', 'Olivers', 25, 'act', 2000, 5),
	(2, 'Charlotte', 'Charlottes', 26, 'inact', 1800, 4),
    (3, 'Elijah', 'Elijahs', 27, 'act', 1600, 3),
    (4, 'Amelia', 'Amelias', 28, 'inact', 1400, 2);
    
insert into staff values(1, 'James', 'Jameses', 31, 'inact', 1500),
	(2, 'Ava', 'Avas', 32, 'act', 1600),
    (3, 'William', 'Williams', 33, 'act', 1400),
    (4, 'Sophia', 'Sophias', 34, 'inact', 1300);

select * from readers
where books > 0
and actived = ('inact');

select * from reading_room_staff
where salary > 1500
union 
select *, ' ' from staff
where salary > 1500
order by salary asc;

select concat(first_name, ' ', last_name) as FL, age, books, '0' as salary, '0' as readers, 'readers' as category from readers
where actived = 'act'
union
select concat(first_name, ' ', last_name) as FL, age, '0', salary, readers, 'reading_room_staff' as category from reading_room_staff
where actived = 'act'
union
select concat(first_name, ' ', last_name) as FL, age, '0', salary, '0', 'staff' as category from staff
where actived = 'act';




