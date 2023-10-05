create table product_dim
(id int identity(1,1) primary key,
pro_key int,
prod_name varchar(50))

insert into product_dim values(1,'aaa'),(1,'bbb'),(1,'ccc'),(1,'ddd'),(1,'eee')

select * from product_dim 

create table prod_type(
id int identity(1,1) primary key,
prod_type_key int,
prod_name varchar(50),
type_prod varchar(50))

insert into prod_type values(2,'a','ab'),(1,'b','bc'),(2,'c','cd'),(1,'e','ef'),(2,'g','gh')

select * from prod_type  

create table year_dim(
id int identity(1,1) primary key,
year int
)

insert into year_dim values
(2022),(2021),(2021),(2022),(2020)

select * from year_dim 

create table sales
(id int identity(1,1) primary key,
no_of_sales int,
profit int,
growth int)

insert into sales values
(10,0,0),(50,0,0),(20,0,0),(30,0,0),(20,0,0)

select * from sales 

create table source_table(id int identity(1,1) primary key,
pro_key int,
prod_type_key int,
no_of_sales int,
profit int,growth int)

insert into source_table values(1,2,10,0,0),(1,1,50,0,0),(1,2,20,0,0),(1,1,30,0,0),(1,2,20,0,0)

select * from source_table

create table main_tab(
id int identity(1,1) primary key,
year int,
pro_key int,
prod_type_key int,
no_of_sales int,
profit int,
growth int
)

insert into main_tab values(2022,1,2,10,0,0),(2021,1,1,50,0,0),(2021,1,2,20,0,0),(2022,1,1,30,0,0),(2020,1,2,20,0,0)

select * from main_tab

select * ,(no_of_sales-leads) as profit_loss,
round((cast(((no_of_sales-leads)*100) as float)/no_of_sales),2) as profit_loss_perc from
(
select  b.year,c.pro_key,d.prod_type_key ,a.no_of_sales,
lead(a.no_of_sales) over (partition by d.prod_type_key  order by b.year desc) as leads 
from main_tab a join year_dim b on a.id=b.id 
join product_dim c on a.id=c.id 
join prod_type d on a.id=d.id
) as abc

create table fact4(
id int primary key identity(1,1),
years int,
pro_key int,
prod_type_key int,
no_of_sales int,
leads int,
profit_loss int,
profit_loss_perc int
)
--drop table fact4
select * from fact4


create table sour_tab(
id int,
nm varchar(20),
gender varchar(1)
)

select * from sour_tab
--truncate table sour_tab
select * from veeru

--truncate table veeru


create table sour_tab5(
nm varchar(2),
salary float(4)
)

select * from sour_tab5

select * from veeru

truncate table sour_tab5
truncate table veeru


create table sour_tab6(
id  int,
gender varchar(20),
nm varchar(20)
)

select * from sour_tab6

truncate table sour_tab6

drop table sour_tab6

select * from new_tab

truncate table new_tab








