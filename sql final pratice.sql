==while loop=====================


declare @id int
set @id =1 
while(@id <= 10)
begin
set @id = @id +1
end
go

declare @id int
set @id =1
while (@id<=10)
begin
   print 'the id value is :' +cast(@id as varchar(100))
   set @id = @id +1 
end
go


declare @id int
set @id =1
while (@id <= 10)
begin
print @id
end 
go

declare @id int
set @id = 1
while (@id <= 10)
begin
print @id
if @id = 7
break;
set @id = @id +1
end
go

=================group by ,order by================
select *from motivity
select name,max(sal) as max_sal from motivity group by name order by max_sal desc
===============================




