DECLARE @Region TABLE
(
 RegionID int,
 RegionDescription NChar(50)
)
INSERT INTO @Region values(3,'Northern')
INSERT INTO @Region values(4,'Southern')
INSERT INTO @Region
SELECT * FROM @Region 
WHERE RegionID>2;
select * from @Region
SELECT * FROM Territories t
JOIN @Region r on t.RegionID=r.RegionID

SELECT *
FROM Employees AS e
--Or if you wanted to select all from a specific table you can use the alias + " .* ":
SELECT e.*, d.DepartmentName
FROM Employees AS e
 INNER JOIN Department AS d
 ON e.DepartmentID = d.DepartmentID

UPDATE HelloWorlds
SET HelloWorld = 'HELLO WORLD!!!'
WHERE Id = 5

DELETE
FROM Helloworlds

TRUNCATE TABLE HelloWords

/* This is
a multi-line
comment block. */

/* This is a one liner */

PRINT 'Hello World!';

SELECT <column names>
FROM <table name>
WHERE <condition>

SELECT FirstName, Age
FROM Users
WHERE LastName = 'Smith'
Conditions can be complex:
SELECT FirstName, Age
FROM Users
WHERE LastName = 'Smith' AND (City = 'New York' OR City = 'Los Angeles')

UPDATE Scores
SET score = score + 1 

TRUNCATE TABLE Helloworlds

SELECT @@VERSION
SELECT @@SERVERNAME
SELECT @@SERVICENAME
SELECT serverproperty('ComputerNamePhysicalNetBIOS');
SELECT * FROM fn_virtualservernodes();

CREATE TABLE test_transaction (column_1 varchar(10))
INSERT INTO
 test_transaction
 ( column_1 )
VALUES
 ( 'a' )

BEGIN TRANSACTION
UPDATE test_transaction
SET column_1 = 'B'
OUTPUT INSERTED.*
WHERE column_1 = 'A'
commit
select * from test_transaction
ROLLBACK TRANSACTION 

SELECT * FROM test_transaction
DROP TABLE dbo.test_transaction

DECLARE @fakeDate AS varchar(10); 
DECLARE @realDate AS VARCHAR(10); 
SET @fakeDate = 'iamnotadate';
SET @realDate = '13/09/2015'; 
SELECT TRY_PARSE(@fakeDate AS DATE); --NULL as the parsing fails
SELECT TRY_PARSE(@realDate AS DATE); -- NULL due to type mismatch
SELECT TRY_PARSE(@realDate AS DATE USING 'Fr-FR'); -- 2015-09-13

DECLARE @sampletext AS VARCHAR(10); 
SET @sampletext = '123456'; 
DECLARE @realDate AS VARCHAR(10); 
SET @realDate = '13/09/2015';
SELECT TRY_CONVERT(INT, @sampletext); -- 123456 
SELECT TRY_CONVERT(DATETIME, @sampletext); -- NULL 
SELECT TRY_CONVERT(DATETIME, @realDate, 111); -- Sep, 13 2015 

DECLARE @sampletext AS VARCHAR(10); 
SET @sampletext = '123456'; 
SELECT TRY_CAST(@sampletext AS INT); -- 123456 
SELECT TRY_CAST(@sampletext AS DATE); -- NULL 

DECLARE @A varchar(2) 
DECLARE @B varchar(2)
set @A='25a' 
set @B='15'
Select CAST(@A as int) + CAST(@B as int) as Result
--'25a' is casted to 25 (string to int)
--'15' is casted to 15 (string to int)
--Result
--40

DECLARE @X VARCHAR(25)
SET @X='25a'
Select cast(@X as int) as result
---ERROR WHY CAUSE OF IT IS STORING STRING VALUES WITH SIZE OF 25
--for befor code it is having only of size of 2

DECLARE @C varchar(2) = 'a' 
select CAST(@C as int) as Result 
--Conversion failed when converting the varchar value 'a' to data type int.

select convert(varchar(20),GETDATE(),99)

