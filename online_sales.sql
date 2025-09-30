create table online_retail_sales(
    -- Unique transaction ID
    Invoice     VARCHAR(50) NOT NULL,
    
    -- Date and Time of the transaction (MySQL uses DATETIME)
    InvoiceDate DATETIME NOT NULL, 
    
    -- Items sold 
    Quantity    INT NOT NULL,
    
    -- Unit price 
    Price       DECIMAL(10, 2) NOT NULL
);
LOAD DATA INFILE 'C:/Users/AAVIIN/Desktop/priyanka/online_sales_final_for_sql_task.csv'
INTO TABLE online_retail_sales
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
select * from online_sales;
SELECT
    -- 1. GROUPING YEAR: Extracts the year for the first grouping level
    EXTRACT(YEAR FROM InvoiceDate) AS sales_year,
    
    -- 2. GROUPING MONTH: Extracts the month for the second grouping level
    EXTRACT(MONTH FROM InvoiceDate) AS sales_month,
    
    -- 3. AGGREGATION (REVENUE): Calculates total monthly sales amount
    SUM(Quantity * Price) AS total_revenue,
    
    -- 4. AGGREGATION (VOLUME): Counts the unique number of transactions/orders
    COUNT(DISTINCT Invoice) AS order_volume
    
FROM
    online_sales  -- Your table name
    
-- 5. GROUPING: Applies the SUM and COUNT to all rows sharing the same year and month
GROUP BY
    sales_year,
    sales_month
    
-- 6. SORTING: Orders the results chronologically for trend analysis
ORDER BY
    sales_year,
    sales_month;
    
    
    