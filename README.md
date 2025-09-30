# Task-6-Sales-Trends-Analysis
By Using SQL
1. Objective 
The primary goal of this task was to perform a time series analysis on the e-commerce sales data to calculate two key performance indicators (KPIs) on a monthly basis:

Total Monthly Revenue

Total Monthly Order Volume

This analysis was achieved by applying SQL aggregation functions and grouping techniques to reveal sales trends across the dataset spanning 2009 to 2011.

2. Dataset and Preprocessing 
Source Files	Final Data Table	Rows (After Cleaning)	Time Space
online_sales_final_for_sql_task.csv- Year 2009-2010.csv	2009-12-01 to 2011-12-09
online_sales_final_for_sql_task.csv- Year 2010-2011.csv			


Preprocessing Steps:
Consolidation: The two source CSV files were combined into a single dataset.

Cleaning: Rows representing returns or cancellations (Quantity ≤0 or Price ≤0) were filtered out to ensure the aggregation reflects only positive sales transactions.

Import: The cleaned data was loaded into a PostgreSQL/MySQL table named online_sales.

Key Columns Used:
Column	Data Type (SQL)	Role in Analysis
Invoice	VARCHAR	Used to calculate Order Volume.
InvoiceDate	TIMESTAMP/DATETIME	Used for Grouping by month and year.
Quantity	INTEGER	Used to calculate Revenue (Quantity×Price).
Price	NUMERIC/FLOAT	Used to calculate Revenue (Quantity×Price).


3. The Final SQL Script 💻
The following single SQL query was used to achieve the monthly trend analysis:

SQL

SELECT
    -- Grouping: Extracts year and month from the date for aggregation
    EXTRACT(YEAR FROM InvoiceDate) AS sales_year,
    EXTRACT(MONTH FROM InvoiceDate) AS sales_month,
    
    -- KPI 1: Calculate Total Monthly Revenue
    SUM(Quantity * Price) AS total_revenue,
    
    -- KPI 2: Calculate Total Monthly Order Volume (Unique Transactions)
    COUNT(DISTINCT Invoice) AS order_volume
    
FROM
    online_sales
    
-- Group by the extracted year and month to aggregate the KPIs
GROUP BY
    sales_year,
    sales_month
    
-- Order chronologically to display the sales trend over time
ORDER BY
    sales_year,
    sales_month;
4. Key SQL Concepts Demonstrated ✨
Concept	Function/Clause	Description
Revenue Calculation	SUM(Quantity×Price)	Multiplies the unit price by the quantity for every line item, then sums the results up for the entire group (month/year).
Order Volume	COUNT(DISTINCT Invoice)	Uses the DISTINCT keyword to count only the unique Invoice IDs, ensuring each order is counted just once, regardless of the number of items.
Grouping	GROUP BY	This clause is essential for aggregate functions, partitioning the entire dataset into monthly buckets before applying the SUM and COUNT calculations.
Date Manipulation	EXTRACT(... FROM InvoiceDate)	Used to pull the specific year and month components needed for the GROUP BY operation.


5. Deliverables
sales_trend_analysis.sql (The SQL script above).

results_screenshot.png (Screenshot of the final output table showing sales_year, sales_month, total_revenue, and order_volume).

online_sales_final_for_sql_task.csv (The consolidated and cleaned dataset).
