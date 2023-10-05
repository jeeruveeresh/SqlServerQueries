CREATE TABLE tab_1 (
ID int NOT NULL,
NAME varchar(50),
salary float(50),
active_exp bit
);

INSERT INTO tab_1
values
(1,'sunny',300.99,0),
(2,'aswini',400.99,1),
(3,'keziya',500.99,0),
(4,'raj',600.99,1),
(5,'abhi',900.99,0);

INSERT INTO tab_1
values
(6,'sny',300.99,0),
(7,'sam',400.99,1);

CREATE TABLE tab_2 (
ID int NOT NULL,
locations varchar(50),
revenue float(50),
active bit
);

INSERT INTO tab_2
values
(1,'hyd',30.5,0),
(2,'delhi',50.99,1),
(3,'bangalore',70.99,0),
(4,'mumbai',100.99,1),
(5,'chennai',500.99,0);

INSERT INTO tab_2
values
(10,'AP',440.5,1),
(11,'KA',660.99,0),
(12,'UP',710.99,1);

select 
NAME,locations,salary,active
from 
tab_1 inner join tab_2 on tab_1.id = tab_2.id;

select 
NAME,locations,salary,active
from 
tab_1 left join tab_2 on tab_1.id = tab_2.id;

select 
NAME,locations,salary,active
from 
tab_1 right join tab_2 on tab_1.id = tab_2.id;

select 
count(*) as records
from  tab_2;

create table tab_3(
id int not null,
revenue int
);

insert into  tab_3 
values 
(101,98.9),
(102,85.2),
(103,90),
(104,80.5),
(125,100),
(106,98.9);

select * from tab_3

alter table tab_3 
add location varchar(200);

update tab_3 
set location= 'ban'
where id = 105;

select * from tab_3

select 
sum(revenue) as hyd_sum
from 
tab_3
where 
location = 'hyd';

select 
max(revenue) as ban
from 
tab_3;
where 
location = 'ban';

select 
avg(revenue) as average
from 
tab_3
where 
location = 'mum';

select 
location,
sum(revenue) 
from tab_3
group by location 
having sum(revenue)  > 100;

select 
count(*),
location
from tab_3 
group by location
having count(*) > 2;

select * from tab_1

exec sp_rename 'tab_3.location',


select 
top 3 salary
from tab_1
order by salary  asc

create table salary (
id int,
salary int);

insert  into salary 
values 
(1,1000),
(2,2000),
(3,3000),
(4,4000),
(5,5000),
(6,6000),
(7,7000),
(8,8000);

select * from salary

select top 1 salary from
(
select top 3 salary from salary 
order by salary desc
) as a;
---order by salary desc;

select 
salary select salary from(
select *,row_number() 
over(order by salary desc)
as salary_number 
from salary) as salary
where salary_number = 7; 
from 
salary 
order by salary  desc
offset 6 rows fetch next 1 rows only;


select * from tab_trig

select salary tab_trig 
(
select *, 
dense_rank() over (order by salary desc) as ranking 
from salary 
) a
where ranking = 3;


CREATE TABLE duplicate
(
id int,
names varchar(200),
age int
)

insert into duplicate 
values 
(1,'sam',20),
(1,'sny',10),
(4,'hitman',40),
(2,'sam',20),
(6,'veeru',25),
(2,'sny',30),
(3,'sam',20),
(4,'hitman',40),
(4,'dhoni',50),
(5,'kishan',30),
(6,'veeru',25);

select * from duplicate

select * from
(
select *, row_number() over (partition by id,names,age order by names) as row_num 
from duplicate 
) as k
where row_num = 1

SELECT SUBSTRING('SUBSTRING IN SQL Server', 4, 13) AS result;  

select * from names

