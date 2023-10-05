-----------------------------------------------Create table----------------------------------------------------------------
create table hello(id int, description varchar(2000));
--------------------------------------DML: Data Manipulation Language:-----------------------------------------------------
print 'DML';
-->>>>>>>>>>>>>>>>>>>>Insert: It is used to inserting a row into a table
insert into hello(description)values('hello world');
insert into hello (id) values(1);
-->>>>>>>>>>>>>>>>>>>>Select: It is used to select and display a table
select * from hello;
-->>>>>>>>>>>>>>>>>>>>Select: And also select is used to display specific column from table
select description from hello;
-->>>>>>>>>>>>>>>>>>>>Select Count: Display number of records in the table
select count(*) from hello;
-->>>>>>>>>>>>>>>>>>>>Update: Updating a specific row in a table
update hello set description='Hello! World' where id=1;
-->>>>>>>>>>>>>>>>>>>>Select *: Select rows and displaying rows from the table
select * from hello;
-->>>>>>>>>>>>>>>>>>>>Delete: Deleting a row from a table
delete from hello where description='hello world';
-------------------------------------------Query a tables------------------------------------------------------------------
print 'Query a tables';
-->>>>>>>>>>>>>>>>>>Order By: Order By is used to create ordered by column

create table empdata(CustomerID int primary key,CompanyName varchar(200),ContactName varchar(50),ContactTitle varchar(200),Address varchar(250),City varchar(50),Region varchar(200),PostalCode int,Country varchar,Phone int,Fax int)
insert into empdata values(1234,'wipro','rajshekar','asst.jr','gachibowli','hyderabad','Telangan','500000','1',984345,08463)
insert into empdata values(1235,'datalysis','rajesh','asst.sr','hitech city','hyderabadi','Telangana','5000001','2',984346,08462)
insert into empdata values(1236,'google','ramesh','lab asst.','RK Beach','Vizag','AndhraPradesh','500002','3',984347,08461)
insert into empdata values(1237,'titan','riyaz','lab technician','RK Cross road','Vijayawada','AP','500003','4',984348,08460)
insert into empdata values(1238,'titan','sadiqi','lab worker','RK Beach','Vizag','AndhraPradesh','500002','4',984347,08460)
insert into empdata values(1239,'google','sadiqi','lab m','gachibowli','hyderabad','Telangan','500000','1',984347,08460)

