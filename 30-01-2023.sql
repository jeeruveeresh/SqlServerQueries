SELECT * FROM ST;
SELECT DISTINCT Designation from st;

select substring(designation,1,3) from st;
Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh';
Select RTRIM(Designation)AS RTRIMS from ST;
Select LTRIM(Designation)AS LTRIMS from ST;
Select distinct len(Designation) from ST;
Select REPLACE(Designation,'a','A') from ST;
Select CONCAT(Name, ' ', id) AS 'COMPLETE_NAME' from ST;
Select * from ST order by Designation asc;
Select * from ST order by Name asc,Designation desc;
Select * from ST where Designation in ('SE','Team Lead');
Select * from ST where Designation NOT in ('SE','Team Lead');
Select * from ST where Designation like 'S%';
Select * from ST where Designation like '%a%';
Select * from ST where Designation like '%r';
Select * from ST where Designation like '___d';
Select * from ST where ID between 3 and 5;
Select * from ST where year(Effective_date) = 2014 and month(Effective_date)<=2000;
Select * from ST order by Designation asc 