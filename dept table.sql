CREATE TABLE dept 
(empid int primary key,
fn varchar(20),
city varchar(20),
designation varchar(30),
salary int,
dept int,
doj date
);

drop table dept

insert into dept values 
(1,'veeru','adoni','hr',20000,'10','2010-01-03'),
(2,'sunny','hyd','hr',40000,'30','2021-05-01'),
(3,'sachin','mum','manager',10000,'40','2016-11-22'),
(4,'suma','delhi','support',22000,'30','2001-12-01'),
(5,'puji','adoni','consultant',22000,'20','2005-03-01'),
(6,'sam','chennai','consultant',27000,'10','2009-05-01'),
(7,'sony','secunderabad','developer',80000,'20','2022-09-01'),
(8,'nani','camp','IT',40000,'30','2020-04-01'),
(9,'hema','vizag','frontend',50000,'20','2020-06-01'),
(10,'prakash','vijayawada','backend',90000,'10','2020-02-01'),
(11,'naveen','nellore','backend',60000,'40','2023-01-01'),
(12,'venkat','adn','hr',20000,'40','2020-12-01'),
(13,'sudheer','adn','hr',20000,'10','2022-01-01'),
(14,'veeru','adn','hr',20000,'20','2010-11-01'),
(15,'veeru','adn','hr',20000,'10','2020-12-01');


select * from dept
select * from
(
select fn,dept,salary,count(*) as dup 
from dept 
group by fn,dept,salary
having dup > 1

select fn,dept,salary,
row_number() over (partition by salary,dept order by salary) as rn
from dept

) as a
where dup > 1


with cte
as
(
select dept,salary,
dense_rank() over(partition by dept order by salary desc) as rownum 
from dept 
)

where k.rownum <=3

create view sunny
as
(
select empid,fn,salary,dept,
dense_rank() over(partition by dept  order by salary) as rownum 
from dept
)

select * from sunny
where rownum <=3

select * from emp	
where year(doj) = 2020 and exp >1

select *,
dense_rank() over (partition by dept order by salary) as rn
from emp 