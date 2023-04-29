use homework;

/*
Task 1
*/

create table if not exists Sales(
sale_id int,
product_id int,
user_id int,
quantity int
);

create table if not exists Product(
product_id int,
price int
);

insert into Sales (sale_id, product_id, user_id, quantity) values ('1', '1', '101', '10'),
																	('2', '2', '101', '1'),
																	('3', '3', '102', '3'),
																	('4', '3', '102', '2'),
																	('5', '2', '103', '3');

insert into Product (product_id, price) values ('1', '10'), ('2', '25'), ('3', '15');

select * from Sales;
select * from Product;

select t1.user_id, sum(total_price) as spending
from (select t2.user_id, t2.quantity * t3.price as total_price
			from Sales t2
			inner join Product t3
			on t2.product_id = t3.product_id) t1
group by t1.user_id;

/*
Task 2
*/

create table if not exists Prices(
product_id int,
start_date date,
end_date date,
price int
);

create table if not exists UnitsSold(
product_id int,
purchase_date date,
units int
);

insert into Prices (product_id, start_date, end_date, price) values ('1', '2019-02-17', '2019-02-28', '5'),
																	('1', '2019-03-01', '2019-03-22', '20'),
																	('2', '2019-02-01', '2019-02-20', '15'),
																	('2', '2019-02-21', '2019-03-31', '30');
                                                                    
insert into UnitsSold (product_id, purchase_date, units) values ('1', '2019-02-25', '100'), ('1', '2019-03-01', '15'),
																('2', '2019-02-10', '200'), ('2', '2019-03-22', '30');
                                                                    
select * from Prices;
select * from UnitsSold;

select t1.product_id, (t1.total_price + t2.total_price)/(t1.units + t2.units) as avg_total
from (select t3.product_id, (t3.price  * t4.units) as total_price, t4.units
		from (select * from Prices
				where  month(end_date) = 2) t3
		inner join (select * from UnitsSold
					where month(purchase_date) = 2) t4
		on t3.product_id = t4.product_id) t1
inner join (select t5.product_id, (t5.price  * t6.units) as total_price, t6.units 
			from (select * from Prices
					where  month(end_date) = 3) t5
			inner join (select * from UnitsSold
					where month(purchase_date) = 3) t6
			on t5.product_id = t6.product_id) t2
on t1.product_id = t2.product_id;

/*
Task 3
*/

create table if not exists Buses(
bus_id int, 
arrival_time int
);

create table if not exists Passengers(
passengers_id int, 
arrival_time int
);

insert into Buses (bus_id, arrival_time) values ('1', '2'), ('2', '4'), ('3', '7');

insert into Passengers (passengers_id, arrival_time) values ('11', '1'), ('12', '5'), ('13', '6'), ('14', '7');

select t4.bus_id, 
ifnull(passengerscnt, 0) as passengerscnt
from Buses t4
left join (select t3.bus_id, count(*) as passengerscnt
			from (select t1.bus_id, t2.passengers_id
					from Buses t1
					inner join  (SELECT passengers_id, 
								CASE
									WHEN arrival_time <= 2 
										THEN '1'
									WHEN arrival_time >= 4 
										THEN '3'
									ELSE '2'
								END AS bus_id
								FROM Passengers) t2
					on t1.bus_id = t2.bus_id) t3
			group by bus_id) t5
on t4.bus_id = t5.bus_id;
