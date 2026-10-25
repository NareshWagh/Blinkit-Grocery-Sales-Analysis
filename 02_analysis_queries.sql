-- ========================================================
-- PART 1: HIGH-LEVEL BUSINESS KPIs
-- ========================================================

-- KPI 1: Total Sales Revenue
SELECT ROUND(SUM(Sales), 2) AS total_sales
FROM blinkit;

-- KPI 2: Average Sales per Item
SELECT ROUND(AVG(Sales), 2) AS avg_sales
FROM blinkit;


-- KPI 4: Total Number of Items
SELECT COUNT(*) AS total_items
FROM blinkit;


-- ========================================================
-- PART 2: DEEP-DIVE BUSINESS ANALYSIS QUERIES
-- ========================================================

-- Q1: Sales by Fat Content — do customers prefer Low Fat?
SELECT Item_Fat_Content,
       ROUND(SUM(Sales), 2) AS total_sales,
       COUNT(*) AS item_count,
FROM blinkit
GROUP BY Item_Fat_Content;

-- Q2: Which item types generate the most revenue?
SELECT Item_Type,
       ROUND(SUM(Sales), 2) AS total_sales,
       COUNT(*) AS item_count
FROM blinkit
GROUP BY Item_Type
ORDER BY total_sales DESC;

-- Q3: Sales performance by outlet size
SELECT Outlet_Size,
       ROUND(SUM(Sales), 2) AS total_sales,
       COUNT(*) AS outlet_count,
       ROUND(AVG(Sales), 2) AS avg_sales_per_item
FROM blinkit
GROUP BY Outlet_Size
ORDER BY total_sales DESC;

-- Q4: Which location tier performs best?
SELECT Outlet_Location_Type,
       ROUND(SUM(Sales), 2) AS total_sales,
FROM blinkit
GROUP BY Outlet_Location_Type
ORDER BY total_sales DESC;

-- Q5: Sales by outlet type
SELECT Outlet_Type,
       ROUND(SUM(Sales), 2) AS total_sales,
       COUNT(*) AS item_count,
       ROUND(AVG(Sales), 2) AS avg_sales
FROM blinkit
GROUP BY Outlet_Type
ORDER BY total_sales DESC;

-- Q6: Top selling items grouped by MRP price range
SELECT CASE
           WHEN Item_MRP < 50 THEN 'Budget (Under 50)'
           WHEN Item_MRP BETWEEN 50 AND 100 THEN 'Mid (50-100)'
           WHEN Item_MRP BETWEEN 100 AND 200 THEN 'Premium (100-200)'
           ELSE 'Luxury (200+)'
       END AS price_range,
       COUNT(*) AS item_count,
       ROUND(SUM(Sales), 2) AS total_sales,
FROM blinkit
GROUP BY price_range
ORDER BY total_sales DESC;

-- Q7: Best performing outlet type + location combination
SELECT Outlet_Type,
       Outlet_Location_Type,
       ROUND(SUM(Sales), 2) AS total_sales
FROM blinkit
GROUP BY Outlet_Type, Outlet_Location_Type
ORDER BY total_sales DESC
LIMIT 10;
