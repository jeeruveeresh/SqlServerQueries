select * from emp
pivot --------1 (by using pivot operator we can create pivot in sql server but not in my sql)

select * from emp           ---------------2
order by name asc
OFFSET 2 ROWS 
FETCH NEXT 10 ROWS ONLY;

select getdate()         ---------3

select                   ------------4
name,
len(gender) as len_gender,dept
from emp

select ('abc'+'def')  -------------------5

select newid()      --------6     to create a unique value
select uuid()       ------            (Universally Unique IDentifier).

