USE elevatelabs_task3;

CREATE TABLE superstore (
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

USE elevatelabs_task3;
SELECT * FROM superstore LIMIT 5;

USE elevatelabs_task3;

SELECT category, 
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

SELECT customer_name,
       ROUND(SUM(sales), 2) AS total_revenue
FROM superstore
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;

SELECT region,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

SELECT region,
       ROUND(AVG(sales), 2) AS avg_order_value
FROM superstore
GROUP BY region
ORDER BY avg_order_value DESC;

SELECT sub_category,
       ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 5;

SELECT YEAR(STR_TO_DATE(order_date, '%m/%d/%Y')) AS year,
       ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY year
ORDER BY year;

SELECT customer_name, 
       ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY customer_name
HAVING SUM(sales) > (SELECT AVG(sales) FROM superstore)
ORDER BY total_sales DESC
LIMIT 10;

CREATE VIEW region_summary AS
SELECT region,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(AVG(sales), 2) AS avg_sales
FROM superstore
GROUP BY region;

SELECT * FROM region_summary;