DECLARE @now datetime
SET @now = GETDATE()
select convert(nvarchar(MAX), @now, 0) as output, 0 as style 
union select convert(nvarchar(MAX), @now, 1), 1
union select convert(nvarchar(MAX), @now, 2), 2
union select convert(nvarchar(MAX), @now, 3), 3
union select convert(nvarchar(MAX), @now, 4), 4
union select convert(nvarchar(MAX), @now, 5), 5
union select convert(nvarchar(MAX), @now, 6), 6
union select convert(nvarchar(MAX), @now, 7), 7
union select convert(nvarchar(MAX), @now, 8), 8
union select convert(nvarchar(MAX), @now, 9), 9
union select convert(nvarchar(MAX), @now, 10), 10
union select convert(nvarchar(MAX), @now, 11), 11
union select convert(nvarchar(MAX), @now, 12), 12
union select convert(nvarchar(MAX), @now, 13), 13
union select convert(nvarchar(MAX), @now, 14), 14
--15 to 19 not valid
union select convert(nvarchar(MAX), @now, 20), 20
union select convert(nvarchar(MAX), @now, 21), 21
union select convert(nvarchar(MAX), @now, 22), 22
union select convert(nvarchar(MAX), @now, 23), 23
union select convert(nvarchar(MAX), @now, 24), 24
union select convert(nvarchar(MAX), @now, 25), 25
--26 to 99 not valid
union select convert(nvarchar(MAX), @now, 100), 100
union select convert(nvarchar(MAX), @now, 101), 101
union select convert(nvarchar(MAX), @now, 102), 102
union select convert(nvarchar(MAX), @now, 103), 103
union select convert(nvarchar(MAX), @now, 104), 104
union select convert(nvarchar(MAX), @now, 105), 105
union select convert(nvarchar(MAX), @now, 106), 106
union select convert(nvarchar(MAX), @now, 107), 107
union select convert(nvarchar(MAX), @now, 108), 108
union select convert(nvarchar(MAX), @now, 109), 109
union select convert(nvarchar(MAX), @now, 110), 110
union select convert(nvarchar(MAX), @now, 111), 111
union select convert(nvarchar(MAX), @now, 112), 112
union select convert(nvarchar(MAX), @now, 113), 113
union select convert(nvarchar(MAX), @now, 114), 114
union select convert(nvarchar(MAX), @now, 120), 120
union select convert(nvarchar(MAX), @now, 121), 121
--122 to 125 not valid
union select convert(nvarchar(MAX), @now, 126), 126
union select convert(nvarchar(MAX), @now, 127), 127
--128, 129 not valid
union select convert(nvarchar(MAX), @now, 130), 130
union select convert(nvarchar(MAX), @now, 131), 131
--132 not valid
order BY style
--udt single
CREATE TYPE dbo.Ids as TABLE
(
 Id int PRIMARY KEY
)
--udt multiple
CREATE TYPE MyComplexType as TABLE
(
 Id int,
 Name varchar(10)
)
--udt with constraint
CREATE TYPE MyUniqueNamesType as TABLE
(
 FirstName varchar(10),
 LastName varchar(10),
 UNIQUE (FirstName,LastName)
)
--udt with pk and default
CREATE TYPE MyUniqueNamesType1 as TABLE
(
 FirstName varchar(10),
 LastName varchar(10),
 CreateDate datetime default GETDATE()
 PRIMARY KEY (FirstName,LastName)
)

SELECT *
FROM sys.objects

SELECT object_id, name, type, create_date
FROM sys.objects

SELECT *
FROM sys.objects
WHERE type = 'IT'


SELECT *
FROM sys.objects
ORDER BY create_date

SELECT type, count(*) as c
FROM sys.objects
GROUP BY type

SELECT type, count(*) as c
FROM sys.objects
GROUP BY type
HAVING count(*) < 10

SELECT TOP 10 *
FROM sys.objects

SELECT *
FROM sys.objects
ORDER BY object_id
OFFSET 50 ROWS FETCH NEXT 10 ROWS ONLY

