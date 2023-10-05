---stored procedure : is a group of T-sql statements. If u have a situation,where u write 
---                   the same query over and over again,u can save that specific query as
---                   a stored procedure  and call it just by name

select * from emp
--syntax:
create procedure proc_name  ------> input parameters
@variable DT,
@variable DT
as ---------->> specifies heading and body
begin 
select * from emp --statement
--where name = @emp_name and @emp_salary = @emp_salary
end

CREATE procedure emp_proc  --===> by using alter u can modify procedure
@emp_name varchar(200),
@emp_salary int
as 
begin 
select * from emp  
where name = @emp_name and salary = @emp_salary
end

--EXECUTION
exec emp_proc 'rams',300000 --> eXecution by calling with parameters

sp_helptext emp_proc2 --> gives the query that ur writtened means TEXT

drop procedure emp_proc2     --==> dropping procedure 

declare @name  varchar(200),@id int
declare csr_tab cursor for
select name,salary  from emp 
open csr_tab 
fetch next from csr_tab into @name,@id 
while @@fetch_status = 0
begin
print cast(@name as varchar(300))+' '+ cast(@id as varchar(200))
fetch next from csr_tab into @name,@id 
end 
close csr_tab
deallocate csr_tab

--TRIGGERS : 

TRIGGERS: 

--A trigger is a special type of stored procedure that automatically runs when an event occurs 
--in the database server. DML triggers run when a user tries to modify data through a data manipulation language (DML) event. DML events are INSERT, UPDATE, or DELETE statements on a table or view.  

select * from employee 

CREATE table emp_audit ( 
id int identity, 
emp_text text 
) 

-----------drop table emp_audit 

CREATE TRIGGER for_inserted  
on employee  
for insert --(update or delete) 
as  
begin  
declare @id int 
select @id = empid  from inserted --(deleted, when updated = inserted) 
insert into emp_audit values  
( 
'emp with id =' +cast(@id as varchar(200))+'is added at ='+' '+cast(getdate() as varchar(200)) 
) 
end 

drop trigger for_inserted 

insert into employee  
values  
(10,'sam','curran',400000,'che'); 

--Same like insert = delete and  update also 

alter PROCEDURE studentList  
AS  
BEGIN  
    SELECT * FROM 
	TAB_1 INNER JOIN 
    TAB_2 ON TAB_1.ID = Tab_2.id
	where tab_1.id =1
END;

exec studentList

SELECT * FROM TAB_1
SELECT * FROM TAB_2


Select GetDate() --AS 'CurrentDATETime';

Declare @value int      ---While loop in sql server
set @value = 1 
while @value <= 5 
Begin 
print('less than 5')
set @value = @value+ 1  
end
print('gretaer than 5')


DECLARE @stud_value INT;  
SET @stud_value = 1;  
WHILE @stud_value <= 5  
 BEGIN  
  PRINT 'Mark Henry';  
  SET @stud_value = @stud_value + 1;  
 END;  
PRINT 'Rose Bennet';  

create trigger a 
on employee 
for insert
as begin 
declare @id int
select @id =empid from inserted 
insert into emp_audit values 
(
'id is added : '+cast(@id as varchar(200))+ 'added at : '+cast(getdate() as varchar(200)) 
)
end 

select * from  emp --_audit
select * from employee 
insert into employee 
values 
(13,'jeeru','veeresh',90000,'adn');
(12,'veeru','sunny',20000,'ukd');

declare @name varchar(200), @gender  varchar(200)
declare csr cursor for
select name,gender from emp 
open csr 
fetch next from csr into @name, @gender 
while @@fetch_status = 0
begin 
select name,salary from emp 
fetch next from csr into @name,@gender 
end 
close csr
deallocate csr

exec csr 'shanthi','female'