select * from empdata;
-->>>>>>>>>>>>>>>>>>>>>>>>ORDER BY with DBNAME: It is used to order by the values with the specific column and with using dbname
use AdventureWorks2019
go
select top 10 * from person.Password
order by ModifiedDate;
-->>>>>>>>>>>>>>>>>>>>>>>>ORDER BY with db.tablename: It is used to order by the values the specific column by using the with db.tablename
select top 10 * from AdventureWorks2019.Person.Password
order by BusinessEntityID
-->>>>>>>>>>>>>>>>>>>>>>>>DESCENDING ORDER: It is used to create a descending order values for a specific column
select * from AdventureWorks2019.Production.WorkOrder;
order by "rowguid" desc;
-->>>>>>>>>>>>>>>>>>>>>>>>DESCENDING ORDER WHERE: single quotes and double quotes
select top 20 "city" from AdventureWorks2019.Person.Address
where PostalCode='98028'
order by "city" desc;
-->>>>>>>>>>>>>>>>>>>>>>>>DESCENDING ORDER T-SQL: using between constraint
select top 50 *  from AdventureWorks2019.Production.WorkOrder
where ProductID between '850'and '900'
order by workorderid;
------------------------------------------------JOINS----------------------------------------------------------------
create table emp(empid varchar(200),empname varchar(200),salary int,deptid varchar(200),managerid varchar(200))
insert into emp(empid,empname,salary,deptid,managerid) values('E1','Rahul',15000,'D1','M1');
insert into emp(empid,empname,salary,deptid,managerid) values('E2','Manoj',15000,'D1','M1');
insert into emp(empid,empname,salary,deptid,managerid) values('E3','James',55000,'D2','M2');
insert into emp(empid,empname,salary,deptid,managerid) values('E4','Michael',25000,'D2','M2');
insert into emp(empid,empname,salary,deptid,managerid) values('E5','Ali',20000,'D10','M3');
insert into emp(empid,empname,salary,deptid,managerid) values('E6','Robin',25000,'D10','M3');
select * from emp;
create table dept(deptid varchar(200),deptname varchar(200));
insert into dept(deptid,deptname) values('D1','IT'),('D2','HR'),('D3','Finance'),('D4','Admin');
select*from dept;
create table manager(managerid varchar(20),managername varchar(200),deptid varchar(200));
insert into manager(managerid,managername,deptid) values ('M1','prem','D3'),('M2','shipadh','D4'),('M3','Nick','D1'),('M4','Cory','D1');
select *from manager;
create table projects(projectid varchar(200),projectname varchar(200), tmid varchar(200))
insert into projects(projectid,projectname,tmid) values('P1','Data Migration','E1'),('P1','Data Migration','E2'),('P1','Data Migration','M3'),('P2','ETL Tool','E1'),('P2','ETL Tool','M4');
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>4 Tables are create for reference to Inner join, Left join, Right join
---------------------------------------------INNER JOIN---------------------------------------------------------------
select e.empname,d.deptname
from emp e
inner join dept d on e.deptid=d.deptid;
---------------------------------------------LEFT JOIN----------------------------------------------------------------
select e.empname,d.deptname
from emp e left join dept d on e.deptid=d.deptid;
---------------------------------------------RIGHT JOIN-----------------------------------------------------------------
select e.empname,d.deptname
from emp e right join dept d on e.deptid=d.deptid;
----------------------------------------INNER LEFT RIGHE JOIN-----------------------------------------------------------
select e.empname,d.deptname 
from emp e
left join dept d on e.deptid=d.deptid
join manager m on m.managerid=e.managerid
join projects p on p.projectid=m.


select * from emp;
select * from dept;
select * from manager;
select * from projects;
-------------------------------------------------AGGREGATE FUNCTIONS-------------------------------------------------------
select max(salary)as max,
min(salary)as min,avg(salary)as avg,sum(salary) as sum,count(salary) as count
from emp;
-->>>>>>>>>>>>>>>>>>>>>>COUNT
select count(empname) as count from emp;
select count(1)as count from emp;
-->>>>>>>>>>>>>>>>>>>>>>SOLVE
create table stats1(id int not null, rev int) 
insert into stats1(id,rev)values(12,200.5),(13,52.5),(14,56.5),(15,21.5),(16,58.57),(17,56.5),(18,57),(19,59.5),(20,60),(25,86.5);

select ((sum(rev)/avg(rev))*100) from stats1;
 
select *from stats1;
alter table stats1
add location varchar(200);
update stats1
set location='hyd'
where id=20;

--select max(rev) as mum
--from stats1
--where location='mum';---find out the values and sum and avg and min and max of the table
-->>>>>>>>>>>>>>>>>>>>>>>COUNT(*)
select count(*),location from stats1 group by location having count(*)>2;
---------------------------HAVING>>>>>>>>>>>>>>>>
select location,sum(rev)
from stats1
where location='hyd'
group by location
having sum(rev)>100;-- on single querie we can add arthimetic and logical relations also
-------------------------------------------------------ELIYAS--------------------------------------------------
create table salary(id int,salary float)
insert into salary values (1,20000.89),(2,20000.20),(3,15000),(4,10000),(5,18000),(6,6000),(7,8000),(8,9000);
drop table salary;
--We can use the eliyas for fetching the between range values from the tables.
-------------------------------------------------------------------------------------ASSIGNMENT--------------------------------------------------------------------------
select top 1 salary from(
select distinct top 7 salary 
from salary
order by salary desc) as a
order by salary;
select * from salary;

where ;
select * from salary;

select distinct * 
from salary
order by salary desc
offset 6 rows fetch next 1 rows only;

