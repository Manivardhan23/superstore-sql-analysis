-- =====================================================
-- Superstore SQL Project
-- File: 03_customer_analysis.sql
-- Purpose: Analyze customer performance and profitability
-- =====================================================


-- 1. Top 10 Customers by Total Sales
SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- 2. Top 10 Customers by Total Profit
SELECT
    customer_id,
    customer_name,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_profit DESC
LIMIT 10;


-- 3. Customers with Negative Lifetime Profit
SELECT
    customer_id,
    customer_name,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY customer_id, customer_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- 4. Top 5 Most Unprofitable Customers
SELECT
    customer_id,
    customer_name,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY customer_id, customer_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 5;


-- 5. Customer Lifetime Value (CLV)
SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales)::numeric, 2) AS customer_lifetime_value
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY customer_lifetime_value DESC;


-- 6. Sales, Profit and Profit Margin by Category
SELECT
    category,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0))::numeric * 100,
        2
    ) AS profit_margin_percent
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- 7. Sales, Profit and Profit Margin by Segment
SELECT
    segment,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0))::numeric * 100,
        2
    ) AS profit_margin_percent
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;
