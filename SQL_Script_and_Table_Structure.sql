-- Script to create the Product table and load data into it.

DROP TABLE product;
CREATE TABLE product1
( 
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);

INSERT INTO product1 VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);
COMMIT;


-- All the SQL Queries written during the video

select * from product1;

-- FIRST_VALUE 
-- Write query to display the most expensive product under each category (corresponding to each record)

select distinct product_category,
first_value(product_name) over (partition by product_category order by price desc) from product1

-- LAST_VALUE 
-- Write query to display the least expensive product under each category (corresponding to each record)

SELECT DISTINCT
    product_category,
    LAST_VALUE(product_name) OVER (PARTITION BY product_category ORDER BY price ASC) AS least_expensive_product
FROM
    product1;

-- Alternate way to write SQL query using Window functions
    
-- NTH_VALUE 
-- Write query to display the Second most expensive product under each category.

select * from (
select  product_category,
row_number() over (partition by product_category order by  price desc) as rn  from product1
) as k
where rn = 2 

-- NTILE
-- Write a query to segregate all the expensive phones, mid range phones and the cheaper phones.

select 
product_category,
product_name,
price,
ntile(3) over (order by price) from product1

-- CUME_DIST (cumulative distribution) ; 
/*  Formula = Current Row no (or Row No with value same as current row) / Total no of rows */

-- Query to fetch all products which are constituting the first 30% 
-- of the data in products table based on price.

SELECT
    product_name,
    price
FROM
    (
        SELECT
            product_name,
            price,
            CUME_DIST() OVER (ORDER BY price) AS cumulative_dist
        FROM
            product1
    ) AS subquery
WHERE
    cumulative_dist <= 0.3;

-- PERCENT_RANK (relative rank of the current row / Percentage Ranking)
/* Formula = Current Row No - 1 / Total no of rows - 1 */

-- Query to identify how much percentage more expensive is "Galaxy Z Fold 3" when compared to all products.

SELECT
    product_name,
    price,
    (PERCENT_RANK() OVER (ORDER BY price) * 100) AS percentage_rank
FROM
    product1
WHERE
    product_name = 'Galaxy Z Fold 3';

	select * from product1

	select product_category,brand
	lag(price) over (partition by brand, category order by price) as previous_sales,
    price-lag(price) over (partition by brand,product_category order by price) as incremental_year 
	from product1 
	order by product_category,brand

DECLARE @StartDate DATE = '2022-03-20';
DECLARE @EndDate DATE = GETDATE();
--DECLARE @DateList TABLE (DateValue DATE);
WHILE @StartDate < @EndDate
BEGIN
  SET @StartDate = DATEADD(DAY, 1, @StartDate)
  print(@StartDate)
END

declare @startdat date = '2023-05-30';
declare @enddat date = getdate();

with ctedate as(
select @startdat as [date]
union all
select dateadd(dd,1,[date])
from ctedate 
where  dateadd(dd,1,[date]) <= @enddat
)

select [date] from ctedate;

declare @startdt date = '2023-05-30';
declare @enddt date = getdate();

with cte as (
select @startdt as dt 
union all
select dateadd(day,1,dt)
from  cte 
where dateadd(day,1,dt) <= @enddt
)
select dt from cte
