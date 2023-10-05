SELECT namek, doj
FROM empemp
ORDER BY doj
FETCH 2 ROWS
OFFSET 1 ROWS ONLY;
SELECT *FROM EMPEMP;

CREATE TABLE EVE
(
ID int, NM varchar(20),sal float, locations varchar(20),dates date)
insert into EVE values (100,'okay',20000,'hyd','2022-09-12'),(100,'okay',20000,'hyd','2022-09-12'),(200,'okay2',20050,'hyd2','2022-08-12'),(300,'okay3',20500,'hyd3','2022-07-11'),(400,'okay4',20800,'hyd4','2022-07-12'),(500,'okay5',21000,'hyd5','2022-06-11');

select * from (case(when id=300 then print(select* from eve) )else print 'okay')end)



select *,
row_number() over(partition by month(dates) order by month(dates),year(dates)) from eve;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

[18:13] Veeresh Jeeru

CREATE TABLE table_1 (
id int,
name varchar(300),
type_emp varchar(300) 
)
 
insert into table_1 
values 
(1,'a','fte'),
(2,'b','contractor'),
(3,'c','fte'),
(4,'d','contractor');
 
CREATE TABLE table_2 (
id int,
hours_logged int
)
 
insert into table_2 
values 
(1,10),
(2,20),
(3,30);
 
select * from table_2
 
select (
(fte /fte +contractor) * 100 as fte_percentage,
(contractor/(fte+contractor)) * 100 as contract_percentage
(
select
table_1.type_emp,
sum(table_2.hours_logged) as t_h
from
table_1 inner join table_2  on table_1.id = table_2.id 
group by type_emp ) as a
pivot
(
sum(t_h) for type_emp in (contractor,fte)
) p;
)a;

