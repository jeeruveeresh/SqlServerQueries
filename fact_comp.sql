
create table dates(id int identity(1,1) primary key, dated date not null, months varchar(10),quarterd Varchar(20),Years int);
------------------------
create table customer(id int identity(1,1) primary key,
type_of_cust varchar(25),
customer_name varchar(25));
---------------------------
create table product(id int identity(1,1) primary key,
product_id varchar(20),
product_name varchar(25));
----------------------------
select * from product
select * from dates
select * from customer 
------------------------------
create table fact_table(id int not null identity(1,1),
date_Key int,
cust_Key int,
product_Key int,
no_of_product int,
no_of_customers int,
foreign key(date_key)references dates(id),
foreign key(cust_Key)references customer(id),
foreign key(product_Key)references product(id));

---------------------------------------- 
select * from fact_table ;
-------------------------------------
create table source_table(
id int not null identity(1,1),
sdates date,
type_of_customer varchar(50),
product varchar(50),
no_of_products int,
no_of_customers int);


--------------------------------- 
insert into source_table values ('07-23-10','individual','p01',300,50),
('08-23-10','corporation','p02',200,100),
('11-23-10','Group_of_people','p03',150,20);

select * from source_table;
select * from customer;

insert into customer values ('individual','ab'),
('corporation','bc'),
('group_people','cd'); 

insert into product values('p01','credit_loan'),
('p02','car_loan'),
('p03','home_loan'); 

select * from product

insert into dates values('07-23-10','july','q3',2010),
('08-23-10','august','q3',2010),
('11-23-10','november','q4',2010);

select * from dates;

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

20-02-2023
select b.id as cust_key,
	   c.id as product_key,
	   d.id as date_key,
	   a.no_of_product,
	   a.no_of_customers
from fact_table a
join dates d on a.id=d.id
join product c on a.id=c.id
join customer b on a.id=b.id

-----------------------------------

selecT * from fact_table

insert into fact_table

select b.id as cust_key,
	   c.id as product_key,
	   d.id as date_key,
	   a.no_of_products,
	   a.no_of_customers
from source_table a
join dates d on a.id=d.id
join product c on a.id=c.id
join customer b on a.id=b.id

select * from fact_table---updated through ssis






>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> FACT_COMP<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<,





create table source_tab_comp(id int not null identity(1,1),
			 company_name varchar(20),
	         nature_of_comp varchar(20),
			 date_of_est date,
			 services_providing varchar(20),
			 revenue varchar(20));
insert into source_tab_comp values('abc','it','05-23-2005','it','50b'),
								  ('abc','consulting','02-28-2010','consulting','30b'),
								  ('bcd','outsourcing','01-13-1999','it','10b'),
								  ('cde','hr','09-17-2010','hr','60b'); 
select * from source_tab_comp;
---------------------------------------------
create table date_dim(id int identity(1,1) primary key,
			 dated date not null, months varchar(10),
			 quarterd Varchar(20),Years int); 
insert into date_dim values('05-23-2005','May','q2',2005),
						   ('02-28-2010','feb','q1',2010),
						   ('01-13-1999','jan','q1',1999),
						   ('09-17-2010','sep','q3',2010); 
select * from date_dim
---------------------------------------------------
create table comp_dim(id int identity(1,1) primary key,
			 comp_name varchar(25),
			 nature_comp varchar(25));
insert into comp_dim values('abc','it'),
						   ('abc','consulting'),
						   ('bcd','outsourcing'),
						   ('cde','hr'); 
select * from comp_dim;
-----------------------------------------------
create table serv_dim(id int identity(1,1) primary key,
			 type_of_service varchar(25),);
insert into serv_dim values('it'),
						   ('consulting'),
						   ('it'),
						   ('hr');
select * from serv_dim;
---------------------------------- 
create table fact_table_comp(id int not null identity(1,1),
			 date_key int,
			 comp_key int,
			 serv_key int,
			 revnue varchar(20),
			 foreign key(date_key)references date_dim(id),
			 foreign key(comp_Key)references comp_dim(id),
			 foreign key(serv_Key)references serv_dim(id));
-----------------------------------------------------      
------------------------------------------------------------ 
select * from elt_demo;

create table demo2(id int,names varchar(20),doj date ,dept varchar(20)); 
select * from demo2
select * from execl_test
except
select * from excel_test_1 
select * from product_new; 
create table concati(first_name varchar(20),
			 last_name varchar(20)); 
insert into concati 
values('ab','bc'),
	  ('cd','de'),
	  ('ef','fg'),
	  ('gh','hi');
select * from fact_table_comp






