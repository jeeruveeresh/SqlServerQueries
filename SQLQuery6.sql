CREATE TABLE veeru (
id int,
nm varchar(300),
salary int,
locationst varchar(300),
v_date date 
)

insert into veeru 
values 
(100,'AB',20000,'hyd','2020-09-23'),
(200,'BC',30000,'hyd','2020-08-23'),
(300,'CD',40000,'mum','2020-07-23'),
(400,'AB',30000,'mum','2021-01-23'),
(500,'DE',50000,'mum','2021-01-23'),
(100,'EF',20000,'hyd','2020-09-23');
insert into veeru 
values
(600,'AB',3000,'mum','2021-02-27'),
(700,'EF',3000,'mum','2021-03-27');


SELECT  datepart(weekday, v_date)
FROM
    veeru;

select * from veeru

select *,
row_number() over(partition by month(v_date)  order by v_date asc)  from veeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)

insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');

CREATE TABLE table_2 (
id int,
hours_logged int
)

insert into table_2 
values 
(1,10),
(2,20),
(3,30);

select * from table_1

select round((cast(FTE as float)/(FTE+Contractor))*100,2) as Hours_logged_by_FTE,
round((cast(Contractor as float)/(FTE+Contractor))*100,2) as Hours_logged_by_Contractor
from(
select * from(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p
) as pivot_table;

select
Round((cast(fte as float)/(fte + contractor))* 100,4) as h_logged_fte,
Round((cast(contractor as float)/( fte + contractor)) * 100,4) as h_logged_contractor
from
(
select * from 
(
select
table_1.type_emp,
sum(table_2.hours_logged) as hour_s
from table_1 inner join table_2 on table_1.id = table_2.id 
group by type_emp
) as temporary
pivot
(
sum(hour_s) for type_emp in (fte,contractor) 
) as p
) as h;

SELECT ROUND(5634.6334,2) as number ---Output(5634.6300)--- (4) represents how many numbers should be Round.

SELECT CONVERT(VARCHAR(30),GETDATE(),13); --- while 13 represents STYLE, how to get date format.

SELECT CONVERT(VARCHAR(250),'This is a really long piece of string') AS TestString ---convert to string

SELECT Test = CONVERT(DATE,'01/02/2021',123) -- US
UNION ALL
SELECT CONVERT(DATE,'01/02/2021',182);

SELECT CAST(5634.6334 as int) as number
SELECT FLOOR(5634.6334) as number

SELECT CAST('123' AS float) as cast_int;

SELECT CONVERT(INT,'123') as convert_int;

select datename(WEEKDAY,getdATE()) AS DATE_NAME

select datepart(WEEKDAY,'2012-02-23') AS DATE_PART

select * from table_2


select * from
(
select table_1.type_emp,
sum(table_2.hours_logged) as h_s
from table_1
inner join table_2 on table_1.id = table_2.id 
group by type_emp
) as temp
pivot 
(
sum(h_s) for type_emp in (fte,contractor)
) as pivot_tab


SELECT CURRENT_TIMESTAMP AS Date; --uses the CURRENT_TIMESTAMP() function to see the system's current date and time
                                  --without considering the timezone in the output

SELECT GETDATE() AS Date;         --uses the GETDATE() function to see the system's current date and time on which the SQL 
								  --Server is running

CREATE TABLE d_tab(
names varchar(20),
location varchar(30)
);


insert into d_tab 
values 
('ab','hyd'),
('bc','hyd'),
('cd','mum'),
('ab','hyd'),
('bc','hyd'),
('cd','che');

select * from d_tab


delete n from
(
select names,location,
row_number() over (partition by names,location order by names,location ) as row_num
from d_tab
) as n
where row_num > 1

CREATE TABLE s_j(
names varchar(20),
salary int
);

insert into s_j 
values 
('ab',1000),
('cd',2000),
('de',3000),
('ef',4000),
('fg',1000),
('gh',2000);

select * from s_j

select a.names from s_j as a
join s_j as b on
a.salary = b.salary and a.names <> b.names


select * --top 5 salary
from salary

select 
*, last_value(salary) over (order by rows unbounded preceding  and unbounded following

order by asc

create table tab (
empid int,
empnm varchar(20),
mgr_id int
)

insert into tab 
values 
(101,'ab',102),
(102,'bc',103),
(103,'cd',''),
(104,'de',102),
(105,'ef',101),
(106,'fg',103);

select * from tab

select e.empnm FROM tab
as e
join 
tab as m on m.empid=e.mgr_id

select firstname,lastname,salary,address,count(*)
from employee
group by address,salary
order by salary



























