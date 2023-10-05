-------------------------------------------------------------------CREATING A TABLE FOR STORED PROCEDURE----------------------------------------------------------------------------
CREATE TABLE spcheck  
(  
ID INT NOT NULL,   
Name varchar(100),  
Course varchar(50),  
Age int,   
Marks float,
statusof bit
);   
INSERT INTO spcheck VALUES (101, 'Anuj', 'B.tech', 20, 88,1);  
INSERT INTO spcheck VALUES (102, 'Raman', 'MCA', 24, 98,1);  
INSERT INTO spcheck VALUES (104, 'Shyam', 'BBA', 19, 92,0);  
INSERT INTO spcheck VALUES (107, 'Vikash', 'B.tech', 20, 78,0);  
INSERT INTO spcheck VALUES (111, 'Monu', 'MBA', 21, 65,1);  
INSERT INTO spcheck VALUES (114, 'Jones', 'B.tech', 18, 93,1);  
INSERT INTO spcheck VALUES (121, 'Parul', 'BCA', 20, 97,0);  
INSERT INTO spcheck VALUES (123, 'Divya', 'B.tech', 21, 89,1);  
INSERT INTO spcheck VALUES (128, 'Hemant', 'MBA', 23, 90,0);  
INSERT INTO spcheck VALUES (130, 'Nidhi', 'BBA', 20, 88,1);  
INSERT INTO spcheck VALUES (132, 'Priya', 'MBA', 22, 99,0);  
INSERT INTO spcheck VALUES (138, 'Mohit', 'MCA', 21, 92,1);
select * from spcheck;
 -------------------------------------------------CREATING A STORED PROCEDURE------------------------------------------------------------------
create procedure spselect
as 
select * from spcheck
 ----------------------------------------------EXECUTING THE CREATED STORED PROCEDURE---------------------------------------------------------------
exec spselect
 --------------------------------------------CREATING STORED PROCEDURE WITH ONE PARAMETER-----------------------------------------------------
create procedure sppara @student_course varchar(200)
as
select * from spcheck where spcheck.Course=@student_course;
 ----------------------------------------------EXECUTING THE CREATED STORED PROCEDURE---------------------------------------------------------------
exec  sppara @student_course='mca'
exec sppara @student_course='b.tech'
---------------------------------------------STORED PROCEDURE WITH MULTIPLE PARAMETERS--------------------------------------------------------------
Create procedure spmulti @age int,@marks float
as
select * from spcheck where Age=@age and Marks=@marks
 ----------------------------------------------EXECUTING THE CREATED STORED PROCEDURE---------------------------------------------------------------
exec spmulti @age=20,@marks=88;
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  GROUP BY USAGE IN SQL  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
-------------------------------------------------------GROUP BY WITH AGGREGATE FUNCTION------------------------------------------------------------
select name,sum(marks) as total from spcheck
group by name

select COurse,count(*) as count
from spcheck
group by Course
-----------------------------------------------------GROUP BY WITH HAVING CLAUSE--------------------------------------------------------------------------
select Course,sum(marks) from spcheck
group by Course
having SUM(MARKS)>250
---------------------------------------------------ADD A COLUMN--------------------------------------------------------------------------------------
ALTER TABLE SPCHECK
ADD DRUGTEST BIT;
---------------------------------------------------DELETING A COLUMN------------------------------------------------------------------------------
ALTER TABLE SPCHECK
DROP COLUMN DRUGTEST
----------------------------------------------------CAST FUNCTION IN SQL----------------------------------------------------------------------------
SELECT NAME,CAST(MARKS AS INT)
MARKS FROM spcheck;
-------------------------------------------------CAST FUNCTION IN SQL-2------------------------------------------------------------------------------
SELECT NAME,CAST(MARKS AS FLOAT)
MARKS FROM spcheck;
------------------------------------------------TRIGGERS AND HOW TO USE IT---------------------------------------------------------------------------------
Create table emptrig
(
id int, nm varchar(200), doj date, exps int)

insert into emptrig values(101,'ab','2020-01-23',' '),(102,'bc','1998-07-22',' '),(103,'cd','2020-01-23',' '),(104,'de','1985-05-24',' ')
--------------------------------------------------INSERT TRIGGER FOR TABLE--------------------------------------------------------------
create trigger updtrig
on emptrig
for insert
as
begin

update emptrig
set exps= datediff(year,doj,getdate())
end
;
---------------------------------------------------UPDATE TRIGGER FOR TABLE-----------------------------------------------------------
create trigger updtrig1
on emptrig
for update
as 
begin
update emptrig
set exps=datediff(year,doj,getdate())
PRINT 'Exp is updated'
end
;





