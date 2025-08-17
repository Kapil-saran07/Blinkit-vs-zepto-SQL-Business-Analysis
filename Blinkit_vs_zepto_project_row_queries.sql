-- 1. top 3 customer by spend
create view top_customers_by_spend as
SELECT c.customer_name, SUM(o.total_bill) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 3;

-- 2. Which age group + platfrom generates the highest revenue?
create view age_platform_revenue as 
SELECT 
    CASE 
        WHEN age < 30 THEN 'Young'
        WHEN age BETWEEN 30 AND 50 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS age_group,
    p.platform,
    SUM(o.total_bill) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY age_group, p.platform
ORDER BY revenue DESC
LIMIT 1;

-- 3. most ordered product category by platform 
create view most_ordered_product_category_by_platform as 
SELECT p.platform, p.category, COUNT(*) AS total_orders
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.platform, p.category
ORDER BY total_orders DESC;

-- 4. Age Group-wise Revenue from Each Platform
CREATE VIEW age_group_platform_revenue AS
SELECT 
    CASE WHEN age < 40 THEN 'Young' ELSE 'Senior' END AS age_group,
    SUM(o.total_bill) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY age_group;

-- 5. Top 3 Selling Products in Each platfrom
CREATE VIEW top_3_products_per_platform AS
WITH ranked_products AS (
    SELECT 
        platform,
        product_name,
        SUM(price) AS total_revenue,
        RANK() OVER(PARTITION BY platform ORDER BY SUM(price) DESC) AS rk
    FROM products
    GROUP BY platform, product_name
)
SELECT platform, product_name, total_revenue
FROM ranked_products
WHERE rk <= 3;

-- 6. Product Categories Sold on Zepto but Not on Blinkit
CREATE VIEW zepto_exclusive_categories AS
SELECT DISTINCT category
FROM products
WHERE platform = 'Zepto'
AND category NOT IN (
    SELECT category FROM products WHERE platform = 'Blinkit'
);

-- 7. Year-wise Total Sales by Each platfrom
CREATE VIEW yearly_sales_by_platform AS
SELECT YEAR(order_date) AS year, p.platform, SUM(o.total_bill) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY YEAR(order_date), p.platform
ORDER BY year;

-- 8. Top 3 Cities by Orders for Each platfrom
CREATE VIEW top_3_cities_per_platfrom AS
SELECT c.city, COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.city
ORDER BY total_orders DESC
LIMIT 3;

-- 9. Least Orders by State (Bottom 3 by platform)
CREATE VIEW least_performing_states AS
SELECT c.state, SUM(o.total_bill) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.state
ORDER BY revenue ASC
LIMIT 3;


-- 10. Month-Year Wise Revenue Comparison
CREATE VIEW monthly_yearly_sales_comparison AS
SELECT YEAR(order_date) AS year, MONTH(order_date) AS month, SUM(o.total_bill) AS revenue
FROM orders o
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;


-- 11. Total Weekend Sales by Each platform
CREATE VIEW weekend_sales_by_platform AS
SELECT p.platform, SUM(o.total_bill) AS weekend_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
WHERE DAYOFWEEK(order_date) IN (1,7) -- Sunday=1, Saturday=7 (MySQL)
GROUP BY p.platform;

-- 12. Repeat Orders Per platform (Customer who ordered > 3 times)
CREATE VIEW repeat_orders_per_platform AS
SELECT c.customer_name, p.platform, COUNT(o.order_id) AS order_count
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name, p.platform
HAVING COUNT(o.order_id) > 2;

-- 13. Total Repeat Orders by platform
CREATE VIEW total_repeat_orders_summary AS
SELECT p.platform, COUNT(*) AS repeat_orders
FROM (
    SELECT customer_id, p.platform
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY customer_id, p.platform
    HAVING COUNT(order_id) > 1
) AS sub
JOIN products p ON sub.platform = p.platform
GROUP BY p.platform;






