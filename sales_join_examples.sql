--Connect to schema 
set search_path to sales_project

--Example: Join customer and order data 
select 
	c.customer_id, c.customer_name, o.order_id, o.total_spent
from customers as c 
inner join orders as o
	on c.customer_id = o.customer_id
order by o.total_spent desc;

--Example: Join to show all customers, even ones with no purchases
select 
	c.customer_id, c.customer_name, o.order_id, o.total_spent
from customers as c
left join orders as o
	on c.customer_id= o.customer_id
order by c.customer_id;

--Example: Join to show all orders, even if no customer is attached
select 
	o.order_id, o.customer_id, c.customer_name, o.total_spent, o.order_spent
from customers as c 
right join orders as o
	on c.customer_id = o.customer_id
	
