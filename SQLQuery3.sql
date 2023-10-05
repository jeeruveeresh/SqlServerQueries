create table prod(id int identity(1,1) primary key,
pro_key int,prod_name varchar(50))

insert into prod values(1,'kajal'),(1,'eyeliner'),(1,'powder'),(1,'biscults'),(1,'vegetables')

select * from prod

create table prod_type(id int identity(1,1) primary key,
prod_type_key int,
prod_name varchar(50),
type_prod varchar(50))

insert into prod_type values(2,'kajal','cosmotic'),
(1,'eyeliner','cosmotic'),(2,'powder','cosmotic'),
(1,'biscults','groceries'),(2,'vegetables','groceries')

select * from prod_type 

create table pushpa(id int identity(1,1) primary key,year int)

insert into pushpa values(2022),(2021),(2021),(2022),(2020)
select * from pushpa

create table sales(id int identity(1,1) primary key,
no_of_sales int,
profit int,growth int)

insert into sales values(10,0,0),(50,0,0),(20,0,0),(30,0,0),(20,0,0)

select * from sales

create table source_tab(
id int identity(1,1) primary key,
pro_key int,prod_type_key int,
no_of_sales int,
profit int,
growth int)

insert into source_tab values(1,2,10,0,0),(1,1,50,0,0),(1,2,20,0,0),(1,1,30,0,0),(1,2,20,0,0)

select * from source_tabselect   

create table fact_tab1(ID int not null identity,pro_key int,
prod_type_key int,
no_of_sales int,
profit int,
growth int,
foreign key(id) references prod(id),
foreign key(id) references prod_type(id),
foreign key(id) references sales(id),
foreign key(id) references year1(id))

select * from fact_tab1


select * ,
(no_of_sales-leads) as profit_loss,
round((cast(((no_of_sales-leads)*100) as float)/no_of_sales),2) 
as profit_loss_percfrom(select  b.year,c.pro_key,d.prod_type_key ,
a.no_of_sales,
lead(a.no_of_sales) over (partition by d.prod_type_key  order by b.year desc) as leads 
from main_tab a join examp b on a.id=b.id join prod c on a.id=c.id join prod_type d on a.id=d.id) as abc