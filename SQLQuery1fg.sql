Insert into Dates values('10-07-23','July','Q3',2010),('10-08-23','August','Q3',2010),('11-11-23','November','Q4',2010)

insert into Customer values('IN','AJAY'),('Corp','Laxman'),('GP','Abhi')

insert into Product values('P01','Credit Cards'),('P02','CORP LOAN'),('P03','GOLD LOAN')

Select * from Dates
Select * from Customer
Select * from Product

Create table FACT_TABLE(
ID int not null identity(1,1),
Date_Key int,
Cust_Key int,
Product_Key int,
No_Of_Product int,
No_Of_Customers int,
foreign key(Date_key)references dates(id),
foreign key(Cust_Key)references Customer(id),
foreign key(Product_Key)references Product(id))

Select * from FACT_TABLE

create table Source_Table
(
sdates date,
type_of_customer varchar(50),
product varchar(50),
no_of_products int,
no_of_customers int)

insert into Source_Table
values('07-23-10','IN','P01',300,50),
('08-23-10','CORP','P02',200,100),
('11-23-11','GP','P03',150,20)


create table src_tbl
(
Company_name varchar(25),
nature_of_company varchar(25),
date_of_estd date,
serviced varchar(25),
revenue varchar(25));


insert into src_tbl values('ABC','IT','05-23-2005','IT','50B'),
('ABC','consulting','02-28-2010','consulting','30B'),
('BCD','consulting','01-13-1999','IT','10B'),
('CDE','HR','09-17-2010','HR','60B')

CREATE TABLE company_tbl2
(ID INT IDENTITY(1,1) PRIMARY KEY,
company_name VARCHAR(10),
nature_of_company VARCHAR(10)); 

CREATE TABLE DATE_dm_tbl
(ID INT IDENTITY(1,1) PRIMARY KEY,date_key date,month VARCHAR(10),Quarter VARCHAR(10),year INT); 

CREATE TABLE services_dm_tbl
(ID INT IDENTITY(1,1) PRIMARY KEY,
company_name VARCHAR(20),
services_off VARCHAR(10));

insert into company_tbl2 values('ABC','IT'),
('ABC','consulting'),
('BCD','outsource'),
('CDE','HR')

INSERT INTO services_dm_tbl
values('abc','it'),
('abc','consulting'),
('bcd','it'),
('cde','hr');

Insert into DATE_dm_tbl values
('2005-05-23', 'may','Q2',2005),                        
('2010-02-28','feb','Q1',2010),                        
('1999-01-13','jan','Q1',1999),
('2010-09-17','sep','Q3',2010);

SELECT *
FROM company_tbl2;
SELECT *
FROM services_dm_tbl;
SELECT *
FROM DATE_dm_tbl;

SELECT * FROM table2

create table checks(
	 ID   int  ,
	 NM   varchar (50)  ,
	 DOJ   date  ,
	 Dept   varchar (50)  
)

CREATE TABLE OKAY(
ProductID int,
Sub_Sub_Category_Key int,
Colour varchar(250),
ProductName varchar(200),
RetailPrice float,
StandardCost float)

select * from okay2

create table names(fnm varchar(10),lnm varchar(10))
insert into names VALUES('AB','BC'),('CD','DE'),('EF','FG'),('GH','HI')

create table updates1 (fnm varchar(10),lnm varchar(10)),fullnm varchar(20)
insert into names1 VALUES('AB','BC'),('CD','DE'),('EF','FG'),('GH','HI')

select * from FULL_NAMES
update names1
set fulls=fnm+lnm


alter table names
add fulls varchar(20)

update column full


