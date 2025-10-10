set search_path to sales_project;

--1.Revenue Totals 

--Total Sales by Year
select sum(total_spent) as yearly_revenue, extract(year from transaction_date) as year from retail_sales_copy group by year ;


--Total Sales by Category and Year 
select category, sum(total_spent) as department_revenue, 
extract(year from transaction_date) as year from retail_sales_copy
group by year, category
order by year, category;

--Total Sales by Item and Year
select category, item, sum(total_spent) as yearly_product_totals,
extract(year from transaction_date) as year from retail_sales_copy
group by year, category, item
order by year, yearly_product_totals desc;

--Total Overall Sales by Item
select category, item, sum(total_spent) as revenue_by_product
from retail_sales_copy
group by category, item
order by revenue_by_product desc;


--Total Overall Sales
select sum(total_spent) as current_revenue_total from retail_sales_copy;


--Total Transactions pear year 
select count(transaction_id), extract(year from transaction_date) as year
from retail_sales_copy group by year
order by year;


--2.Averages

--Average Spending by Year
select extract(year from transaction_date) as year,
round(avg(total_spent),2) as average_yearly_spending
from retail_sales_copy 
group by year
order by year;

--Average Spending By Customer By Year
select year, avg(customer_yearly_spending) avg_customer_spending_yearly 
from(
select customer_id,
	extract(year from transaction_date) as year, 
	sum(total_spent) as customer_yearly_spending
from retail_sales_copy
group by customer_id, year
)
group by year
order by year;

--Average Transactions Per Customer
select avg(purchases) avg_transactions_by_customer
from(
select customer_id, count(customer_id) as purchases
from retail_sales_copy
group by customer_id
);

--Average Daily Revenue by Day 
select to_char(transaction_date, 'Day') as day,
round(avg(total_spent), 2) as avg_daily_revenue
from retail_sales_copy
group by day
order by avg_daily_revenue desc;


--3.Customer Behavior

--Amount of Customers by Year 
select count(distinct customer_id) as customers,
	extract(year from transaction_date) as year 
from retail_sales_copy
group by year order by year;

--Repeat Customers and Their Totals
select customer_id, sum(total_spent) as repeat_spending,
count(transaction_id) as transaction_count
from retail_sales_copy 
group by customer_id 
having count(transaction_id)>1
order by repeat_spending desc;

--Repeat Customer Percentage (Assuming it is not 100% like this dataset)
select (count(*) * 100/ 
	(select count(distinct customer_id) from retail_sales_copy)) as repeat_percentage
from(
	select customer_id
from retail_sales_copy 
group by customer_id
having count(transaction_id)>1
);

--4. Other metrics 

--Percentage of Discounted Transactions Using CTE and FILTER
with total_transactions as (
select 
count(*) as total_count,
count(*) filter (where trim(discount_applied)='true') as discounted_ct
from retail_sales_copy
)
select (discounted_ct * 100 /total_count) as prcntg_discounted
from total_transactions;


--Least Selling Products 
select category, item, sum(total_spent) as revenue 
from retail_sales_copy 
group by category, item order by revenue 
limit 10;

--Data Collection Time for 2025 
select count(transaction_id) as total_transactions_2025 
from retail_sales_copy 
where extract(year from transaction_date)=2025;


