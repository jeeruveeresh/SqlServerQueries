create table sigma (
id int Primary key,
names varchar(300),
age int,
cgpa float,
remark bit 
);


Insert into  sigma (
id,names,age,cgpa,remark
)
values 
(1,'sunny',20,9.8,0),
(2,'veeru',20,9.9,0),
(3,'raj',20,7.9,0),
(4,'shailaja',20,9.5,0),
(5,'rohit',20,7.5,0),
(6,'sachin',20,8.5,0),
(7,'tendulkar',20,6.5,0),
(8,'umesh',20,5.5,0),
(9,'malli',20,9.5,0),
(10,'pawankalyan',20,9.5,0);

Insert into  sigma (
id,names,age,cgpa,remark
)
values 
(11,'tendulkar',20,6.5,0),
(12,'umesh',20,5.5,0),
(13,'malli',20,9.5,0),
(14,'pawankalyan',20,9.5,0);

select * from sigma

select names,age,count(*) 
from 
sigma 
group by 
names,age
having  count(*) > 1

select *,
rank() over ( order by age,cgpa asc) as ranks
from sigma 





update sigma 
set names = 'Ashwini'
where id = 8;

update sigma 
set names = 'Keziya'
where id = 7;

update sigma 
set remark = 1
where id = 1;

update sigma 
set remark = 1
where id = 8;

update sigma 
set age= 40
where id = 6;

update sigma 
set age= 35
where id = 8;

update sigma 
set age= 30
where id = 6;

update sigma 
set age= 45
where id = 9;

update sigma 
set age= 25
where id = 2;

update sigma 
set age= 24
where id = 1;


update sigma 
set remark = 1
where cgpa >= 9.0;

update sigma 
set names= 'Rohit',

exec sp_rename 'sigma.veeru', 'names', 'COLUMN';

exec sp_rename  '', 'ok';


select  * from sigma
pivot 
(
sum(age) for names in (sunny,veeru)
) as total

sp_rename 'TableName.oldcolumn_name', 'newcolumn_name', 'COLUMN'; // common_syntax

CREATE table department_table (
department_id int,
department_name varchar(300),
department_remark float,
department_active bit,
foreign key (department_id) references sigma (id)
);

select * from  department_table;

Insert into department_table (
department_id,
department_name,
department_remark,
department_active
)
values 
(1,'DATA-ENGINEER',2333.5,0),
(2,'UI/UX',73727.5,1),
(3,'FRONTENd',65743.5,1),
(4,'BACKEND',8274.5,0),
(5,'DATA-ANALYST',5463.5,1);

truncate table department_table;

select 
count(*) as a
from sigma right join department_table on 
sigma.id = department_table.department_id;

select * from department
order by dept_name
OFFSET 2 rows fetch next 1 rows only;

SELECT  
*  
FROM  
Department 
PIVOT  
( 
SUM(Dept_revenue) FOR Dept_name IN (IT,HR,Finance) 
) AS TOTAL


select * from tab_1 as a
intersect
select * from tab_2 as b;

select * from duplicate

delete a  from
(
select *,
row_number() over (partition by id,names,age order by age) as row_num
from duplicate
) AS a
where row_num >1

select * from duplicate

delete a  from
(
select names,age,count(*) as k
from duplicate 
group by names,age
)a
where k >1


select * from employee

with del (firstname,lastname,salary,address)
as
(
select * from employee
)

create table sub(
nm varchar(30)
)
insert into sub values ('veeru@123sunny')
insert into sub values ('sam@sunny')
insert into sub values ('rohit@sharma')
insert into sub values ('abc@def')
insert into sub values ('veeru@123sunny')

select * from sub

select substring(nm, 1,charindex('@',nm)-1) from sub  --before @veeru,sam .........
select substring(nm, charindex('@',nm)+1,len(nm)) from sub  --after @ 123sunny,sunny,......



cretae trigger tri 
on emp 
for insert 
as begin 
declare @id int,
declare @nm varchar(20)
select @id =id,@nm = nm from inserted