SELECT *
FROM sys.objects
ORDER BY object_id
OFFSET 50 ROWS
--SELECT WTHOUT FROM
declare @var int = 17;
SELECT @var as c1, @var + 2 as c2, 'third' as c3
--ALIAS
CREATE TABLE AliasNameDemo(id INT,firstname VARCHAR(20),lastname VARCHAR(20))
INSERT INTO AliasNameDemo
VALUES (1,'MyFirstName','MyLastName')
--A
SELECT *FROM
(SELECT firstname + ' ' + lastname FROM AliasNameDemo)A(fullname)
--AS
SELECT FirstName +' '+ LastName As FullName
FROM AliasNameDemo
--=
SELECT FullName = FirstName +' '+ LastName
FROM AliasNameDemo
--WITHOUT AS
SELECT FirstName +' '+ LastName FullName
FROM AliasNameDemo
--NULLS
DECLARE @MyInt int -- variable is null until it is set with value.
DECLARE @MyInt2 int -- variable is null until it is set with value.
DECLARE @MyInt3 int -- variable is null until it is set with value.
SET @MyInt3 = 3
SELECT COALESCE (@MyInt, @MyInt2 ,@MyInt3 ,5)

DECLARE @MyInt int -- variable is null until it is set with value.
DECLARE @MyInt2 int -- variable is null until it is set with value.
DECLARE @MyInt3 int -- variable is null until it is set with value.
SET @MyInt=1
SET @MyInt3 = 3
SELECT ISNULL (@MyInt, @MyInt2)
--nulls
create table tables(id int,someval int)
insert into tables values(1,1),(2,2)

--with isnull
SELECT id
FROM tables
WHERE someVal = NULL

--ansinull
set ansi_nulls off
SELECT id
FROM tables
WHERE someVal = NULL

DECLARE @MyInt int -- All variables are null until they are set with values.
SELECT ISNULL(@MyInt, 3) -- Returns 3.

DECLARE @Date date = '2016-08-03'
set @Date=null
SELECT CASE 
 WHEN @Date = NULL THEN 1
 WHEN @Date <> NULL THEN 2
 WHEN @Date > NULL THEN 3
 WHEN @Date < NULL THEN 4
 WHEN @Date IS NULL THEN 5
 WHEN @Date IS NOT NULL THEN 6
end

SELECT id
FROM tables
WHERE someVal = 1

SELECT id
FROM tables
WHERE someVal <> 1

SELECT id
FROM tables
WHERE someVal IS NULL

SELECT id
FROM tables
WHERE someVal IS NOT NULL

SELECT id
FROM tables
WHERE ISNULL(someVal, -1) <> 1
--
SELECT id
FROM tables
WHERE someVal IS NULL OR someVal <> 1

create table #outertable (i int)
create table #innertable (i int);
insert into #outertable (i) values (1), (2),(3),(4), (5)
insert into #innertable (i) values (2), (3), (null);

select * from #outertable where i in (select i from #innertable)

select * from #outertable where i not in (select i from #innertable)
---table variable
DECLARE @Employees TABLE
(
 EmployeeID INT NOT NULL PRIMARY KEY,
 FirstName NVARCHAR(50) NOT NULL,
 LastName NVARCHAR(50) NOT NULL,
 ManagerID INT NULL
)
--decalring table variable
DECLARE @Table1 TABLE (Example INT)
DECLARE @Table2 TABLE (Example INT)

--SELECT *
--FROM @Table1
--INNER JOIN @Table2 ON @Table1.Example = @Table2.Example

--SELECT *
--FROM @Table1
--WHERE @Table1.Example = 1

--using alias
SELECT *
FROM @Table1 T1
INNER JOIN @Table2 T2 ON T1.Example = T2.Example

--using alias and where
SELECT *
FROM @Table1 Table1
WHERE Table1.Example = 1

--updating table variables
DECLARE @Variable1 INT, @Variable2 VARCHAR(10)
SELECT @Variable1 = 1, @Variable2 = 'Hello'
PRINT @Variable1
PRINT @Variable2

CREATE TABLE #Test (Example INT)
INSERT INTO #Test VALUES (1), (2)

DECLARE @Variable INT
SELECT @Variable = Example
FROM #Test
ORDER BY Example asc
PRINT @Variable

SELECT TOP 1 @Variable = Example
FROM #Test
ORDER BY Example ASC
PRINT @Variable

