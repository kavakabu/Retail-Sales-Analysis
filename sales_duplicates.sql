--If duplicates are exact matches, then create a new table with distinct rows
-- create table retail_sales_clean as select distinct * from retial_sales_copy


--If duplicates have different information, decide which one is necessary by its date
--1. Create a new table 

 create table retail_sales_clean as
 select * from retail_sales_copy;
 
 --2. Truncate the table (remove contents, keep structure) 
 truncate table retail_sales_clean
 
 
 --3. This inserts rows based on the row_number function, it groups similar rows 
 --but only keeps the the most recent row based on the date
 
insert into retail_sales_clean
select transaction_id, customer_id ... (all columns)
from(
 	select *,
 	 row_number () over (
 		partition by transaction_id
 		order by transaction_date desc
 		) as num_of_duplicates 
 	from retail_sales_copy
 	) sub where num_of_duplicates=1;
 	
 --4.Check the distinct transaction id's
 
 select count(*) as total_rows, 
 count(distinct transaction id) as unique_id	
 from retail_sales_clean;
 	
 --5.Drop retail_sales_copy if necessary, as beginner I would keep it
 
