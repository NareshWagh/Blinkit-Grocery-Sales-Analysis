-- ========================================================
-- STEP 1: CREATE TABLE SCHEMA
-- ========================================================
CREATE TABLE blinkit (
    Item_Fat_Content TEXT,
    Item_Type TEXT,
    Item_MRP REAL,
    Outlet_Size TEXT,
    Outlet_Location_Type TEXT,
    Outlet_Type TEXT,
    Item_Visibility REAL,
    Item_Rating REAL,
    Sales REAL
);

-- ========================================================
-- STEP 2: CHECK FOR INCONSISTENT LABELS
-- ========================================================
SELECT DISTINCT Item_Fat_Content
FROM blinkit;

-- ========================================================
-- STEP 3: STANDARDIZE DATA VALUES
-- Standardise: 'LF' and 'low fat' → 'Low Fat', 'reg' → 'Regular'
-- ========================================================
UPDATE blinkit
SET Item_Fat_Content = 'Low Fat'
WHERE Item_Fat_Content IN ('LF', 'low fat');

UPDATE blinkit
SET Item_Fat_Content = 'Regular'
WHERE Item_Fat_Content = 'reg';
