-- =====================================================
-- Superstore SQL Project
-- File: 02_kpi_analysis.sql
-- Purpose: Calculate core business KPIs
-- =====================================================


-- =====================================================
-- OVERALL BUSINESS KPIs
-- =====================================================

-- 1. Total Sales
SELECT SUM(sales) AS total_sales
FROM superstore;


-- 2. Total Profit
SELECT SUM(profit) AS total_profit
FROM superstore;


-- 3. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM superstore;


-- 4. Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM superstore;


-- 5. Total Quantity Sold
SELECT SUM(quantity) AS total_quantity
FROM superstore;


-- 6. Average Order Value
SELECT 
    SUM(sales) / COUNT(DISTINCT order_id) AS avg_order_value
FROM superstore;


-- 7. Sales per Customer
SELECT 
    SUM(sales) / COUNT(DISTINCT customer_id) AS sales_per_customer
FROM superstore;


-- 8. Profit per Order
SELECT 
    SUM(profit) / COUNT(DISTINCT order_id) AS profit_per_order
FROM superstore;


-- 9. Average Discount
SELECT AVG(discount) AS avg_discount
FROM superstore;


-- 10. Profit Margin (%)
SELECT 
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin_percent
FROM superstore;



-- =====================================================
-- CATEGORY LEVEL KPIs
-- =====================================================

-- Sales & Profit by Category
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- Orders by Category
SELECT 
    category,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY category
ORDER BY total_orders DESC;


-- Customers by Category
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS total_customers
FROM superstore
GROUP BY category
ORDER BY total_customers DESC;


-- Profit Margin by Category
SELECT 
    category,
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin_percent
FROM superstore
GROUP BY category
ORDER BY profit_margin_percent DESC;
