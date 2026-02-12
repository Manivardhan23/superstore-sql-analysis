-- =====================================================
-- Superstore SQL Project
-- File: 01_check_data.sql
-- Purpose: Validate data before analysis
-- =====================================================


-- 1. Total number of rows
SELECT COUNT(*) AS total_rows
FROM superstore;


-- 2. Check NULL values in important columns
SELECT COUNT(*) AS null_customer_id
FROM superstore
WHERE customer_id IS NULL;

SELECT COUNT(*) AS null_order_date
FROM superstore
WHERE order_date IS NULL;

SELECT COUNT(*) AS null_sales
FROM superstore
WHERE sales IS NULL;

SELECT COUNT(*) AS null_profit
FROM superstore
WHERE profit IS NULL;


-- 3. Check for exact duplicate rows
SELECT 
    row_id, order_id, order_date, ship_date, ship_mode,
    customer_id, customer_name, segment, country, postal_code,
    city, state, region, product_id, category, sub_category,
    product_name, sales, quantity, discount, profit,
    COUNT(*)
FROM superstore
GROUP BY 
    row_id, order_id, order_date, ship_date, ship_mode,
    customer_id, customer_name, segment, country, postal_code,
    city, state, region, product_id, category, sub_category,
    product_name, sales, quantity, discount, profit
HAVING COUNT(*) > 1;


-- 4. Understand order date range
SELECT 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM superstore;


-- 5. List unique product categories
SELECT DISTINCT category
FROM superstore
ORDER BY category;


-- 6. List unique product sub_categories
SELECT DISTINCT sub_category
FROM superstore
ORDER BY sub_category;