CREATE DATABASE OnlineSale;
USE OnlineSale;

-- imported dataset "online_sales_dataset" via MySQL Workbench Import Wizard (GUI)
SHOW TABLES;

DESCRIBE online_sales_dataset;
SELECT COUNT(*) AS total_rows,
       COUNT(InvoiceDate) AS rows_with_dates
FROM online_sales_dataset;

SELECT * FROM online_sales_dataset LIMIT 10;

-- 1. Monthly Revenue and Order Volume
SELECT
    YEAR(InvoiceDate) AS order_year,
    MONTH(InvoiceDate) AS order_month,
    SUM(Quantity * UnitPrice * (1 - Discount)) AS monthly_revenue,
    COUNT(DISTINCT InvoiceNo) AS order_volume
FROM
    online_sales_dataset
WHERE
    InvoiceDate IS NOT NULL
GROUP BY
    YEAR(InvoiceDate),
    MONTH(InvoiceDate)
ORDER BY
    order_year,
    order_month;

    
-- 2. Top 3 Months by Revenue

SELECT
    YEAR(InvoiceDate) AS order_year,
    MONTH(InvoiceDate) AS order_month,
    SUM(Quantity * UnitPrice * (1 - Discount)) AS monthly_revenue
FROM
    online_sales_dataset
WHERE
    InvoiceDate IS NOT NULL
GROUP BY
    YEAR(InvoiceDate),
    MONTH(InvoiceDate)
ORDER BY
    monthly_revenue DESC
LIMIT 3;


-- 3. Preview the Date Range

SELECT 
    MIN(InvoiceDate) AS first_date, 
    MAX(InvoiceDate) AS last_date
FROM 
    online_sales_dataset;








