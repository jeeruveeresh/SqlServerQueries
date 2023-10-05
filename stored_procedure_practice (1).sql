CREATE OR REPLACE DATABASE STOREDPROC_DB;
CREATE SCHEMA SF_SCHEMA;

--create a test table call INVENTORY in this schema. We will be using sample data provided by Snowflake to populate this table.
CREATE TABLE INVENTORY AS 
SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.INVENTORY
LIMIT 100000;

--create another test table called ITEM in this schema. Again, we will be using sample data provided by Snowflake to populate this table.
CREATE TABLE ITEM AS 
SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.ITEM
LIMIT 100000;

--create a test table call STORE_SALES in this schema. We will be using sample data provided by Snowflake to populate this table.
CREATE OR REPLACE TABLE STORE_SALES AS 
SELECT * FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.STORE_SALES
LIMIT 100;

select * from STORE_SALES;


-- 
stored procedure 



create or replace procedure read_result_set()
  returns float not null
  language javascript
  as     
  $$  
    var my_sql_command = "select * from STORE_SALES";
    var statement1 = snowflake.createStatement( {sqlText: my_sql_command} );
    var result_set1 = statement1.execute();
    // Loop through the results, processing one row at a time... 
    while (result_set1.next())  {
       var column1 = result_set1.getColumnValue(1);
       var column2 = result_set1.getColumnValue(2);
       }
  return column1 ;
  $$
  ;

call read_result_set();

create or replace procedure read_result_set()
  returns float not null
  language javascript
  as     
  $$ 
    //var my_sql_command = "select * from STORE_SALES";
    //var statement1 = snowflake.createStatement( {sqlText: my_sql_command} );
    //var result_set1 = statement1.execute();
    var result_set1 =snowflake.execute( {sqlText: "select * from STORE_SALES;"} )
    // Loop through the results, processing one row at a time... 
    while (result_set1.next())  {
       var column1 = result_set1.getColumnValue(1);
       var column2 = result_set1.getColumnValue(2);
       }
  return column2 ;
  $$
  ;

select * from STORE_SALES;

call read_result_set();

--select * from table(result_scan('01a1f13c-0000-2d39-0000-7a0d0002a006'))

--Dynamically Creating a SQL Statement
create or replace procedure get_row_count(table_name VARCHAR)
    returns float 
    not null
    language javascript
    as
    $$
    var row_count = 0;
    // Dynamically compose the SQL statement to execute.
    // Note that we uppercased the input parameter name.
    var sql_command = "select count(*) from " + TABLE_NAME;
    // Run the statement.
    var stmt = snowflake.createStatement(
           {
           sqlText: sql_command
           }
        );
    var res = stmt.execute();
    // Get back the row count. Specifically, ...
    // ... first, get the first (and in this case only) row from the
    //  result set ...
    res.next();
    // ... then extract the returned value (which in this case is the
    // number of rows in the table).
    row_count = res.getColumnValue(1);
    return row_count;
    $$
    ;
call get_row_count('STORE_SALES');
call get_row_count('ITEM');

select count(*) from ITEM

-- Binding Variables
-- Below example returns TRUE if the specified timestamp is prior to now, and FALSE otherwise.
CREATE OR REPLACE PROCEDURE DATE_CHECK(TIMESTAMP_VALUE VARCHAR )
RETURNS BOOLEAN
LANGUAGE JAVASCRIPT
AS
$$
var cmd = "SELECT CURRENT_DATE() > TO_TIMESTAMP(:1, 'YYYY-MM-DD HH24:MI:SS')";
//var cmd = "SELECT CURRENT_DATE() > TO_TIMESTAMP(?, 'YYYY-MM-DD HH24:MI:SS')";

var stmt = snowflake.createStatement(
          {
          sqlText: cmd,
          binds: [TIMESTAMP_VALUE]
          }
          );
var result1 = stmt.execute();
result1.next();
return result1.getColumnValue(1);
$$
;
CALL DATE_CHECK('2022-01-16 01:02:03');

CALL DATE_CHECK('2022-06-29 01:02:03');


-- binding multiple variables

CREATE OR REPLACE PROCEDURE STORE_DETAIL (ITEM_ID FLOAT,CUSTOMER_ID FLOAT)
returns Array
language javascript
as
$$
var query = "SELECT SS_STORE_SK FROM STORE_SALES WHERE SS_ITEM_SK=? AND SS_CUSTOMER_SK=?";
var statement = snowflake.createStatement({sqlText : query, binds : [ITEM_ID,CUSTOMER_ID]});
var resultSet = statement.execute();
var arr = [];
while (resultSet.next())
{
arr.push(resultSet.getColumnValue(1));
}
return arr;
$$
;

SELECT * FROM STORE_SALES;

