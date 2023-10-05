create table City(name varchar(200));
--1.Insert the missing statement to get all the columns from the Customers table.
SELECT * FROM resolved;
--Write a statement that will select the City column from the Customers table.
SELECT name from resolved; --select city from customers
--Select all the different values from the Country column in the Customers table.
SELECT DISTINCT Name from resolved; --select distinct Country from customers
--Select all records where the City column has the value "Berlin".
SELECT * FROM resolved 
WHERE name='Chennoji';
--Use the NOT keyword to select all records where City is NOT "Berlin".
SELECT * FROM resolved
WHERE not name='Chennoji';
--Select all records where the CustomerID column has the value 32.
Select * from 
--Select all records where the City column has the value 'Berlin' or 'London'.
--Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 12209.
--Select all records from the Customers table, sort the result alphabetically by the column City.
--Select all records from the Customers table, sort the result reversed alphabetically by the column City.
--Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City.
--Insert a new record in the Customers table.
INSERT INTO resolved values ('Rajashekar'),('Raju'),('Shekar'),('Chennoji'),('Raju'),('Cheennoji'); --Insert into customers values(val1,val2,val3);
--Select all records from the Customers where the PostalCode column is empty.
--Select all records from the Customers where the PostalCode column is NOT empty.
--Update the City column of all records in the Customers table.
--Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
--Update the City value and the Country value.
--Delete all the records from the Customers table where the Country value is 'Norway'.
--Delete all the records from the Customers table.
--Use the MIN function to select the record with the smallest value of the Price column.
--Use an SQL function to select the record with the highest value of the Price column.
--Use the correct function to return the number of records that have the Price value set to 18.
--Use an SQL function to calculate the average price of all products.
--Use an SQL function to calculate the sum of all the Price column values in the Products table.
--Select all records where the value of the City column starts with the letter "a".
--Select all records where the value of the City column ends with the letter "a".
--Select all records where the value of the City column contains the letter "a".
--Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
--Select all records where the value of the City column does NOT start with the letter "a".
--Select all records where the second letter of the City is an "a".
--Select all records where the first letter of the City is an "a" or a "c" or an "s".
--Select all records where the first letter of the City starts with anything from an "a" to an "f".
--Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
--Use the IN operator to select all the records where Country is either "Norway" or "France".
--Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
--Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20.
--Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.
--Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.
--When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
--When displaying the Customers table, refer to the table as Consumers instead of Customers.
--Insert the missing parts in the JOIN clause to join the two tables Orders and Customers, using the CustomerID field in both tables as the relationship between the two tables.
--Choose the correct JOIN clause to select all records from the two tables where there is a match in both tables.
--Choose the correct JOIN clause to select all the records from the Customers table plus all the matches in the Orders table.
--List the number of customers in each country.
--List the number of customers in each country, ordered by the country with the most customers first.
--Write the correct SQL statement to create a new database called testDB.
--Write the correct SQL statement to delete a database named testDB.
--Write the correct SQL statement to create a new table called Persons.
--Write the correct SQL statement to delete a table called Persons.
--Use the TRUNCATE statement to delete all data inside a table.
--Add a column of type DATE called Birthday.
--Delete the column Birthday from the Persons table.
--Substring function with literal strings
Select SUBSTRING('I have joined Motivity Labs',15,50);
--Substring function on Tables
CREATE TABLE persons (      
  id int PRIMARY KEY,      
  person_name nvarchar(45) NOT NULL,      
  email nvarchar(45) NOT NULL,      
  state nvarchar(25) NOT NULL      
);  
INSERT INTO persons (id, person_name, email, state)       
VALUES (1,'Steffen', 'steffen@javatpoint.com', 'Texas'),       
(2, 'Joseph', 'joseph@example.com', 'Alaska'),       
(3, 'Peter', 'peter@javatpoint.com', 'California'),    
(4, 'Donald', 'donald@example.com', 'New York'),       
(5, 'Kevin', 'kevin@example.com', 'Florida'),  
(6, 'Marielia', 'marielia@javatpoint.com', 'Arizona'),    
(7, 'Antonio', 'antonio@example.com', 'New York'),       
(8, 'Thompson', 'thompson@javatpoint.com', 'California'),  
(9, 'Matthew', 'matthew@example.com', 'Florida'),       
(10, 'Robert', 'robert@javatpoint.com', 'Alaska'); 

SELECT * FROM persons;  

--Substring function with Charindex

--Substring in WHERE Clause
--Substring in ORDER BY Clause
























































