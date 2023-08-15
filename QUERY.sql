Create database pizza;
use pizza;
select * from sales;
update sales
set order_date = str_to_date(ORDER_DATE,'%d-%m-%Y');

-- KPI
-- TOTAL REVENUE 
SELECT SUM(TOTAL_PRICE)  AS TOTAL_REVENUE FROM SALES;

--  AVERAGE ORDER values
SELECT CAST(SUM(TOTAL_PRICE)AS DECIMAL)/COUNT(DISTINCT ORDER_ID) AS AVG_ORDER_VALUE FROM SALES;

-- TOTAL PIZZAS SOLD

SELECT SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD FROM SALES;

-- TOTAL ORDERS PLACED

SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM SALES;

-- AVG PIZZAS PER ORDER

SELECT CAST(SUM(QUANTITY) AS DECIMAL)/COUNT(DISTINCT ORDER_ID) AS AVG_PIZZA_PER_ORDER FROM SALES;

-- DAY WISE TOTAL ORDERS

SELECT DAYNAME(ORDER_DATE)AS ORDER_DAY, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDER 
FROM SALES
GROUP BY DAYNAME(ORDER_DATE)
ORDER BY TOTAL_ORDERS;

--  MONTHLY TRENDS

SELECT monthname(ORDER_DATE) AS MONTH_NAME, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM SALES
GROUP BY monthname(ORDER_DATE)
ORDER BY TOTAL_ORDERS;

--  PERCENT OF SALES BY PIZZA CATEGORY

SELECT PIZZA_CATEGORY,sum(TOTAL_PRICE) as total, 100.0*(SUM(TOTAL_PRICE) ) / 
(SELECT SUM(TOTAL_PRICE) FROM SALES) AS PERCENT
FROM SALES 
GROUP BY PIZZA_CATEGORY
order by percent desc;

-- percent of sales by pizza size

SELECT PIZZA_size,round(sum(TOTAL_PRICE),2) as total, round(100.0*(SUM(TOTAL_PRICE) ) / 
(SELECT SUM(TOTAL_PRICE) FROM SALES),2) AS PERCENT
FROM SALES 
GROUP BY PIZZA_size
order by percent desc; 


-- top 5 best sellers

select pizza_name, sum(total_price) as total
from sales 
group by pizza_name
order by total desc
limit 5;

-- bottom 5 sellers
select pizza_name, sum(total_price) as total
from sales 
group by pizza_name
order by total
limit 5;
 
-- top 5 by quantity

select pizza_name, sum(quantity) as total
from sales 
group by pizza_name
order by total desc
limit 5; 

-- bottom 5 by quantity

select pizza_name, sum(quantity) as total
from sales 
group by pizza_name
order by total
limit 5;

-- top 5 by order id

select pizza_name, count(distinct order_id) as total
from sales 
group by pizza_name
order by total desc
limit 5;

-- bottom 5 by order id

select pizza_name, count(distinct order_id) as total
from sales 
group by pizza_name
order by total
limit 5;