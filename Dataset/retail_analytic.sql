use retai_analytic_db;
select*from customers;
select*from employees;
select*from orders;
select*from products;

select sum(sales_amount) as Total_sale, 
sum(profit) as Total_Profit,count(order_id) as total_order from orders;

select 
 month (order_date) month_ ,
 sum(sales_amount) as sales_
 from orders group by  month (order_date)  ;
 select region,sum(sales_amount)from orders group by region order by sum(sales_amount) desc limit 5;
 
select c.customer_id,c.customer_name, sum(o.sales_amount) as total_revenue
from customers c
join orders o 
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name order by total_revenue desc limit 10;

select sum(sales_amount) /
count(order_id) avg_order_value from orders; 

select sum(sales_amount)as Total_revenue ,
count(order_id)as Total_order,
payment_method from orders group by payment_method ;
select o.product_id, p.product_name,sum(o.profit) as total_revenue from orders o join products p on
 o.product_id = p.product_id
 group by o.product_id  order by total_revenue desc limit 1; 
 select p.category, sum(o.sales_amount) as  total_revenue from products p 
 join  orders o 
 on p.product_id = o.product_id
 group by p.category order by total_revenue desc limit 5;
 
select  p.category,
       SUM(o.sales_amount) AS total_revenue
from products p
join orders o
    on p.product_id = o.product_id	
GROUP BY p.category
ORDER BY total_revenue DESC
LIMIT 5;
select o.customer_id ,count(o.order_id) as order_count,c.customer_name from orders o
join customers c on
o.customer_id = c.customer_id 
 group by o.customer_id,c.customer_name having order_count >3;
 select region,AVG(discount_percent) avg_discount from orders group by region ;
 
select p.product_id,
       p.product_name
from products p
left join orders o
    ON p.product_id = o.product_id
WHERE o.product_id IS NULL;
select p.product_id ,p.product_name ,sum(o.quantity) as total_quantity from products p 
join orders o on 
p.product_id = o.product_id  
group by p.product_id,p.product_name  order by total_quantity desc limit 1;
select region,(sum(profit)/sum(sales_amount)) * 100 as profit_margin from orders group by region;
select month(order_date) as Month_, sum(profit) as Total_profit from orders group by month_;
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month_,
       SUM(profit) AS total_profit
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month_;
 
select c.customer_name, 
c.customer_id,
avg(o.sales_amount) as avg_order_value
from customers c join orders o on 
c.customer_id=o.customer_id group by c.customer_name, 
c.customer_id order by avg_order_value desc ;