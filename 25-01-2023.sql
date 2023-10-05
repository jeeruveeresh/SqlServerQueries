create table  meeting
(
id int, name varchar(100), salary float, dept varchar(100)
)

INSERT INTO meeting
VALUES 
(123,'ab',10000,'HR'),
(124,'bc',20000,'HR'),
(125,'cd',20000,'IT'),
(126,'de',30000,'Support'),
(127,'ef',15000,'IT'),
(128,'fg',25000,'Support')

select dept, sum(salary) as tot from meeting
group by dept

select sum(case when dept='HR' then salary else 0 end)as HR,
 sum(case when dept='IT' then salary else 0 end)as IT,
 sum(case when dept='Support' then salary else 0 end)as support 
 from meeting;

 select id,name,dept,sum(salary) from meeting
 group by id;
 ------------------------------------------------CURSORS------------------------------------------------------------------------
 --It updates the values row by row
 --Syntax for cursor(types of cursors will confuse us, so don't need to go with the types of cursors)
 select * from emptrig

 declare @exps int,@id int;
 declare cursorname cursor
 for select ID=@id
 from emptrig;
 open cursorname;
 update emptrig 
 set exps=datediff(year,doj,getdate())
 fetch next from cursorname
 into @exps;
 while @@FETCH_STATUS=0
 fetch next from cursorname into @exps
 close cursorname
 deallocate cursorname


 select * from emptrig

-------------------------------------------------------practice with multi line-----------------------------------------------------
 create table empcur
 (
 id int,
 nm varchar(20),
 doj date, 
 expss int)
 insert into empcur(id,nm,doj)values(1,'aa','1999-06-18')
 
 select * from empcur
 -
 declare @id int, @nm varchar(20), @doj date
 declare okcursor cursor for
 select id, nm, doj from empcur
 open okcur
 fetch next from okcursor into @id,@nm,@doj
 while @@FETCH_STATUS=0
 begin
 print
 ('Successfully read the record')
 fetch next from cursorname into @id,@nm,@doj
 end
 close okcursor
 deallocate okcusror

 select * from empcur
---------------------------------------------------------------CURSOR PRACTICE-----------------------------------------------------------3
DECLARE @id int
declare cursors cursor for 
select id from emptrig
open cursors
fetch next from cursors into @id--fetch the position of cursor
while @@FETCH_STATUS=0--if the position is correct if will show the output whenever the condition is
--true the loop will be executed,
--if false then it will just show the 0
begin --apply the loop
update emptrig set exps=DATEDIFF(year,doj,getdate()) where id=@id
--print('exp is updated for: '+cast(@id as vachar(20))
fetch next from cursors into @id--come out of the loop
end 
close cursors
deallocate cursors;

select * from emptrig

insert into emptrig(id,nm,doj) values (107,'ghg','1995-01-23')

-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>CURSOR PRACTICAL<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
create table loc(
id int,
nms varchar(20),
city varchar(20),
locations varchar(20)
)
insert into loc(id,nms,city) values(180,'ab','hyd'),(181,'bc','ny'),(182,'cd','hyd'),(183,'de','ny'),(184,'ef','hyd')

select * from loc

declare @idx int,@locations varchar(200)
declare okay cursor
for select 
id,locations 
from loc
open okay
fetch next from okay into 
@idx, @locations
while @@FETCH_STATUS=0
begin
print @idx+cast(@locations as varchar(200))
fetch next from okay into @idx,@locations
end
close okay
deallocate okay;







