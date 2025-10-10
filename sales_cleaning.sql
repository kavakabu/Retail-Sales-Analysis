set search_path to sales_project;

select * from retail_sales_copy;
select count(*) from retail_sales_copy;

--Step 0: Alter any columns for better formatting, datatype preferences

 
-- For the GUI used, discount column is not easily readable, convert to text
alter table retail_sales_copy
alter column discount_applied type text
using discount_applied::text; 

--Step 1: Retrieve duplicates
select transaction_id, count(*) as sales_number
from retail_sales_copy
group by transaction_id
having count(*) > 1;

select count(distinct transaction_id) as unique_ids 
from retail_sales_copy;

--I ensured duplicates were not present before importing, but if there were 
--to be duplicates please see duplicates script.



--Step 2: Finding nulls, this has many approaches, I will check by column, so I can explore better 


--Rows where item is missing, price per unit is missing as well, calculate unit price with division
select transaction_id, item, total_spent, quantity, total_spent/quantity as unit_price
from retail_sales_copy where price_per_unit is null;

--Replace price per unit with the calculation
update retail_sales_copy
set price_per_unit=total_spent/quantity 
where price_per_unit is null
and total_spent is not null
and quantity is not null; 


--Prices are similar across categories 
select category, item, price_per_unit from retail_sales_copy
where item ='' group by category, item, price_per_unit order by category, price_per_unit;

--Try to find the items manually 
select category, price_per_unit, item from retail_sales_copy
where category='Beverages' and price_per_unit=5;

--Check how many to fix 
select count(*) as missing_items 
from retail_sales_copy
where item ='' ;

--Mark null items as unknown 
--Report the item name discrepancy as a technical issue that should be fixed 
update retail_sales_copy 
set item= 'Unknown'
where item ='';


--Check quantities that are missing 
select price_per_unit, quantity, total_spent 
from retail_sales_copy where quantity is null; 

--CTE was made to handle duplicates 
--For analysis however, they do not contribute to sales measurements so they have been removed here

with missing_sales as (
select * 
from retail_sales_copy 
where quantity is null 
and total_spent is null 
) 

select count(*) as missing from missing_sales;

--There are 604 rows where item is unknown and quantity and total spent are missing
delete from retail_sales_copy
where quantity is null
and total_spent is null
and (item='' or item='Unknown');

--Check for any more missing sales information 
select count(*) from retail_sales_copy where item='Unknown' and quantity is null and total_spent is null;

select count(*) from retail_sales_copy where item='Unknown' or quantity is null or total_spent is null;

select count(*) from retail_sales_copy where 
(payment_method is null) or 
(p_location is null or p_location ='') or 
(transaction_date is null);
