
CREATE TABLE pizza_sales (
    pizza_id INT,
    order_id INT,
    pizza_name_id VARCHAR(50),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price NUMERIC(10,2),
    total_price NUMERIC(10,2),
    pizza_size VARCHAR(10),
    pizza_category VARCHAR(50),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(100)
);

SELECT SUM(total_price) AS total_revenue
FROM pizza_sales;

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS avg_order_value
FROM pizza_sales;

SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;


SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;


SELECT 
ROUND(SUM(quantity)::numeric / COUNT(DISTINCT order_id), 2) 
AS avg_pizzas_per_order
FROM pizza_sales;


SELECT 
TO_CHAR(order_date, 'Day') AS order_day,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_day
ORDER BY MIN(order_date);

SELECT 
TO_CHAR(order_date, 'Month') AS month_name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY month_name
ORDER BY MIN(order_date);

SELECT 
pizza_category,
ROUND(SUM(total_price), 2) AS total_revenue,
ROUND(SUM(total_price) * 100 / 
      (SELECT SUM(total_price) FROM pizza_sales), 2) AS pct
FROM pizza_sales
GROUP BY pizza_category;


SELECT 
pizza_size,
ROUND(SUM(total_price), 2) AS total_revenue,
ROUND(SUM(total_price) * 100 / 
      (SELECT SUM(total_price) FROM pizza_sales), 2) AS pct
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;


SELECT 
pizza_category,
SUM(quantity) AS total_quantity_sold
FROM pizza_sales
WHERE EXTRACT(MONTH FROM order_date) = 2
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;



SELECT 
pizza_name,
SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;


SELECT 
pizza_name,
SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;


SELECT 
pizza_name,
SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza_sold DESC
LIMIT 5;


SELECT 
pizza_name,
SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza_sold ASC
LIMIT 5;

SELECT 
pizza_name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;


SELECT 
pizza_name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;


SELECT 
pizza_name,
COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;