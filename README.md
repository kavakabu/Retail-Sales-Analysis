# Retail-Sales

Overview
This project analyzes simulated retail sales data (2022-2025) to evaluate revenue trends, customer behavior, product importance and more. This dataset contains approximately 10000 records. Cleaning and analysis were conducted through PostgreSQL and visualizations were created on tableau public.


Objectives
The primary objective is to explore and summarize retail data to answer key business questions
-	How are sales performing over time?
-	Which products and departments drive the most revenue?
-	Who are the most valuable customers?
-	What is the percentage of repeat customers?
-	What percentage of sales are discounted
-	Which products are underperforming?

Key Skills Demonstrated
SQL foundations: SELECT, WHERE, GROUP BY, HAVING, ORDER BY
Aggregation: SUM( ), AVG( ), COUNT( ), ROUND( )
Data cleaning: TRIM ( ), LOWER( ), CAST( ) and handling NULL values 
CTE & Subqueries for duplicates and better logic
Joins: Demonstrated using INNER JOIN, LEFT JOIN and RIGHT JOIN
Exporting Clean Data from PostgreSQL to csv for Tableau integration
Documentation: Comments in scripts walk through cleaning and analysis process

Key Performance Indicators (KPI’s)
Revenue KPI’s: yearly sales, category sales, item sales and overall revenue.
Average KPI’s: average spending per year, per customer, transactions per customer, average daily revenue .
Customer behavior KPI’s: number of customers per year, repeat customer totals, repeat customer percentage .
Other Metrics: percent of discounted transactions, percentage of online vs in person purchases, least-selling products

Analysis/Insights
Yearly Sales: Revenue is steady, with a high in 2024. Given there is only 3 weeks of information from 2025, insights for this year are too premature. With prediction, revenue should grow at least 6 % 
Category Sales: The Beverage Department remains the highest grossing department across years, averaging around $60000 each year
Product Sales: Item 25 (furniture department) alongside item 19 (electronic department) coming are top performers both bringing in right under $10000 over the years
Repeat Customers: 100% of customers were repeat customers, given optimal rates for retail are 20-40%, this is 
Discounted Transactions: Around 1/3 or 33% of transactions are discounted
Purchase Methods: Purchases are split 49% in store and 51% online 

Recommendations
-	Repeat customer rate is very high, continue pushing out discounts through rewards program
-	Expand best-selling categories like beverages and electronics
-	Focus on products and categories within electronic household items and food, consider using competitive products or removing any that sell less than 200 units 
-	For 2025, focus on Milk and Patisserie departments, as they have the least sales
-	Furniture brings in the highest transaction amounts, this should be marketed strategically to keep sales 
-	Beverages sold the most last year, market beverages as top selling
-	Depending on desires and financials, consider delivery and holiday sales to drive more traffic online 
-	Brick and mortar is half of the sales, consider location preference and expansion for in store sales
