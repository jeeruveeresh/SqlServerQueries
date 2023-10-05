                            --LAG_FUNCTION
                            --=============

select * from employee --DEF: used to access prev_rows data along with current row data.

->>>>>>>>>>>>>-->>>>>>>>>>>>>>>>>>>>>LAG syntax<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
--syntax select col_1,col_2.., 
--lag(col_name,offset,default_value) 
--over(partition by col_name 
--order by desc/asc) from tab_name
--->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>LAG example<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
select firstname,lastname,salary, 
lag(salary,1,0) 
over (order by salary) 
as prev_row from employee 

                            --LEAD_FUNCTION
                            --================

--DEF: used to access subsequent(NEXT) rows data along with current row data.
->>>>>>>>>>>>>-->>>>>>>>>>>>>>>>>>>>>LAG syntax<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
--select col_1,col_2.., 
--lag(col_name,offset,default_value) 
--over(partition by col_name order by desc/asc) as from tab_name

--->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>LAG example<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--example
select firstname,lastname,salary, 
lead(salary,1,0) 
over (order by salary) 
as prev_row from employee 


                         --FIRST_VALUE and LAST_VALUE
                         --===========================


--first_value return the 1st value from a specified col_name,that to order by col_name 
--syntax select col_names first_value(col_name) over order by(partition by col_name order by asc/desc) from tab_name
select address,salary, last_value(salary)
over (order by salary rows between unbounded preceding and unbounded following) from employee --concatination
select *,concat(firstname,+''+lastname)as Full_Name from employee exec stored_procedure; --to view available stored procedures SELECT ROUTINE_SCHEMA, ROUTINE_NAME  
FROM INFORMATION_SCHEMA.ROUTINES  
WHERE ROUTINE_TYPE = 'PROCEDURE';   
----to delete stoder procedures
IF OBJECT_ID ('procedure_name', 'P') IS NOT NULL     
    DROP PROCEDURE procedure_name;  


select address,salary, last_value(salary) 
over (order by salary rows between unbounded preceding and unbounded following) as emp_sal
from employee

----------------------------------------CREATE TABLE FOR LEAG AND LAG---------------------------------------------

 [dbo].[Employee]
   SET [EmpID] = <EmpID, int,>
      ,[FirstName] = <FirstName, varchar(50),>
      ,[LastName] = <LastName, varchar(50),>
      ,[Salary] = <Salary, int,>
      ,[Address] = <Address, varchar(100),>
WHERE <Search Conditions,,>

CREATE TABLE EMPE(EmpID int,FirstName varchar(50),LastName varchar(50),Salary int,Address varchar(100))
INSERT EMPE VALUES
(101,'veeru','sunny',10000,'kurnool'),
(102,'rohit','sharma',20000,'mum'),
(103,'sachin','tendulkar',30000,'hyd'),
(104,'raj','sheker',40000,'che');

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>	LAG	<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
select * from empe
select firstname,lastname,lastname,
lag(salary,2,0)
over(order by salary)
from empe


CREATE TABLE EMPF(Name varchar(50),MARKS INT, YEAR INT)
INSERT EMPF VALUES
('AB',95,2020),
('BD',80,2020),
('CD',75,2021),
('DE',68,2020),
('EF',100,2020),
('AB',90,2021),
('DE',60,2021)
------------------------------- LEAD MARKS AND LAG YEAR-----------------------------------------------
select *,
lead(MARKS,1,0)over (order by year desc) as marks, lag(year,1,0) 
over (order by year desc)
as years from empf
------------------------------- LEAD MARKS AND LAG MARKS-----------------------------------------------
select *,
lead(MARKS,1,0)over (order by year desc) as marks, lag(MARKS,1,0) 
over (order by year desc)
as years from empf

--select *,
--lag(year,1,0) 
--over (partition by year order by year desc)
--as years2 from empf
---------------------------------LEAD MARKS AND ORDERBY MARKS--------------------------------------------------
select *,
lead(MARKS,1,0)
over (order by year desc)
as MARKS1 from empf
---------------------------------LAG MARKS AND ORDERBY MARKS--------------------------------------------------
select *,
LAG(MARKS,1,0)
over (order by year desc)
as MARKS2 from empf
---------------------------------LEAD YEARS AND ORDERBY YEARS--------------------------------------------------
select *,
LEAD(YEAR,1,0)
over (order by year desc)
as Years1 from empf
---------------------------------LAG YEARS AND ORDERBY YEARS--------------------------------------------------
select *,
LAG(YEAR,1,0)
over (order by year desc)
as Years1 from empf
---------------------------------LAG AND LEAD PROFIT OR LOSS--------------------------------------------------
SELECT NAME,MARKS,YEARS1(
select *,
LAG(YEAR,1,0)
over (order by year desc)
as Years1 from empf)FROM EMPF
---------------------------------LAG PARTITION BY YEAR--------------------------------------------------
SELECT *FROM EMPF
select *, 
lag(MARKS,1,0) 
over (PARTITION BY YEAR order by MARKS) 
as prev_row from EMPF 
---------------------------------LEAD PARTITION BY YEAR--------------------------------------------------
select *, 
lead(MARKS,1,0) 
over (PARTITION BY YEAR order by MARKS) 
as prev_row from EMPF 
---------------------------------First_value PARTITION BY YEAR--------------------------------------------------
select *,first_value(marks) over(partition by year order by year desc)as fv1 from empf
---------------------------------Last_value PARTITION BY YEAR--------------------------------------------------
select *,Last_value(marks) over(partition by year order by year desc)as lv1 from empf
---------------------------------Last_value order by marks--------------------------------------------------
select *,Last_value(marks) over(partition by year order by marks desc)as lv2 from empf
---------------------------------first_value order by marks--------------------------------------------------
select *,first_value(marks) over(partition by year order by marks desc)as fv2 from empf


CREATE FUNCTION BornBefore?
(?
@DOB AS DATETIME?
)?
RETURNS TABLE?
AS?
RETURN?
SELECT * FROM student?
WHERE DOB < @DOB











CREATE FUNCTION GetBornBetween?
(?
@YearAfter AS DATETIME,?
@YearBefore AS DATETIME?
)?
RETURNS @People TABLE?
(?
Name VARCHAR (MAX),?
Gender VARCHAR(MAX),?
DOB DATETIME,?
Job VARCHAR(10)?
)?
AS?
BEGIN?
INSERT INTO @People?
SELECT name, gender, DOB, 'student'?
FROM student?
WHERE DOB BETWEEN @YearAfter AND @YearBefore?
?
INSERT INTO @People?
SELECT name, gender, DOB, 'teacher'?
FROM teacher?
WHERE DOB BETWEEN @YearAfter AND @YearBefore?
?
RETURN?
END
