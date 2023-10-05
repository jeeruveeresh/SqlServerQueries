create table cricket
(
team_1 varchar(50),
team_2 varchar(50),
won varchar(50)
)
insert into cricket values('india','australia','india')
insert into cricket values('india','england','england')
insert into cricket values('southafrica','india','india')
insert into cricket values('australia','england',null)
insert into cricket values('england','southafrica','southafrica')
insert into cricket values('australia','india','india')

select * from cricket
drop table cricket

with cte as
(
select team_1 as team, won from cricket 
union all 
select team_2 as team,won from cricket
)
select team,
count(*) as total_matches,
sum(case when won = team  then 1 else 0 end) M_W,
sum(case when won !=  team then 1 else 0 end) M_L,
sum(case when won  is null then 1 else 0 end) M_T
from cte  
group by team


select distinct team_1, 
count(*) as t_m, 
sum(case when (team_1 = won) then 1 else 0 end) AS m_w, 
sum(case when (team_1 = team_2) then 1 else 0 end) AS m_tied, 
sum(case when (team_1 <> won  AND team_1 <> team_2) then 1
ELSE 0
END) AS m_lost
FROM cricket
group by team_1
union all
select distinct  team_2, 
count(*) AS Total_Matches, 
sum(case when (team_2 = won) then 1 else 0 end) as m_w, 
sum(case when (Team_1 = team_2) then 1 else 0 end) as m_tied, 
sum(case when (Team_2 <> Won  AND team_1 <> team_2 ) then 1
else 0
end) as m_lost
from cricket
group by team_2;

select * from cricket


create table stu_table (
stu_name varchar(40),
Total_marks int,
years int
)

insert into stu_table values 
('rahul',90,2010),
('sanjay',80,2010),
('Mohan',70,2010),
('rahul',90,2011),
('sanjay',85,2011),
('mohan',65,2011),
('rahul',80,2012),
('sanjay',80,2012),
('mohan',90,2012);



--Method_ONE with Sub-Queries
select stu_name,total_marks,years,prev_y_marks from 
(
select  stu_name,total_marks,years,
(case when total_marks >= p_y_m then p_y_m else 0 end) as prev_y_marks
from
(
select  stu_name,total_marks,years,lag(years) over 
(partition by stu_name order by  years) as y,
lag(total_marks) over  (partition by stu_name order by  years) as p_y_m
from stu_table
)as k
) as pym
where prev_y_marks > 0

--Method_TWO with CTE
with cte 
as (
	select  stu_name,total_marks,years,
	(case when total_marks >= p_y_m then p_y_m else 0 end) as prev_y_marks
	from
(
	select  stu_name,total_marks,years,lag(years) over 
	(partition by stu_name order by  years) as y,
	lag(total_marks) over  (partition by stu_name order by  years) as p_y_m
	from stu_table
	)as k
) 

select * from cte
where prev_y_marks > 0












