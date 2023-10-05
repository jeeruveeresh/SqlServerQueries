CREATE TABLE dept2
(empid int,
fn varchar(20),
city varchar(20),
designation varchar(30),
salary int,
dept int,
doj date
);

drop table dept2

insert into dept2 values 
(1,'veeru','adoni','hr',20000,'10','2010-01-03'),
(2,'sunny','hyd','hr',40000,'30','2021-05-01'),
(3,'sachin','mum','manager',10000,'40','2016-11-22'),
(7,'sony','secunderabad','developer',80000,'20','2022-09-01'),
(5,'puji','adoni','consultant',22000,'20','2005-03-01'),
(6,'sam','chennai','consultant',27000,'10','2009-05-01'),
(7,'sony','secunderabad','developer',80000,'20','2022-09-01'),
(1,'veeru','adoni','hr',20000,'10','2010-01-03'),
(1,'veeru','adoni','hr',20000,'10','2010-01-03');

select * from dept2



delete a from -----deleting duplicates by row_num
(
select *,
row_number() over (partition by dept order by salary) as rn 
from dept 
)a
where rn > 1

-- find nth highest salary 

select  salary from
(
select *,
dense_rank() over (order by salary desc) as k 
from dept2 
) as a 
where k = 1

-- get odd rows from a table 
select * from dept2
where empid%2 <> 0

-- get employees having same salaries 
select d1.empid,d1.fn,d1.salary from dept2 d1, dept2 d2
where d1.salary = d1.salary and d2.fn <> d2.fn


--get employees having same salaries 
select e1.id,e1.name,e1.salary from emp e1, emp e2 
where e1.id <> e2.id and e1.salary = e2.salary


--50% records 
SELECT *
FROM emp
WHERE id <= (SELECT count(id)/2 from emp);

--get below 5 people  dept 
select * from(
select empid,dept,salary,count(*) as k from dept2 
group by empid,dept,salary
) as j
where k < 3




