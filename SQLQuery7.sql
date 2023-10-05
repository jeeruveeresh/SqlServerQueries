
----SCALAR FUNCTION----

CREATE TABLE Employee                                                         
( 
 EmpID int PRIMARY KEY, 
 FirstName varchar(50) NULL, 
 LastName varchar(50) NULL, 
 Salary int NULL, 
 Address varchar(100) NULL,
) 

drop table employee

--Insert Data 
Insert into Employee(EmpID,FirstName,LastName,Salary,Address)
Values
(1,'Mohan','Chauahn',22000,'Delhi'),
(2,'Asif','Khan',15000,'Delhi'),
(3,'Bhuvnesh','Shakya',19000,'Noida'), 
(4,'Deepak','Kumar',19000,'Noida'); 

--See created table 
Select * from Employee 

--creating function

Create function fnGetEmpFullName2
( 
 @FirstName varchar(50), 
 @LastName varchar(50) 
)
returns varchar(101) 
As 
Begin
return
(Select @FirstName + ' '+ @LastName);  
end

--calling created function

Select
dbo.fnGetEmpFullName2(FirstName,LastName) as Full_Name,
Salary 
from Employee 

=======================================================================================================================
--TABLE_VALUED_FUNCTIONS

-----student table----
CREATE TABLE student ( 
    id INT PRIMARY KEY, 
    name VARCHAR(50) NOT NULL, 
    gender VARCHAR(50) NOT NULL, 
    DOB datetime NOT NULL, 
    total_score INT NOT NULL,   
 ) 
 
INSERT INTO student 
VALUES (1, 'Jolly', 'Female', '12-JUN-1989', 500),  
(2, 'Jon', 'Male', '02-FEB-1974', 545),  
(3, 'Sara', 'Female', '07-MAR-1988', 600),  
(4, 'Laura', 'Female', '22-DEC-1981', 400),  
(5, 'Alan', 'Male', '29-JUL-1993', 500),  
(6, 'Kate', 'Female', '03-JAN-1985', 500),  
(7, 'Joseph', 'Male', '09-APR-1982', 643),  
(8, 'Mice', 'Male', '16-AUG-1974', 543),  
(9, 'Wise', 'Male', '11-NOV-1987', 499),  
(10, 'Elis', 'Female', '28-OCT-1990', 400);

------------------INLINE ---------------

CREATE FUNCTION BornBefore3 
( 
--@DOB AS DATETIME
@name varchar(200),
@total_score int
) 
RETURNS TABLE 
AS 
RETURN 
SELECT * FROM student
where total_score > @total_score
--WHERE DOB    < @DOB 

-----Executing an Inline Table-valued Function--- 

SELECT  
	name, gender, DOB,total_score 
FROM 
	dbo.BornBefore3('Mice',400); --'1985-01-01');

select * from student

---------Multilevel_Function-------

CREATE TABLE teacher ( 
    id INT PRIMARY KEY, 
    name VARCHAR(50) NOT NULL, 
    gender VARCHAR(50) NOT NULL, 
    DOB datetime NOT NULL,   
 ) 

INSERT INTO teacher 
VALUES (1, 'Rick', 'Male', '05-APR-1965'),  
(2, 'Shack', 'Male', '03-JUN-1972'),  
(3, 'Zack', 'Male', '04-MAR-1969'),  
(4, 'Elis', 'Female', '28-NOV-1959'),  
(5, 'Mint', 'Female', '29-DEC-1971');


CREATE FUNCTION GetBornBetween2
 (
 @YearAfter AS DATETIME,
 @ETURNS @People TABLE
(
	Name VARCHAR (MAX),
	Gender VARCHAR(MAX),
	DOB DATETIME,
	Job VARCHAR(10)
)
AS
BEGIN
		INSERT INTO @People
			SELECT name, gender, DOB, 'student' as job
			FROM student
			WHERE DOB BETWEEN @YearAfter AND @YearBefore
			
		INSERT INTO @People
			SELECT name, gender, DOB, 'teacher' as job
			FROM teacher
			WHERE DOB BETWEEN @YearAfter AND @YearBefore
		RETURN
END

drop function GetBornBetween
----------Execute ML-table value-----------------

SELECT * FROM 
	GetBornBetween2('1960-01-01', '1985-12-31')

select * from emp;

create table my_tab(
id int,
nm varchar(300),
salary float,
dept varchar(300)
);

insert into my_tab
values 
(100,'ab',10000,'hr'),
(101,'bc',20000,'hr'),
(102,'cd',30000,'it'),
(103,'de',40000,'it'),
(104,'ef',50000,'support'),
(105,'gh',60000,'support');

select 
nm,
dept,
sum(salary) as total_salary
from 
my_tab
group by dept,nm;

select    
sum( CASE when dept = 'hr' then salary else 0 end ) as HR,
sum( CASE when dept = 'it' then salary else 0 end ) as IT,
sum( CASE when dept = 'support' then salary else 0 end ) as SUPPORT
from my_tab

select *,first_value(salary) over  from salary 
order by salary






