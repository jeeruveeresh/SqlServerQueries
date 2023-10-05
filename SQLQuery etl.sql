create table date4(date_id int primary key, --date
year int)

insert into date4 values
(1,2022),(2,2021),(3,2021),(4,2022),(5,2020)  

select * from date4

create table product4(     --product
pro_id int primary key,
pro_type int,
pro_key Int)

insert into product4
values
(1,2,1),(2,1,1),(3,2,1),(4,1,1),(5,2,1)

select * from product4

create table Product_key3(
pro_id1 int identity primary key,           --pro_key
pro_name varchar(20))

insert into product_key3 
values('aaa'),('bbb'),('ccc');

select * from product_key3

insert into 
product_key3 values('ddd'),('eee') 

create table source3(id int identity primary key,      ---sourse_tab
year int,pro_id int,
s_id int ,pro_key int,
pro_type int,
no_of_sales money)

insert into source3 values(2022,1,1,1,2,10000),
(2021,2,2,1,1,50000),(2021,3,3,1,2,20000),
(2022,4,4,1,2,30000),(2020,5,5,1,1,50000)

select * from source3

create table fact_tab(
id int identity(1,1) primary key,
year int,
pro_key int,
prod_type_key int,
no_of_sales int
)

insert into fact_tab values(2022,1,2,10),(2021,1,1,50),(2021,1,2,20),(2022,1,1,30),(2020,1,2,20)

select *,(no_of_sales- lead_num) as loss,
round((cast(((no_of_sales - lead_num) * 100) as float )/no_of_sales),2) as profit 
from 
(
select *,lead(no_of_sales) over (partition by pro_type order by year desc) as lead_num from 
(
select b.year,d.pro_type,no_of_sales,pro_name from fact_tab as a join date4 as b on a.id = b.date_id 
join product_key3 as c on a.id = c.pro_id1 join product4 as d on a.id = d.pro_id
) as k
) as A


select * from date4
select * from product4
select * from Product_key3
select * from fact_tab

select * from [dbo].[fact]
select * from product4
select * from Product_key3
select * from fact_tab
