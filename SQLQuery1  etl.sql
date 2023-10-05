select * from [dbo].[new_table]

select * from [dbo].[source_tab]
drop table source_tab


create table source_tab(
id int primary key identity(1,1),
dates date,
type_of_cust varchar(30),
product varchar(30),
no_of_products int,
no_of_customers int
)

insert into source_tab 
values 
('07-23-2010','IN','p01',300,50),
('08-23-2010','CORP','p01',200,50),
('11-23-2010','GP','p01',150,50);

update source_tab 
set no_of_customers =20 
where dates = '11-23-2010'

select * from source_tab

select * from product

select * from customer

drop table fact

create table fact (
id int primary key identity(1,1),



INSERT INTO sales_fact
SELECT * FROM(
SELECT d.id as date_key,
cust.id AS cust_key,
pro.id AS pro_key,
src.no_of_products,
src.no_of_customers
FROM source_tab src
JOIN date_tab d ON src.ID = d.ID 
JOIN customer cust ON 
src.ID = cust.ID JOIN product pro ON src.ID = pro.ID) a;

truncate table sales_fact

CREATE TABLE sales_fact(ID INT IDENTITY(1,1) PRIMARY KEY,
date_ky INT FOREIGN KEY REFERENCES date_tab(ID),
cust_key INT FOREIGN KEY REFERENCES customer(ID),
product_key INT FOREIGN KEY REFERENCES product(ID),
no_of_products INT,
no_of_customers INT)

select * from fact

SELECT * FROM scenario2; 

select * from [dbo].[fact_company_details]

select * from source_two    ---- date company services source pro_d,(date-id year)


Create Table Source_tab_3(               --Source_tab
Id int Primary Key identity,
Year_Key int,
Prod_Key int,
Prod_Type_Key int,
No_Of_Sales bigint);

Insert into Source_tab_3
values
(2022,1,2,10000000000),
(2021,1,1,50000000000),
(2021,1,2,20000000000),
(2022,1,1,30000000000),
(2020,1,2,50000000000); 

Select * from Source_tab_3; 

Create Table Date_Dim3(           --date_dim_3
ID int primary key identity,
years int); 

Insert into Date_Dim3
values
(2020),
(2021),
(2022); 

Create Table Product_Dim3(       ---pro_dim_3
Id int primary key identity,
Prod_name varchar(20)); 

Insert into Product_Dim3
values('cd'),('ef'),('gh'),('hi'); 

select * from product_dim3

Create table Prod_Type_Dim3(         ---pro_type_dim_3
Id int primary key identity,
Prod_Type varchar(20));


select * from prod_type_dim3


Insert into Prod_Type_Dim3
values
('A'),('B'),('C');

Create table Fact_Table_Scenario_3(                ---Fact_Table_Scenario_3
id int primary key identity,
Year_key int,
Prod_key int,
Prod_Type_key int,
No_Of_Sales bigint,
Foreign key(Year_key) references Date_Dim3(id),
Foreign key(Prod_key) references Product_Dim3(id),
Foreign key(Prod_type_key) references Prod_Type_Dim3(id));

Select * from Fact_Table_Scenario_3


create table source_table_1(id int identity(1,1) primary key,
dates int,no_of_sales bigint,
product_id varchar(20),
product_name varchar(20),
product_type_id varchar(20),
prodcut_type_name varchar(20));


Insert into source_table_1
values
(2022,10000000000,'1','ab','2','abc'),
(2021,50000000000,'1','ab','1','bcd'),
(2021,20000000000,'1','ab','2','abc'),
(2022,30000000000,'1','ab','1','bcd'),
(2020,50000000000,'1','ab','2','abc'); 

select * from source_table_1;




create table fact_table_1(
id int not null identity(1,1),
dates_key int,product_key int,
product_type_key int,
no_of_sales bigint,
foreign key(product_key)references product_dim3(id),
foreign key(product_type_Key)references Prod_Type_Dim3(id),
foreign key(dates_Key)references Date_Dim3(id));


create table product_dim_1(
id int identity(1,1) primary key,
product_id varchar(20),
product_name varchar(20)); 


insert into product_dim_1 values('1','ab'),
('1','ab'),('1','ab'),('1','ab'),('1','ab');

create table dates_dim_1(
id int identity(1,1) primary key,
dates int,
no_of_sales bigint
); 

insert into dates_dim_1 values
(2022,10000000000),(2021,50000000000),
(2021,20000000000),(2022,30000000000),
(2020,50000000000);

create table product_type_dim_1(
id int identity(1,1) primary key,
product_type_id varchar(20),
prodcut_type_name varchar(20)); 

insert into product_type_dim_1 values('2','abc'),
('1','bcd'),('2','abc'),('1','bcd'),('2','abc');

select b.date_id,b.year,
c.pro_key,c.pro_type,a.no_of_sales
from source3 a join date4 b on
a.pro_type=b.date_id join product4 
con a.id=c.pro_id join Product_key4 d on a.id=d.pro_id1
order by year

select year,no_of_sales,pro_type,lead(no_of_sales) 
over(partition by pro_type order by pro_type )as sales from
(select b.date_id,b.year,c.pro_key,c.pro_type,a.no_of_sales 
from source3 a join date4 b 
on a.pro_type=b.date_id join product4 con a.id=c.pro_id join Product_key4 d 
on a.id=d.pro_id1)source3


















select *,lead(src.no_of_sales) over (partition by dates order by dates desc) as ln from
(
select a.id,d.dates,src.no_of_sales,p.product_id,pt.product_type_id from source_table_1 as a 
inner join
dates_dim_1 as d on a.id = d.id inner join 
product_dim_1 as p on a.id = p.id inner join 
product_type_dim_1 as pt on a.id = pt.id
) as k 


SELECT src.dates AS year_key,
pro.product_id AS pro_key,
pro_type.product_id as pro_type_key,
src.No_Of_Sales 
FROM
source_table_1 src LEFT JOIN dates_dim_1 d ON 
src.year_key = d.date_id LEFT JOIN 
product_dim_1 pro ON src.Prod_Key = pro.pro_id 
LEFT JOIN product_dim_1 pro_type ON src.Prod_Type_Key = pro_type.PRO_ID