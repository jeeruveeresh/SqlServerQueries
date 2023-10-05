create table five(custid int primary key,custname varchar(200),mobile varchar(20),age int,salary float,salary_received bit);
insert into five(custid,custname,mobile,age,salary,salary_received)
values(1,'Rajashekar',7013069063,23,55003.35,1),
(2,'veeresh',9848012345,25,50002.45,0),
(3,'Rajesh',9848012346,24,490205.56,1),
(4,'veerayya',9848012347,28,38263.89,0),
(5,'Kezia',9848012348,26,40896.48,1),
(6,'Ashwini',9848012349,25,43026.89,0),
(7,'Abhi',9848012350,29,48000.45,1),
(8,'Jay',9848012351,27,48065.89,0),
(9,'Ali',9848012352,28,49786.51,0),
(10,'Ramana',9848012353,28,68714.56,1);

select * from five;

update five
set custname='Veerayya',
where custname='veerayya';

update five
set custname='Rajshekar'
where custid=1;

update five
set age=24
where  age=23;

exec sp_rename 'five.custname','cust_name','column';
--exec sp_rename 'table.column','newcolumnname','column';
select * from five;

create table dept(deptid int,deptname varchar(200),deptrev float,active bit,foreign key(deptid) references five(custid));
--foreign key(columnname) references table1(pkcolumnname)
select * from dept;
insert into dept(deptid,deptname,deptrev,active)
values(1,'IT',50000.45,0),
(3,'HK',45000.56,1),
(5,'HR',35000.89,1),
(4,'ADMIN',40000.98,1),
(7,'FINANCE',35000.86,0),
(10,'L&D',28000.78,1);
select count(*) from five
left join dept
on five.custid=dept.deptid;--total records that are present in table1 or left table
select count(*) from five
right join dept
on five.custid=dept.deptid;--total records that are present in table2 or right table
select count(*) from five
join dept
on five.custid=dept.deptid;--Matched records of table1 and table2 is inner join

create table five2(id int not null,name varchar(50), salary float,active bit);
insert into five2 values(123,'raj',18005.45,0),(124,'shekar',15005.56,0),(123,'rajesh',16805.78,1),(123,'veerayya',18005.45,0),(123,'raj',18005.45,0);
