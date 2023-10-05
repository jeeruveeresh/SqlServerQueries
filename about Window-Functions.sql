							--LAG_FUNCTION
							--=============
select * from employee

--DEF: used to access prev_rows data along with current row data.
--example
--syntax select col_1,col_2.., lag(col_name,offset,default_value) over (partition by col_name order by desc/asc) from tab_name
select firstname,lastname,salary, lag(salary,2,0)
over (order by salary) as prev_row 
from employee


							--LEAD_FUNCTION
							--================
--DEF: used to access subsequent(NEXT) rows data along with current row data.
--syntax select col_1,col_2.., lag(col_name,offset,default_value) over
--(partition by col_name order by desc/asc) as temp_col from tab_name
--example
select firstname,lastname,salary, lead(salary,1,0)
over (order by salary asc) as prev_row 
from employee


                         --FIRST_VALUE and LAST_VALUE
                         --===========================
--first_value return the 1st value from a specified col_name,that to order by col_name 
--syntax select col_names first_value(col_name) over order by(partition by col_name order by asc/desc) from tab_name

select address, salary, last_value(salary) 
over
(order by salary rows between unbounded preceding and unbounded following) as emp_sal
from employee

--concatination
select *,
concat(firstname,+''+lastname)as Full_Name from employee

exec stored_procedure;

--to view available stored procedures 

SELECT ROUTINE_SCHEMA, ROUTINE_NAME  
FROM INFORMATION_SCHEMA.ROUTINES  
WHERE ROUTINE_TYPE = 'PROCEDURE';  


----to delete stoder procedures
IF OBJECT_ID ('procedure_name', 'P') IS NOT NULL     
DROP PROCEDURE procedure_name;  

CREATE TABLE lead_tab (
names varchar(200),marks int,year int
)

insert into lead_tab 
values 
('ab',95,2020),
('bc',80,2020),
('cd',75,2021),
('de',68,2020),
('ef',100,2020),
('fg',90,2021),
('gh',60,2021);

select 
*, lead(marks,1,0) over 
(order by year desc) as lead_year,
lag(year,1,0) over 
(order by year desc) as lag_year from lead_tab

select 
*, lag(year,1,0) over 
(order by year desc) as lag_year from lead_tab

select 
*, lead(year,1,0) over 
(order by year desc) as lead_year from lead_tab


select names,marks,year, last_value(marks) 
over (partition by year order by year ) as k 
from lead_tab



select round((cast(FTE as float)/(FTE+Contractor))*100,2) as Hours_logged_by_FTE, 
round((cast(Contractor as float)/(FTE+Contractor))*100,2) as Hours_logged_by_Contractor 
from( 
select * from( 
select 
table_1.type_emp, 
sum(table_2.hours_logged) as t_h 
from 
table_1 inner join table_2  on table_1.id = table_2.id  
group by type_emp ) as a 
pivot 
( 
sum(t_h) for type_emp in (contractor,fte) 
) p 
) as pivot_table; 

 
