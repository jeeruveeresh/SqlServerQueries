select getdate()
select DATEDIFF(MINUTE,'1999/02/10',getdate())as nikhil_age
select datediff(YY,'1999/02/10',GETDATE())

select datepart(YY,GETDATE())|
AS CURRENT_YEAR

select datepart(YY,'2023/01/23')

create table samples(
birthdate date,
hiredate date)
insert into samples values('2022/03/11','2023/02/13')
insert into samples values('2023/03/11','2021/02/13')
select date(hiredate,getdate())

select * from year(hiredate) as no_of_year count(*) as count_ from samples

select * from samples

select datepart(qq,birthdate) as age from samples

select (day(birthdate)) as years from samples 

select year(birthdate) as b_year,
month(birthdate) as m_name, 
day(birthdate) as day_birthdate ,


datepart(ww,birthdate) as week_no from samples

alter table samples add years int,hiredate date;
insert into samples values ('2012/2/23',2023,'2023/02/23')

select datename(DW,getdate())
select getdate()

select datename(SECOND,getdate()) as name

select datetime(getdate());

select getdate()

CREATE TABLE example_table (
    id INT,
    event_datetime DATETIME,
    modification_timestamp TIMESTAMP
);
select * from  example_table



select * from
[dbo].[TS Windspeed data February 2023]

select year(Date,getdate()) as years from 
[dbo].[TS Windspeed data February 2023]


=======================================primary key ==============================
create table emp
(
id int identity,
name varchar(20),
address varchar(20),
sal int,
country varchar(20),
age int
)
insert into emp values('nik','kmr',1000,'uk',22)
insert into emp values('jesse','pak',3000,'us',33)
insert into emp values('aravind','sar',16000,'uk',12)
insert into emp values('janny','gan',7000,'us',98)
insert into emp values('vamshi','ap',2000,'uk',24)
insert into emp values('bappi','bodhan',9000,'us',25)
insert into emp values('gowtham','hsbrd',4000,'london',61)


select * from emp
===========================foreign key ================================================
create table statedetails
(
stateid int primary key identity,
statename varchar(20),
statecode varchar(10))
insert into statedetails values('telangana','ts')
insert into statedetails values('andhra ','ap')
insert into statedetails values('nikhil','nik')
insert into statedetails values('narasimha','nar')
insert into statedetails values('pragati','pihuu')

select * from statedetails
select * from distdetails


create table distdetails
(
distid int primary key identity,
distname varchar(20),
stateid int references statedetails(stateid))
insert into distdetails values('kmr',1)
insert into distdetails values('susu',2)
insert into distdetails values('narayankhed',3)
insert into distdetails values('hyd',2)
insert into distdetails values('miyapur',1)
select * from distdetails


select a.statename,a.statecode,b.distname
from statedetails as a
left join distdetails as b
on a.stateid = b.stateid


select * from statedetails
select * from distdetails


=====joins=tab1
create table tb1
(
id int,
name varchar(1),
c_id int,
l_id int
)
insert into tb1 values(1,'a',11,5001)
insert into tb1 values(2,'b',12,5002)
insert into tb1 values(3,'c',13,null)
insert into tb1 values(4,'d',14,5004)
insert into tb1 values(5,'e',15,5005)
select * from tb1

create table tb2
(c_id int,
c_name varchar(5)
)
insert into tb2 values(11,'CNC')
insert into tb2 values(12,'JSON')
insert into tb2 values(13,'PVR')
insert into tb2 values(14,'MC')
insert into tb2 values(15,'TATA')
select * from tb2

create table tb3
(l_id int,
location varchar(20)
)
insert into tb3 values(5001,'HYD')
insert into tb3 values(5003,'CHN')
insert into tb3 values(5004,'PUNE')
insert into tb3 values(5005,'BNG')
select * from tb3

select* from tb1
select* from tb2
select* from tb3

select tb1.id,tb1.name,tb2.c_name,tb3.Location
from tb1
left outer join tb2
on tb1.c_id = tb2.c_id
left outer join tb3
on tb1.l_id = tb3.l_id

create table wc
(id int identity,
name varchar(10)
)
insert into wc values('IND')
insert into wc values('ENG')
insert into wc values('AUS')
insert into wc values('PAK')
select * from wc


select a.name +' vs '+ b.name as WC_schudule
from wc as a,wc as b
where a.name<b.name
order by a.name;

select *from emp
===========group by and having ===============
select country,address, sum(sal)
as total_sal,count(id)as id from emp
group by country,address 
having count(id) = 1;
==============order by=======================
select * from emp where id = 5 order by sal desc;
SELECT TOP 5  * FROM EMP
============================AND ,OR,NOT===============
select * from emp where country= 'uk' and address = 'kmr' and  id = 1;
select * from emp where name ='janardhan' or name = 'janny'
select * from emp where not country='us' and not country = 'uk'
============================like operator with wild cards===========
select * from emp where address like 'k%'
select * from emp where address like '%k'
select * from emp where name like '%e%'
select * from emp where name like '_a%'
select * from emp where name like '__w%'
====================IN AND BETWEEN OPERATOR ================
select * from emp where sal between 3000 and 9000
select * from emp where age in(22,12,25,61)
================INDEX================
create index idx1 on emp(sal desc)
select * from emp where sal > 3000;
alter index idx1 on emp disable
alter index idx1 on emp rebuild
drop index idx1 on emp

select * from [dbo].[add1]
create index idx1 on [dbo].[add1](salary desc)
select * from [dbo].[add1] where salary > 3000;
================creating indexing==========
create table motivity
(
id int primary key,
name varchar(20),
address varchar(20),
sal int,
country varchar(20),
age int
)
insert into motivity values(2,'nik','kmr',1000,'uk',22)
insert into motivity values(5,'jesse','pak',3000,'us',33)
insert into motivity values(8,'aravind','sar',16000,'uk',12)
insert into motivity values(1,'janny','gan',7000,'us',98)
insert into motivity values(3,'vamshi','ap',2000,'uk',24)
insert into motivity values(6,'bappi','bodhan',9000,'us',25)
insert into motivity values(4,'gowtham','hsbrd',4000,'london',61)
insert into motivity values(7,'quality','banglore',90000,'csk',01)
select * from motivity
====index==============================
create index id1 on motivity(sal)
DROP INDEX motivity.id1;
drop index id1 on motivity
alter index id1 on motivity disable 
alter index id1 on motivity rebuild 
select * from motivity where sal > 5000;
=========non clustered index==================
create table motivitylabs
(
id int unique,
name varchar(20),
address varchar(20),
sal int,
country varchar(20),
age int
)
insert into motivitylabs values(2,'nik','kmr',1000,'uk',22)
insert into motivitylabs values(5,'jesse','pak',3000,'us',33)
insert into motivitylabs values(8,'aravind','sar',16000,'uk',12)
insert into motivitylabs values(1,'janny','gan',7000,'us',98)
insert into motivitylabs values(3,'vamshi','ap',2000,'uk',24)
insert into motivitylabs values(6,'bappi','bodhan',9000,'us',25)
insert into motivitylabs values(4,'gowtham','hsbrd',4000,'london',61)
insert into motivitylabs values(7,'quality','banglore',90000,'csk',01)
select * from motivitylabs
create index nonclusterindex on motivitylabs(id asc)
alter index nonclusterindex on motivitylabs disable  
alter index nonclusterindex on motivitylabs rebuild  
drop index nonclusterindex on motivitylabs
=============while loop ==================================================
declare @id int
set @id =1 
while(@id <= 10)
begin
set @id = @id +1
end
go













            











