--------------------------------------------------TRIGGERS-----------------------------------------------------------------------
--What is trigger?
--SYNTAX:
create trigger triggername
on tablename
after/before [insert,update,delete]
[Not for replication]
as 
{sql statements}
----------------------------------------------CREATING A TABLE--------------------------------------------------------------------
CREATE TABLE triggerok(
ID int primary key,name varchar(50),salary int, Gender varchar(12), Dept int);
------------------------------------------INSERTING VALUES TO A TABLE------------------------------------------------------------------
insert into triggerok values(1,'aa',5000,'M',2),(2,'bb',5500,'F',3),(3,'cc',8000,'M',1),(4,'aa',5000,'M',1),(5,'aa',5000,'M',2);
----------------------------------------------CREATING A TABLE2---------------------------------------------------------------------
create table audittest
(id int identity,auditt text);
------------------------------------------INSERTING VALUES TO A TABLE2 USING TRIGGER--------------------------------------------------------------------
create trigger triggertest
on triggerok
for insert
as 
begin
declare @id int
select @id=id from inserted
insert into audittest
values('New employee  with id='+cast(@id as varchar(10))
+'is added at'+cast(getdate() as varchar(22)))
end

--after creating trigger please add the following record into the table

insert into triggerok values(8,'ef',7800,'f',3);

SELECT * FROM triggerok;
SELECT * FROM audittest;
------------------------------------------DELETING VALUES TO A TABLE2 USING TRIGGER--------------------------------------------------------------------
create trigger triggerdelete2
on triggerok
for DELETE
as 
begin
declare @id int
select @id=id from inserted
Delete from audittest
where id=2;
end

delete from triggerok
where id=6;

select * from audittest;
------------------------------------------UPDATING VALUES TO A TABLE2 USING TRIGGER--------------------------------------------------------------------
create trigger triggerdelete3
on triggerok
for update
as 
begin
declare @id int
select @id=id from inserted
update audittest
set auditt='okay its done'
end



update triggerok
set Gender='f'
where id=10;




