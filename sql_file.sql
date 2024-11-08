create database pizza_project;
use pizza_project;
select * from pizza_sales;


# KPI

# TOTAL REVENUE : SUM OF TOTAL PRICE OF ALL PIZZA ORDERS
select sum(total_price) as Total_Revenue 
from pizza_sales;     #817860.0499

#Average Order Value : total revenue/total orders
select sum(total_price)/count( distinct order_id) as AOV
FROM pizza_sales;   #38.30726

#Total Pizzas Sold : sum of quantities of all pizzas
select sum(quantity) as Total_Pizzas_Sold 
from pizza_sales;    #49574

#TOTAL ORDERS: 
SELECT COUNT(DISTINCT order_id) as total_orders 
from pizza_sales;    #21350


# Average pizzas per order:
SELECT 
    AVG(pizza_count) AS avg_pizzas_per_order
FROM (
    SELECT 
        order_id, 
        SUM(quantity) AS pizza_count
    FROM 
        pizza_sales
    GROUP BY 
        order_id
) AS order_pizza_counts;   #2.32


# DAILY TRENDS FOR DAILY ORDERS
SELECT  DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day,
COUNT(DISTINCT order_id) as total_weekly_orders
from pizza_sales
group by order_day ;

# Monthly Trend for Orders
SELECT  MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
COUNT(DISTINCT order_id) as total_monthly_orders
from pizza_sales
group by order_month 
order by total_monthly_orders desc;


# % of Sales by Pizza Category
SELECT 
    pizza_category,
    SUM(total_price) AS category_sales,
    (SUM(total_price) / (SELECT SUM(total_price) FROM pizza_sales) * 100) AS percentage_sales
FROM 
    pizza_sales
GROUP BY 
    pizza_category
ORDER BY 
    percentage_sales DESC;

# % of Sales by Pizza Size
select pizza_size,
sum(total_price)*100/(select sum(total_price) from pizza_sales) as percentage_size,
sum(total_price) as size_revenue
from pizza_sales
group by pizza_size
order by percentage_size desc;

# Total Pizzas Sold by Pizza Category
select * from pizza_sales;

SELECT pizza_category, SUM(quantity) AS Sold_ByCategory
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Sold_ByCategory DESC;


# Top 5 Pizzas by Revenue
select pizza_name, sum(total_price) as TotalPrice
from pizza_sales
group by pizza_name
order by TotalPrice desc
limit 5; 

# Bottom 5 Pizzas by Revenue
select pizza_name, sum(total_price) as TotalPrice
from pizza_sales
group by pizza_name
order by TotalPrice asc
limit 5; 

#Top 5 Pizzas by Quantity

select pizza_name,sum(quantity) as TotalQuantity
from pizza_sales
group by pizza_name
order by TotalQuantity desc
limit 5; 

#Bottom 5 Pizzas by Quantity
select pizza_name,sum(quantity) as TotalQuantity
from pizza_sales
group by pizza_name
order by TotalQuantity asc
limit 5; 

#Top 5 Pizzas by Total Orders
select * from pizza_sales;

select pizza_name,count( distinct order_id) as totalOrders
from pizza_sales
group by pizza_name
order by totalOrders desc
limit 5; 

#Borrom 5 Pizzas by Total Orders
select pizza_name,count( distinct order_id) as totalOrders
from pizza_sales
group by pizza_name
order by totalOrders asc
limit 5; 
















     
