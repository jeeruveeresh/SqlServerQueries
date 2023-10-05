create table etl_test_case_matches
(team varchar(20))

insert into etl_test_case_matches values ('INDIA')
insert into etl_test_case_matches values ('PAKISTHAN')
insert into etl_test_case_matches values ('SOUTH AFRIKA')
insert into etl_test_case_matches values ('WEST INDIES')
insert into etl_test_case_matches values ('AUSTRALIA')

select a.team+' vs '+b.team as schudule from etl_test_case_matches as a
join etl_test_case_matches as b on a.team>b.team
order by a.team,b.team
------------------------------------------------------------------------------------------------------

create table etl_test_case_tbl1(
id int,
name varchar(5)
);

insert into etl_test_case_tbl1 values(1,'A'),(2,'B'),(3,'C'),(4,'D'),(6,'E'),(8,'F')
select * from etl_test_case_tbl1

create table etl_test_case_tbl2(
id int,
age int
);

insert into etl_test_case_tbl2 values(1,24),(2,25),(5,26),(6,28)

select * from etl_test_case_tbl1;
select * from etl_test_case_tbl2;

--display ids and names which do not have age
select a.id,a.name from etl_test_case_tbl1 as a left join etl_test_case_tbl2 as b
on a.id=b.id 
where b.age is null 

---display the id and age which do not have name
select b.id,b.age from etl_test_case_tbl1 as a right join etl_test_case_tbl2 as b
on a.id=b.id
where a.name is null

---display the id which have name and age
select a.id from etl_test_case_tbl1 as a join etl_test_case_tbl2 as b
on a.id=b.id;
-----------------------------------------------------------------------------------------------------------------------
create table etl_test_case2(
from_city varchar(20),
to_city varchar(20),
distance int);

insert into etl_test_case2 values('a','b',100);
insert into etl_test_case2 values('b','a',100);
insert into etl_test_case2 values('c','d',100);
insert into etl_test_case2 values('d','c',100);
insert into etl_test_case2 values('e','f',100);
insert into etl_test_case2 values('f','e',100);

select  * from etl_test_case2


select from_city, to_city,distance from (
select from_city, to_city,
case when from_city = lead(to_city) over(order by distance) then distance else 0 end as distance
from etl_test_case2) as a
where a.distance <> 0


with cte as
(select from_city,to_city,distance,lag(to_city) over (order by to_city) as lg from etl_test_case2)
select from_city,to_city,distance from cte where from_city=lg;
---------------------------------------------------------------------------------------------------------------------------
create table etl_test_case3_tbl1(id int);
insert into etl_test_case3_tbl1 values(1),(1),(1),(2),(3),(3),(3);

create table etl_test_case3_tbl2(id int);
insert into etl_test_case3_tbl2 values(1),(1),(2),(2),(4),(null);

select * from etl_test_case3_tbl1;
select * from etl_test_case3_tbl2;

select count(*) as rec_count from etl_test_case3_tbl1 as a join etl_test_case3_tbl2 as b 
on a.id=b.id 
-----------------------------------------------------------------------------------------------------------------------------

create table etl_test_case4(
Name varchar(5));
insert into etl_test_case4 values('A'),('B'),('C'),('D'),('E'),('F')

select * from etl_test_case4;

select name+',' from etl_test_case4
for xml path('');

select string_agg(name,',') from etl_test_case4
------------------------------------------------------------------------------------------------------------------------------

create table etl_test_case5_tbl2
(amount varchar(10))

insert into etl_test_case5_tbl2 values('110.23'),('23.45'),('45.67');

select * from etl_test_case5_tbl2

select substring(amount,1,charindex('.',amount)-1)as rupees,
substring(amount,charindex('.',amount)+1,len(amount)) as paise 
from etl_test_case5_tbl2

--------------------------------------------------------------------------------------------------------------------------------------

create table etl_test_case6
(candidates varchar(5),
HR_Activity varchar(50),
start_date date,
end_date date)

insert into etl_test_case6 values('a','tech interview-round1','10-01-2022','10-10-2022')
insert into etl_test_case6 values('a','tech interview-round2','10-11-2022','10-20-2022')
insert into etl_test_case6 values('a','HR-interview','10-21-2022','10-31-2022')
insert into etl_test_case6 values('a','onboarding','11-01-2022','11-05-2022')
insert into etl_test_case6 values('b','HR-interview','11-06-2022','11-10-2022')
insert into etl_test_case6 values('c','tech interview-round2','11-11-2022','11-15-2022')
insert into etl_test_case6 values('c','HR-interview','11-16-2022','11-20-2022')
insert into etl_test_case6 values('c','onboarding','11-21-2022','11-22-2022')


select * from etl_test_case6;

select * from etl_test_case6
where candidates in(
select candidates from etl_test_case6
group by candidates having count(*)  = 1 ) 
union all
select candidates,hr_activity,start_date,end_date from (
select *,ROW_NUMBER() over (partition by candidates order by end_date desc)as rn from etl_test_case6
) as a
where rn = 2

select name+',' from etl_test_case4
for xml path('')
select string_agg(name,',') from etl_test_case4


select * from [dbo].[Comp_Rev_Est_SCD2_Dim]
select * from [dbo].[Comp_Rev_Est_SCD2_source]


create table #temp(
id int);

select * from #temp