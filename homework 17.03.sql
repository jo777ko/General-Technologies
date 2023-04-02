CREATE DATABASE shop;

USE shop;

CREATE TABLE SELLERS(
       SELL_ID    INTEGER, 
       SNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       COMM    NUMERIC(2, 2),
             BOSS_ID  INTEGER
);
                                            
CREATE TABLE CUSTOMERS(
       CUST_ID    INTEGER, 
       CNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       RATING  INTEGER
);

CREATE TABLE ORDERS(
       ORDER_ID  INTEGER, 
       AMT     NUMERIC(7,2), 
       ODATE   DATE, 
       CUST_ID    INTEGER,
       SELL_ID    INTEGER 
);

INSERT INTO SELLERS VALUES(201,'Олег','Москва',0.12,202);
INSERT INTO SELLERS VALUES(202,'Лев','Сочи',0.13,204);
INSERT INTO SELLERS VALUES(203,'Арсений','Владимир',0.10,204);
INSERT INTO SELLERS VALUES(204,'Екатерина','Москва',0.11,205);
INSERT INTO SELLERS VALUES(205,'Леонид ','Казань',0.15,NULL);


INSERT INTO CUSTOMERS VALUES(301,'Андрей','Москва',100);
INSERT INTO CUSTOMERS VALUES(302,'Михаил','Тула',200);
INSERT INTO CUSTOMERS VALUES(303,'Иван','Сочи',200);
INSERT INTO CUSTOMERS VALUES(304,'Дмитрий','Ярославль',300);
INSERT INTO CUSTOMERS VALUES(305,'Руслан','Москва',100);
INSERT INTO CUSTOMERS VALUES(306,'Артём','Тула',100);
INSERT INTO CUSTOMERS VALUES(307,'Юлия','Сочи',300);


INSERT INTO ORDERS VALUES(101,18.69,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(102,5900.1,'2022-03-10',307,204);
INSERT INTO ORDERS VALUES(103,767.19,'2022-03-10',301,201);
INSERT INTO ORDERS VALUES(104,5160.45,'2022-03-10',303,202);
INSERT INTO ORDERS VALUES(105,1098.16,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(106,75.75,'2022-04-10',304,202); 
INSERT INTO ORDERS VALUES(107,4723,'2022-05-10',306,201);
INSERT INTO ORDERS VALUES(108,1713.23,'2022-04-10',302,203);
INSERT INTO ORDERS VALUES(109,1309.95,'2022-06-10',304,203);
INSERT INTO ORDERS VALUES(110,9891.88,'2022-06-10',306,201);

select * from customers;

select * from sellers;

select * from orders;

/*1*/

select t1.SNAME as name, t2.SNAME as boss_name
from sellers t1
left join sellers t2
ON t1.BOSS_ID = t2.SELL_ID;

/*2*/

select t1.cname, t2.amt
from customers t1
inner join orders t2
on t1.cust_id = t2.cust_id and t2.amt > 1000;

/*3*/

select t3.cname, t4.sname
from (
		select t1.cname, t1.city, t2.sell_id
		from customers t1
		inner join orders t2
		on t1.cust_id = t2.cust_id) t3
inner join sellers t4
on t3.sell_id = t4.sell_id and t3.city != t4.city;

/*4*/

select t1.SNAME, (t2.comm - t1.comm) as dif
from sellers t1
left join sellers t2
ON t1.BOSS_ID = t2.SELL_ID;

/*5*/

select t4.sname, t3.cname, t3.city
from (
		select t1.cname, t1.city, t2.sell_id
		from customers t1
		inner join orders t2
		on t1.cust_id = t2.cust_id) t3
inner join sellers t4
on t3.sell_id = t4.sell_id and t3.city = t4.city;

/* * */

select t1.cname, t2.order_id as orderid
from customers t1
left join orders t2
on t1.cust_id = t2.cust_id
union
select t1.cname, t2.order_id as orderid
from customers t1
right join orders t2
on t1.cust_id = t2.cust_id;
