create table Dates
(ID int identity(1,1) primary key, Dated date not null, Monthd varchar(10),Quarterd Varchar(20), Yeard int)


create table Customer
(ID int identity(1,1) primary key, Type_of_cust varchar(25),Customer_name varchar(25))



create table Product
(ID int identity(1,1) primary key, Product_id varchar(20), Product_name varchar(25))

select * from Product
select * from Dates
select * from Customer

select @@version
