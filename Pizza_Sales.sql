create database Pizza_DB;
use pizza_DB;

select sum(total_price) as Total_Revenue
from pizza_sales ;

select * from pizza_sales;

select sum(total_price) / count(distinct order_id) as Avg_order_value
from pizza_sales;




select sum(quantity) as Total_Pizza_sold from pizza_sales;

select count(distinct order_id ) as Total_Orders 
from pizza_sales;

select cast(cast(sum(quantity)  as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2)) as decimal (10,2)) 
as Avg_Pizza_Per_Order
from pizza_sales;


select dayname(order_date) as order_day, count(distinct order_id) as Total_Orders
from pizza_sales1
group by dayname(order_date)
order by count(distinct order_id) desc ;

describe order_date;

show fields from pizza_sales;

#ALTER TABLE tablename MODIFY columnname INTEGER;

alter table pizza_sales modify order_date date;

SELECT STR_TO_DATE(order_date, '%d %m %Y') AS converted_date
FROM pizza_sales;


ALTER TABLE pizza_sales
MODIFY COLUMN order_date DATE;

UPDATE pizza_sales
SET order_date = STR_TO_DATE(order_date, '%d %m %Y');

UPDATE pizza_sales
SET order_date = COALESCE(STR_TO_DATE(order_date, '%d %m %Y'), '0000-00-00');

drop table pizza_sales11;
drop table pizza_sales;


select * from pizza_sales1 ;

UPDATE pizza_sales1
SET order_date = CONCAT(SUBSTRING(order_date, 7, 4), '-', SUBSTRING(order_date, 4, 2), '-', 
SUBSTRING(order_date, 1, 2));

select monthname(order_date) as order_Month, count(distinct order_id) as total_orders
from pizza_sales1
group by  monthname(order_date);

select pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales1) as PCT
from pizza_sales1 
group by pizza_category;

select pizza_size, cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales1 where quarter(order_date) = 1)
 as decimal(10,2)) as PCT
from pizza_sales1 
where quarter(order_date) = 1
group by pizza_size
order by PCT DESC;

select  pizza_name, count(distinct order_id)  as Total_Orders
from pizza_sales1
group by pizza_name
order by Total_Orders  
limit 5;


