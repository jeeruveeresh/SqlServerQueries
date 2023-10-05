select * from [dbo].[OLEDBDest]

select 
UPPER(SUBSTRING(firstname,1,1)) + LOWER(SUBSTRING(firstname,FINDSTRING(firstname," ",1)+2,LEN(firstname)-FINDSTRING(firstname," ",1)-1))
as k
from final

DROP table details123;
drop table final
truncate table [Destination]

select * from [dbo].[veeresh]

drop table xyz