select * from Salary;
-----------------------------------------------------CREATE INDEX----------------------------------------------------------
select * from emp;
create index nameofemp
on emp (empname);
----------------------------------------------------VIEW INDEX------------------------------------------------------------
exec sp_helpindex emp;
----------------------------------------------------CREATING A TABLE WITHOUT PRIMARY KEY--------------------------------------------------
--create table index1(custid int,custname varchar(200), dept varchar(20),roles varchar(200), mobile varchar(200), age int, points float, result bit);
--insert into index1 values(1,'raju','IT','Trainee','7018252636',23,5.6,1);
----------------------------------------------------CREATING A TABLE--------------------------------------------------
create table index1(custid int primary key,custname varchar(200), dept varchar(20),roles varchar(200), mobile varchar(200), age int, points float, result bit);
insert into index1 values(1,'raju','IT','Trainee','7018252636',23,5.6,1);
select * from index1;
---------------------------------------------------TO DELETE TABLE--------------------------------------------------
drop table index1;
---------------------------------------------------TO VIEW THE INDEX------------------------------------------------
exec sp_helpindex index1;
---------------------------------------------------CREATE A CLUSTER INDEX--------------------------------------------------
create clustered index primary1
on index1(dept,roles);
---------------------------------------------------CREATE A NONCLUSTERED INDEX--------------------------------------------------
create nonclustered index designation
on index1(dept,roles);
---------------------------------------------------DROP AN INDEX------------------------------------------------
drop index index1.primary1;
---------------------------------------------------DROP A COLUMN--------------------------------------------------
--alter table index1
--alter column custid int;
--go
--------------------------------------------------RANKING-------------------------------------------------
--Rank()
create table duplicate(name varchar(20),location varchar(200),salary int);
insert into duplicate values('ab','hyd',1000),('bc','hyd',2000),('ab','hyd',1000),('cd','mum',2000),('cd','mum',2000),('de','hyd',1000),('de','hyd',1000);
-->>>>>>>>>>>>>>>>>>>>USING GROUP BY
select name,location,salary,count(*) AS count from duplicate
group by name,location,salary
-->>>>>>>>>>>>>>>>>>>>USING RANK()>>>>>>>USING ROW_NUMBER>>>>>>>>>>USING DENSE_RANK))))))))))))))))
select name,location,salary,
row_number()over(partition by name,location,salary order by name,location,salary desc) as rownumber from duplicate;

select name,location,salary,
rank()over(partition by name,location,salary order by name,location,salary desc) as ranking from duplicate;

select name,location,salary,
dense_rank()over(partition by name,location,salary order by name,location,salary desc) as denserank from duplicate;
--DELETE t
--FROM
--(SELECT *,delte=ROW_NUMBER()over(partition by name,location,salary order by (select null))from duplicate) as t where delte>1;

with CTE as
(
select 
name,location,salary,row_number () over (partition by name,location,salary order by name,location,salary asc) as row_ranking,
                rank () over (partition by name,location,salary order by name,location,salary asc) as ranking,
                dense_rank () over (partition by name,location,salary order by name,location,salary asc) as dense_ranking
from duplicate
) 
delete CTE 
where CTE.row_ranking > 1;

