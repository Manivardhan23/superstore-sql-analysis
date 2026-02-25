-- =====================================================
-- Superstore SQL Project
-- File: 04_regional_analysis.sql
-- Purpose: Analyze regional and geographical performance
-- =====================================================


-- 1. Sales, Profit and Profit Margin by Region
SELECT 
    region,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0))::numeric * 100,
        2
    ) AS profit_margin_percent
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


-- 2. Sales and Profit by State
SELECT 
    state,
    ROUND(SUM(sales)::numeric, 2) AS total_sales,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_sales DESC;


-- 3. Loss-Making States
SELECT 
    state,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY state
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- 4. Top 5 Cities by Sales
SELECT 
    city,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY city
ORDER BY total_sales DESC
LIMIT 5;


-- 5. Profit Margin by Region
SELECT 
    region,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0))::numeric * 100,
        2
    ) AS profit_margin_percent
FROM superstore
GROUP BY region
ORDER BY profit_margin_percent DESC;


-- 6. Top 5 Most Profitable States
SELECT 
    state,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit DESC
LIMIT 5;


-- 7. Bottom 5 States by Profit
SELECT 
    state,
    ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit ASC
LIMIT 5;


-- 8. Average Discount by Region
SELECT 
    region,
    ROUND(AVG(discount)::numeric, 2) AS avg_discount
FROM superstore
GROUP BY region
ORDER BY avg_discount DESC;


-- 9. Profit Margin by State
SELECT 
    state,
    ROUND(
        (SUM(profit) / NULLIF(SUM(sales), 0))::numeric * 100,
        2
    ) AS profit_margin_percent
FROM superstore
GROUP BY state
ORDER BY profit_margin_percent DESC;


-- 10. Sales by Ship Mode per Region
SELECT 
    region,
    ship_mode,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY region, ship_mode
ORDER BY region, total_sales DESC;