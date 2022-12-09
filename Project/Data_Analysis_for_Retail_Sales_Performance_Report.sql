-- Overall Performance by Year
select date_format(order_date, '%Y') as years, sum(sales) as sales, count(order_quantity) as number_of_order
from dqlab_sales_store
where order_status = 'Order Finished' 
group by years
having years between 2009 and 2012
order by years;

-- Overall Performance by Product Sub Category
select date_format(order_date, '%Y') as years,  product_sub_category, sum(sales) as sales
from dqlab_sales_store
where order_status = 'Order Finished' 
group by years, product_sub_category
having years between 2011 and 2012
order by years, sales desc;

-- Promotion Effectiveness and Efficiency by Years
select date_format(order_date, '%Y') as years, sum(sales) as sales, sum(discount_value) as promotion_value, round((sum(discount_value) / sum(sales))*100, 2) as burn_rate_percentage
from dqlab_sales_store
where order_status = 'Order Finished' 
group by years
order by years;

-- Promotion Effectiveness and Efficiency by Product Sub Category
select date_format(order_date, '%Y') as years,  product_sub_category, product_category, sum(sales) as sales, sum(discount_value) as promotion_value, round((sum(discount_value) / sum(sales))*100, 2) as burn_rate_percentage
from dqlab_sales_store
where order_status = 'Order Finished' 
group by years, product_sub_category, product_category
having years = 2012
order by years desc, sales desc;

-- Customers Transactions per Year
select date_format(order_date, '%Y') as years, count(distinct customer) as number_of_customer  
from dqlab_sales_store
where order_status = 'Order Finished' 
group by years
order by years; 