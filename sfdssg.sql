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
--Total number of matches played

select india from(select count('won') as india from team
where won='india') as india

select SouthAfrica from(select count('won') as SouthAfrica from team
where won='South Africa') as SouthAfrica

select Australia from(select count('won') as Australia from team
where won='Australia') as Australia

select England from(select count('won') as England from team
where won='England') as England



--Total number of matches won
select count('won')from team
union all
--Total number of matches tied

Select count('won')from team
where won='india'
UNION all
Select count('won')from team
where won='Australia'
UNION all
select count('won')from team
where won='England'
union all
select count('won')from team
where won='South Africa'

where won is Null
--Total lost match match for each team
select count('won') as win from 


select distinct team1 from team
union
select distinct team2 from team

with max as(
select  team1
 as teams, won as result from team
union all
select team2 
as teams, won as result from team)