CALL STORE_DETAIL('190353','30912922');  --457


-- store set of result in an array.
CREATE OR REPLACE PROCEDURE STORE_DETAIL_ARRAY (ITEM_ID FLOAT)
returns Array
language javascript
as
$$
var query = "SELECT * FROM STORE_SALES WHERE SS_ITEM_SK=?";
var statement = snowflake.createStatement({sqlText : query, binds : [ITEM_ID]});
var resultSet = statement.execute();
var arr = [];
while (resultSet.next())
{
arr.push([resultSet.getColumnValue(1), resultSet.getColumnValue(2),resultSet.getColumnValue(3)]);
}
return arr;
$$
;

SELECT * FROM STORE_SALES;

CALL STORE_DETAIL_ARRAY('190353');

SELECT * FROM STORE_SALES WHERE SS_ITEM_SK='190353'
select * from TABLE(RESULT_SCAN(LAST_QUERY_ID()))

SELECT INDEX, VALUE 
    FROM TABLE(RESULT_SCAN(LAST_QUERY_ID())) AS res, LATERAL FLATTEN(INPUT => res.$1)
    ORDER BY index
    ;
--this is not a general purpose solution. There is a limit on the maximum size of ARRAY data types, 
--and your entire result set must fit into a single ARRAY.

/*stored procedure returns a single row that contains a single column; it is not designed to return a result set. 
However, if your result set is small enough to fit into a single value of type VARIANT or ARRAY, 
we can return a result set from a stored procedure with some additional code*/

--More Examples
CREATE TABLE stproc_test_table1 (num_col1 numeric(14,7));

create or replace procedure stproc1(FLOAT_PARAM1 FLOAT)
    returns string
    language javascript
    strict
    execute as owner
    as
    $$
    var sql_command = 
     "INSERT INTO stproc_test_table1 (num_col1) VALUES (" + FLOAT_PARAM1 + ")";
    try {
        snowflake.execute (
            {sqlText: sql_command}
            );
        return "Succeeded.";   // Return a success/error indicator.
        }
    catch (err)  {
        return "Failed: " + err;   // Return a success/error indicator.
        }
    $$
    ;
--Call the stored procedure
call stproc1(7.14::float);

call stproc1(7.14::float);

-- Confirm that the stored procedure inserted the row
select * from stproc_test_table1;

-- to generate error and push our stored proc to catch block
CREATE OR REPLACE TABLE stproc_test_table2 (num_col1 numeric(14,7), num_col2 numeric(14,7));

create or replace procedure stproc2(FLOAT_PARAM1 FLOAT)
    returns string
    language javascript
    strict
    execute as owner
    as
    $$
    var sql_command = 
     "INSERT INTO stproc_test_table2 VALUES (" + FLOAT_PARAM1 + ")                                    ";
    try {
        snowflake.execute (
            {sqlText: sql_command} 
            );
        return "Succeeded.";   // Return a success/error indicator.
        }
    catch (err)  {
        return "Failed: " + err;   // Return a success/error indicator.
        }
    $$
    ;
--Call the stored procedure
call stproc2(5.14::float);

--  Catching an Error using Try/Catch

-- create an sp that throws error

 create or replace procedure error_sp()
      returns varchar not null
      language javascript
      as
      $$
      var result = "";
      try {
          snowflake.execute( {sqlText: "Invalid Command!;"} );
          result = "Succeeded";
          }
      catch (err)  {
          result =  "Failed: Code: " + err.code + "\n  State: " + err.state;
          result += "\n  Message: " + err.message;
          result += "\nStack Trace: " + err.stackTraceTxt; 
          }
      return result;
      $$
      ;
 call error_sp();
 
-- throw custom error/exception
CREATE OR REPLACE PROCEDURE validate_age (age float)
RETURNS VARCHAR
LANGUAGE JAVASCRIPT
EXECUTE AS CALLER
AS $$
    try {
        if (AGE < 0) {
            throw "Age cannot be negative!";
        } else {
            return "Age validated.";
        }
    } catch (err) {
        return "Error: " + err;
    }
$$;

CALL validate_age(30);

CALL validate_age(-10);

--Transactions in Stored Procedures

select count(*) from STOREDPROC_DB.SF_SCHEMA.INVENTORY; -100000
select count(*) from STOREDPROC_DB.SF_SCHEMA.ITEM;  -100000