select * from duplicate;
=======================================================================================================================
create table depart(deptname varchar(200),deptrev int)
insert into depart values('HR',8000),('HR',7000),('IT',5000),('IT',4000),('IT',3000),('Finance',10000),('Finance',2000),('Finance',1000),('Support',9000),('IT',4000);
------------------------------------------------RANKING BASED ON ORDER BY-------------------------------------------------
select deptname,deptrev,
row_number() over (partition by deptname order by deptrev desc) as rownumber
,rank() over (partition by deptname order by deptrev desc) as ranking 
,dense_rank() over (partition by deptname order by deptrev desc) as denserank 
from depart;
-----------------------------------------------UNION AND UNION ALL----------------------------------------------------
--the sequence of the columns must be same
--the number of columns should also match
--the values are must be unique
create table unions(custid int,custname varchar(200),custpoints float,account_status bit,joining_date date); 
insert into unions(custid,custname,custpoints,account_status,joining_date) values(1,'aa',5.6,1,'2022-12-30'),(2,'bb',6.8,0,'2022-11-28'),(3,'cc',5.6,1,'2022-12-30'),(1,'dd',7.8,0,'2022-11-30'),(4,'aa',8.2,0,'2022-11-26'),(5,'ee',9.5,0,'2022-10-28');
create table unions1(custid int,custname varchar(200),custpoints float,account_status bit,joining_date date);
insert into unions1(custid,custname,custpoints,account_status,joining_date) values(6,'BC',9.1,0,'2022-11-25'),(7,'CD',9.6,0,'2022-08-28'),(8,'DE',6.7,0,'2022-12-25'),(9,'EF',7.8,0,'2022-11-30'),(7,'CD',9.6,0,'2022-08-30'),(10,'GH',9.5,0,'2022-10-28');
Select * from unions  
union 
select * from unions1;
Select * from unions  
union all
select * from unions1;
---------------------------------------------------SET OPERATORE EXCEPT----------------------------------------------------
Select * from unions  
union
select * from unions1
except
select * from unions1 
except
select * from unions;
intersect
----------------------------------------------------SELF JOIN----------------------------------------------------------
create table emp_manager(name varchar(200),designation varchar(200),ID int, department varchar(200),manager_ID int);
insert into emp_manager VALUES('AB','S/W',101,'IT',102),('BC','Engineer',103,'IT',101),('CD','Consultant',104,'IT',103),('DE','S/W',105,'HR',101),('EF','Engineer',102,'Finance',104),('FG','Engineer',106,'Finance',' ');
select*from emp_manager;
select a.name as emp,b.name as manager
from emp_manager 
a join emp_manager b
on b.id=a.manager_id;
-->>>>>>>>>>>>>>>>>>>>--select 
---------------------------------------------------PIVOT---------------------------------------------------------------
--pivot is a function that which is build the relationship between column and rows as per requirement
select * from
(select deptname,deptrev from depart) as c1
pivot
(
sum(deptrev) for deptname in(IT,HR,Finance,Support)
)as c2;
->>>>>>>>>>>>>>>>>>>>>>--select*from(select col1,col2.. from tablename) as Eliyasname1 pivot(condition for col1 in (col1_value1,value2...))as Eliyasname2;
--------------------------------------------------CASE STATEMENT--------------------------------------------------------
--case when then col1 else col2 and select use when condition then display1 else display2 end
case when then col1 else col2 and 
select (case 
when dept='hr' then 'india' 
then display1 else display2 end
--select case when department='hr' then 'INDIA'
--when dept='IT' then 'USA'
--when dept='Support' then 'UK'
--else
--'NA' END) as location FROM depart;
--select * from depart;
----------------------------------------------------SUBSTRING---------------------------------------------------------
select substring('INDIA is country',1,5);
-->>>>>>>>>>>>>>select substring('INPUT TEXT',startindex,endindex);
---------------------------------------------------CONCATENATE-------------------------------------------------------
create table names(first_name varchar(20),last_name varchar(20),full_name varchar(200));
insert into names values('abc','xyz','abc.xyz'),('cde','wxy','cde.wxy'),('def','uvw','def.uvw'),('fgh','tuv','fgh.tuv');
select concat(first_name,last_name) from names;
select * from names;
----------------------------------------------------CHARINDEX-------------------------------------------------------
alter table names
add fullname varchar(200);

update names
set fullname=concat(first_name,last_name);
select * from names;

select charindex('.',full_name)from names;
--->>>>>>>>>>>>>>>>>>>>>select charindex('value',colname)from tablename;
-----------------------------------------charindex and substring----------------------------------------------------
select substring(full_name,charindex('.',full_name)+1,len(full_name))as name from names;

select * from colours
where(col1 like 'y%')or(col2 like 'y%')or(col3 like'y%');