--assigning from table
SELECT TOP 0 @Variable = Example
FROM #Test
ORDER BY Example ASC
PRINT @Variable

--decalting using direct method
DECLARE
 @Var1 INT = 5,
 @Var2 NVARCHAR(50) = N'Hello World',
 @Var3 DATETIME = GETDATE()

--updating using set
DECLARE @VariableName INT
SET @VariableName = 1
PRINT @VariableName

--assign from tabe by top1
DECLARE @CurrentID int = (SELECT TOP 1 ID FROM tables ORDER BY id desc)

--assign from table
DECLARE @Year int = 2
DECLARE @CurrentID int = (SELECT ID FROM tables WHERE id = @Year)

---compound operators

DECLARE @test INT = 42;
SET @test += 1;
PRINT @test; --43
SET @test -= 1;
PRINT @test; --42
SET @test *= 2
PRINT @test; --84
SET @test /= 2;
PRINT @test; --42


---date and time formatting
SELECT GETDATE() AS [Result] 

--using convert and convert codes
DECLARE @convert_code INT = 100 -- See Table Below
SELECT CONVERT(VARCHAR(30), GETDATE(), @convert_code) AS [Result]

--different codes and outputs
SELECT GETDATE() AS [Result] -- 2016-07-21 07:56:10.927
SELECT CONVERT(VARCHAR(30),GETDATE(),100)    -- Jul 21 2016 7:56AM
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),101)    -- 07/21/2016
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),102)    -- 2016.07.21
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),103)    -- 21/07/2016
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),104)    -- 21.07.2016
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),105)    -- 21-07-2016
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),106)    -- 21 Jul 2016
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),107)    -- Jul 21, 2016
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),108)    -- 07:57:05
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),109)    -- Jul 21 2016 7:57:45:707AM
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),110)    -- 07-21-2016
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),111)    -- 2016/07/21
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),112)    -- 20160721
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),113)    -- 21 Jul 2016 07:57:59:553
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),114)    -- 07:57:59:553
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),120)    -- 2016-07-21 07:57:59
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),121)    -- 2016-07-21 07:57:59.553
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),126)    -- 2016-07-21T07:58:34.340
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),127)    -- 2016-07-21T07:58:34.340
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),130)    -- 16 ???? 1437 7:58:34:340AM
UNION SELECT CONVERT(VARCHAR(30),GETDATE(),131)    -- 16/10/1437 7:58:34:340AM

--date and time using format
DECLARE @Date DATETIME = '2016-09-05 00:01:02.333'
SELECT FORMAT(@Date, N'dddd, MMMM dd, yyyy hh:mm:ss tt')

--DECLARE @Date DATETIME = '2016-09-05 00:01:02.333'
SELECT FORMAT(@Date, N'U')
UNION SELECT FORMAT(@Date, N'U')

/*Argument Output
yyyy 2016
yy 16
MMMM September
MM 09
M 9
dddd Monday
ddd Mon
dd 05
d 5
HH 00
H 0
hh 12
h 12
mm 01
m 1
ss 02
s 2
tt AM
t A
fff 333
ff 33
f 3*/

/*Single Argument Output
D Monday, September 05, 2016
d 9/5/2016
F Monday, September 05, 2016 12:01:02 AM
f Monday, September 05, 2016 12:01 AM
G 9/5/2016 12:01:02 AM
g 9/5/2016 12:01 AM
M September 05
O 2016-09-05T00:01:02.3330000
R Mon, 05 Sep 2016 00:01:02 GMT
s 2016-09-05T00:01:02
T 12:01:02 AM
t 12:01 AM
U Monday, September 05, 2016 4:01:02 AM
u 2016-09-05 00:01:02Z
Y September, 2016*/

DECLARE @Date DATETIME = '2016-09-05 00:01:02.333'
SELECT FORMAT(@Date, N'U', 'zh-cn')

DATEADD (datepart , number , datetime_expr) 

DECLARE @now DATETIME2 = GETDATE();
SELECT @now; --2016-07-21 14:39:46.4170000
SELECT DATEADD(YEAR, 101, @now) --2017-07-21 14:39:46.4170000

