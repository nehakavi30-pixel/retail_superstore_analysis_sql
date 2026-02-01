
CREATE TABLE retail_sales 
			(
			transactions_id	INT,
			sale_date	date,
			sale_time	TIME,
			customer_id	INT,
			gender	VARCHAR(15),
			age	    INT,
			category VARCHAR(20),
			quantiy	INT,
			price_per_unit	FLOAT,
			cogs	FLOAT,
			total_sale FLOAT
			)

SELECT * FROM retail_sales
LIMIT 100

SELECT count(*) FROM retail_sales;

SELECT * FROM retail_sales
WHERE
	transactions_id is NULL
	OR
	sale_date is NULL
	OR
	sale_time is Null	
	OR
	customer_id is NUll
	OR
	gender is NULL
	OR 
	age is NULL
	OR
	category is NULL
	OR
	quantiy is NULL
	OR
	price_per_unit is NULL
	OR
	cogs is NULL
	OR
	total_sale is NULL


DELETE FROM retail_sales
WHERE
	transactions_id is NULL
	OR
	sale_date is NULL
	OR
	sale_time is Null	
	OR
	customer_id is NUll
	OR
	gender is NULL
	OR 
	age is NULL
	OR
	category is NULL
	OR
	quantiy is NULL
	OR
	price_per_unit is NULL
	OR
	cogs is NULL
	OR
	total_sale is NULL


SELECT count(*) FROM retail_sales;

-------------DATA EXPLORIATION----------------

----HOW MANY SALES WE HAVE?----


SELECT COUNT(*) AS total_sale FROM retail_sales;

----how many unique customers do we have?---


SELECT count (DISTINCT customer_id) FROM retail_sales;

SELECT DISTINCT category FROM retail_sales;



--------------DATA ANALYSIS & BUSINESS PROBLEM AND ANSWERS----------------



QUE-1-----SQL QUERY TO RETRIEVE ALL COLUMNS FOR SALES MADE ON 2022-11-05

SELECT * FROM retail_sales
WHERE sale_date= '2022-11-05';

--------------------------------------------------------------------------------------------------

QUE2-----SQL QUERY TO RETRIEVE ALL TRANSACTIONS WHERE THE CATEGORY IS CLOTHING AND THE QUANTITY IS SOLD MORE THAN THE 4 IN THE MONTH OF NOV 2022


SELECT * FROM retail_sales
WHERE category ='Clothing'
AND quantiy >= 4
AND sale_date >='2022-11-01'
AND sale_date < '2022-12-01';

---------------------------------------------------------------------------------------------------

QUE3-----SQL QUERY TO CALCULATE TOTAL SALES FOR EACH CATEGORY

SELECT 
       CATEGORY,
       SUM(total_sale) as net_sale,
	   COUNT (*) as total_orders
FROM retail_sales
GROUP BY 1

------------------------------------------------------------------------------------------------

QUE4-----SQL QUERY TO FIND THE AVREAGE AGE OF CUSTOMERS WHO PURCHASED ITEMS FROM THE 'BEAUTY' CATEGORY

SELECT 
      Round(AVG(age),2) as avg_age
FROM retail_sales
WHERE category= 'Beauty'

----------------------------------------------------------------------------------------------

QUE5----- SQL QUERY TO FIND ALL THE TRANSACTION WHERE THE TOTAL SALE IS GREATER THAN 1000

SELECT * FROM retail_sales
Where total_sale >1000

----------------------------------------------------------------------------------------------

QUE6------TO FIND NUMBER OF ALL THE TRANSACTION MADE BY EACH GENDER IN EACH CATEGORY 

SELECT 
      category,
	  gender,
	  count(*) as total_trns
FROM retail_sales	
GROUP BY gender,
		 category
ORDER BY 1

-------------------------------------------------------------------------------------------------

QUE7------SQL QUERY TO CALCULATE THE AVERAGE SALE FOR EACH MONTH . FIND OUT THE BEST SELLING MONTH IN EACH YEAR

SELECT
	 year,
	 month,
	 avg_sale
FROM
(

SELECT 
	 Extract(Year FROM sale_date) as year,
	 Extract(Month from sale_date) as month,
	 AVG(total_sale) as avg_sale,
	 RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
from retail_sales
GROUP BY 1,2
) as t1
WHERE rank=1

-----------------------------------------------------------------------------------------------


QUE8------SQL QUERY TO FIND THE TOP 5 CUSTOMERS BASED ON THE HIGHEST SALES

SELECT
	customer_id,
	SUM(total_sale) as total_sale
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

_______________________________________________________________________________________________


QUE9------SQL QUERY TO FIND THE NUMBER OF UNIQUE CUSTOMERS WHO PURCHASED ITEMS FROM THE EACH CATEGORY

SELECT 
	 category,
	 COUNT(DISTINCT customer_id) as unique_cust
FROM retail_sales
GROUP BY 1

------------------------------------------------------------------------------------------------

QUE10-----SQL QUERY TO CREATE EACH SHIFT AND NUMBER OF ORDERS(EXAMPLE MORNING<=12, BETWEEN 12&17,EVENING>17)


WITH hourly_sale
AS
(
select *,
      CASE
	  	WHEN EXTRACT (HOUR FROM sale_time)< 12 THEN 'Morning'
	  	WHEN EXTRACT (HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
	  	ELSE 'Evening'
	  END as shift
from retail_sales
)
SELECT
	shift,
	count(*) as total_orders
FROM hourly_sale
GROUP BY shift


----------------------------------END OF PROJECT--------------------------------------------

