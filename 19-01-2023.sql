----------------------------------------------RUNNING TOTAL-------------------------------------------------
create table salary(amount int)
insert into salary(amount) values(1000),(2000),(3000),(4000),(5000),(8000);
select sum(amount) over (order by amount asc)from salary;
----------------------------------------------ROLLUP-------------------------------------------------------
alter table salary
add dept varchar(200);
create table salary1(amount int,dept varchar(200))
insert into salary1(amount,dept)values(1000,'IT'),(2000,'IT'),(3000,'HR'),(4000,'IT'),(5000,'Finanace'),(8000,'HR');

select * from salary1;
alter table salary1
add totals int;

update salary1
set dept='Finance'
where amount=5000;

SELECT SUM(amount),dept
from salary1
group by 
rollup(dept);

select * from salary;
----------------------------------------------CASE STATEMENT AND ROLLUP----------------------------------------------
Select (case 
when dept is null then 'total' 
else dept
end)as dept1 from
(SELECT SUM(amount),dept
from salary1
group by 
rollup(dept));
----------------------------------------------------VIEW-----------------------------------------------------------
Select * from employeed;
create view view_emp as
(select empname,empid
from employeed);

select * from view_emp;
drop view view_emp; 
--------------------------------------------STORED PROCEDURES------------------------------------------------------------
CREATE Procedure sp as
(select  CONCAT(empid,empname)from employeed );
exec sp;
------------------------------------------viewing STORED PROCEDURES--------------------------------------------------------
select * from employeed;
select * from tests;

--Stored procedure is a code that which is used to create the code as stored_procedure_name, 
--And we can use it over and over agian.
--We can use sp as functions and we can call it anytime we want
CREATE PROCEDURE [schema_name].procedure_name  
                @parameter_name data_type,   
                ....   
                parameter_name data_type  
AS  
   BEGIN  
      -- SQL statements  
      -- SELECT, INSERT, UPDATE, or DELETE statement  
   END  
SELECT * FROM employeed;

Create procedure procedure_parameters3
(@empid int, @pincode int)
as
begin
update employeed 
set pincode=pincode+1 
where pincode=@empid;
end;

drop procedure procedure_parameters

exec updates @emp2='user';

create procedure updates
(@emp2 varchar(200))
as
begin
update employeed
set pincode=pincode+5
where empname=@emp2;
end;

select*from employeed;
execute sp_help procedure_parameters;

create procedure proc1
(@ok varchar(200),@sal int)
as
begin
update employeed
set empid=empid+1
where empname=@ok;
commit;
select empid=@sal
from employeed;
end;


exec proc1 'rajshekar',@sal;

create procedure test_2(@in_para varchar(200) ,@out_para int output ) as
begin
update  employeed set empid =empid+35 where empname=@in_para;
select @out_para = empid from employeed where empname=@in_para;
end;
declare @out_para int
exec test_2 'rajshekar',@out_para output;
print @out_para;

select * from employeed;

---------------------------------------------QUESTIONS AND PRACTICE 19-01-2023 17:00-------------------------------------
--1)Get the output as where is yellow is located
Create table colours
(col1 varchar(200),col2 varchar(200),col3 varchar(200));
insert into colours values('yellow','red','yellow'),('blue','green','yellow'),('yellow','black','white');

select * from colours
where 'yellow' in (col1,col2,col3);

--2)get the sum of column which is having varchar
create table reve1(amount int);
insert into reve1 values(2000),(null),(3000),(0),(0),(4000);
select (sum (select * from reve1 where (amount>1)));
select * from reve1;
drop table reve1;

--3)Get the years of experience from employee details
create table empemp
(namek varchar(20),doj date,expe int)
insert into empemp(namek,doj) values ('ab','2020-12-02'),('bc','1998-10-12'),('cd','2022-11-01');
--select 
--(case 
--when doj then 
select namek,doj,
DATEDIFF(year,doj,getdate())
as experience
from empemp

update empemp 
set expe=DATEDIFF(year,doj,getdate())
select * from empemp;




