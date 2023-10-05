create table team(
team1 varchar(35),
team2 varchar(35),
won varchar(35))
insert into team
values
('India','Australia','India'),
('India','England','England'),
('South Africa','India','India'),
('Australia','England',Null),
('England','South Africa','South Africa'),
('Australia','India','Australia')


with names as
(
select team1 as teams,won as result from team
union all
select team2 as teams,won as result from team
)
select teams,sum(case when result=teams
then 1 else 0 end)as wons from names
group by teams;

with names as
(
select team1 as teams,won as result from team
union all
select team2 as teams,won as result from team
)
select teams,count(teams)as matches_played,
sum(case when result=teams then 1 else 0 end)as matches_won,
sum(case when result!=teams then 1 else 0 end)as matches_lost,
sum(case when result is null then 1 else 0 end)as matches_tied
from names 
group by teams






select count(team1),count(team2) from team

