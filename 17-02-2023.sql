alter table names
add fulls varchar(20)

update names1
set fulls=fnm+lnm

select fnm,lnm,fulls from names