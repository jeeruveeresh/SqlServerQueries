SELECT * FROM SSISCLEANS 

REPLACE((REPLACE((UPPER(LEFT(FirstName,1)) + SUBSTRING(FirstName,2,LEN(FirstName))),".","")),",","")
REPLACE((REPLACE((UPPER(LEFT(LastName,1)) + SUBSTRING(LastName,2,LEN(LastName))),".","")),",","")
LTRIM(REPLACE(REPLACE(REPLACE(MiddleName,".",""),"..",""),"-",""))