create or replace procedure sp_transactions() 
  returns varchar not null
  language javascript
  as
  $$
  var result = "";
  snowflake.execute( {sqlText: "BEGIN WORK;"} );
  try {
      snowflake.execute( {sqlText: "DELETE FROM STOREDPROC_DB.SF_SCHEMA.INVENTORY;"} );
      snowflake.execute( {sqlText: "DELETE FROM STOREDPROC_DB.SF_SCHEMA.ITEM;"} );
      // To see what happens if there is a failure/rollback,
      snowflake.execute( {sqlText: "DELETE FROM no_table;"} );
      snowflake.execute( {sqlText: "COMMIT WORK;"} );
      result = "Succeeded";
      }
  catch (err)  {
      snowflake.execute( {sqlText: "ROLLBACK WORK;"} );
      return "Failed: " + err;   // Return a success/error indicator.
      }
  return result;
  $$
  ;

call sp_transactions();

-- 
CREATE OR REPLACE TABLE error_log (error_code number, error_state string, error_message string, stack_trace string, error_logged_time DATETIME);

CREATE OR REPLACE PROCEDURE sp_err_log() 
RETURNS varchar 
NOT NULL 
LANGUAGE javascript 
AS 
$$
var result;
try {
    snowflake.execute({ sqlText: "Invalid Command!;" });   
    result = "Succeeded";
} catch (err) {
    result = "Failed";
    snowflake.execute({
      sqlText: `insert into error_log VALUES (?,?,?,?,CURRENT_TIMESTAMP)`
      ,binds: [err.code, err.state, err.message, err.stackTraceTxt]
      });
}
return result;
$$;
call sp_err_log();
select * from error_log;

select * from "SNOWFLAKE"."ACCOUNT_USAGE"."QUERY_HISTORY"; --365 days

--- Overloading Stored Procedure Names
-- can create two stored procedures that have the same names, but different numbers of arguments and different argument types

create or replace procedure sp_return_float(FLOAT_PARAM1 FLOAT)
    returns string
    language javascript
    strict
    as
    $$
    return FLOAT_PARAM1;
    $$
    ;
create or replace procedure sp_return_float(FLOAT_PARAM1 FLOAT, FLOAT_PARAM2 FLOAT)
    returns string
    language javascript
    strict
    as
    $$
    return FLOAT_PARAM1 * FLOAT_PARAM2;
    $$
    ;

create or replace procedure sp_return_float(FLOAT_PARAM1 varchar, FLOAT_PARAM2 FLOAT)
    returns string
    language javascript
    strict
    as
    $$
    return FLOAT_PARAM1 * FLOAT_PARAM2;
    $$
    ;

--call the two procedures:


show procedures like 'sp_return_float'
call sp_return_float(5.14::FLOAT);

call sp_return_float(5.00::FLOAT, 2.00::FLOAT);

/* we can see 3 different stored procedured as snowflake treats it as seperate stored procedure 
if the number of arguments and also argument types are different */

show procedures like 'sp_return_float'; 


-- Session Variables with Caller’s Rights and Owner’s Rights Stored Procedures
--drop table test_table
create table test_table (ID float);
insert into test_table (ID) values (49), (51);
--Set a session variable

set SESSION_VAR1 = 50;

--caller’s rights stored procedure that uses one session variable and sets another session variable inside procedure

create procedure session_var_user()
  returns float
  language javascript
  EXECUTE AS CALLER
  as
  $$
  // Set the second session variable
  var stmt = snowflake.createStatement(
      {sqlText: "set SESSION_VAR2 = 'I was set inside the StoredProc.'"}
      );
  var rs = stmt.execute();  // we ignore the result in this case
  // Run a query using the first session variable
  stmt = snowflake.createStatement(
      {sqlText: "select ID from test_table where ID > $SESSION_VAR1"}
      );
  rs = stmt.execute();
  rs.next();
  var output = rs.getColumnValue(1);
  return output;
  $$
  ;
  
  CALL session_var_user();
  
--View the value of the session variable set inside the stored procedure:

SELECT $SESSION_VAR2;

-- Owner’s Rights Stored Procedure

create procedure sp_owner_use_vars()
  returns float
  language javascript
  EXECUTE AS OWNER
  as
  $$
  // Run a query using the first session variable
  var stmt = snowflake.createStatement(
      {sqlText: "select ID from test_table where ID > $SESSION_VAR1"}
      );
  var rs = stmt.execute();
  rs.next();
  var output = rs.getColumnValue(1);
  return output;
  $$
  ;
  
  CALL sp_owner_use_vars(); -- It will fail
  -- Use of session variable '$SESSION_VAR1' is not allowed in owners rights stored procedure
  
  create procedure sp_owner_set_vars()
  returns float
  language javascript
  EXECUTE AS OWNER
  as
  $$
  // Set the second session variable
  var stmt = snowflake.createStatement(
      {sqlText: "set SESSION_VAR2 = 'I was set inside the StProc.'"}
      );
  var rs = stmt.execute();  // we ignore the result in this case
  return 3.0;   // dummy value.
  $$
  ;
  
CALL sp_owner_set_vars();  --it will fail