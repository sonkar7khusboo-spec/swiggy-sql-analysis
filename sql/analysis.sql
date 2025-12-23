# Analysis 

# KPI 
# Total Orders
select 
	count(*) as Total_orders
from fact_swiggy_orders;

# Total Revenue 
select 
	concat(format(sum(price)/1000000, 2),' INR Millon') as Total_revenue
from fact_swiggy_orders;

# Avgrage dish Price
select 
	concat(format(avg(price),2),' INR Millon') as Avg_orders
from fact_swiggy_orders;

# Avg Rating
select 
	avg(rating) as avg_rating
from fact_swiggy_orders;

# Deep_Dive Business analysis
# Monthy Orders trands
select 
	d.year,
    d.month,
    d.month_name,
count(*) as month_orders
from fact_swiggy_orders f
	join dim_date d on d.date_id = f.date_id
group by 
	d.year,
    d.month,
    d.month_name
having count(*)
order by month_orders desc;

# # Quaterly Orders trands
select 
	d.year,
    d.quarter,
count(*) as quartery_orders
from fact_swiggy_orders f
	join dim_date d on d.date_id = f.date_id
group by 
	d.year,
    d.quarter
having count(*)
order by quartery_orders desc;

# Yearly Trands
select 
	d.year,
count(*) as yearly_orders
from fact_swiggy_orders f
	join dim_date d on d.date_id = f.date_id
group by 
	d.year
having count(*)
order by yearly_orders desc;

# Order by date of week
select
	dayname(d.full_date) as day_name,
    count(*) total_orders
from fact_swiggy_orders f
	join dim_date d on d.date_id = f.date_id
group by
	dayname(d.full_date), weekday(d.full_date)
having count(*)
order by day_name desc;

# location based analysis
# Top 10 cites by order volume
select 
	l.city,
    count(*) as total_orders
from fact_swiggy_orders f
	join dim_location l on l.location_id = f.location_id
group by l.city
order by total_orders desc
limit 10;

# Revenue contribution by state
select 
	l.state,
    sum(price) as Total_revenue
from fact_swiggy_orders f
	join dim_location l on l.location_id = f.location_id
group by l.state
order by Total_revenue desc
limit 10;

# Food Performance
# top 10 restaurants by orders
select 
	r.restaurant_name,
    sum(price) as total_revenue
from fact_swiggy_orders f
	join dim_restaurant r on r.restaurant_id = f.restaurant_id
group by r.restaurant_name
order by  total_revenue desc
limit 10;

# Top 10 categores
select 
	c.category,
    count(*) as total_orders
from fact_swiggy_orders f
	join dim_category c on c.category_id = f.category_id
group by c.category
order by  total_orders desc
limit 10;

# Most ordered dishes 
select 
	dsh.dish_name,
    count(*) as total_orders
from fact_swiggy_orders f
	join dim_dish dsh on dsh.dish_id = f.dish_id
group by dsh.dish_name
order by  total_orders desc
limit 10;

# Cuision Performance (Orders + Avg Rating)
select 
	c.category,
    count(*) as total_orders,
    avg(f.rating) as avg_rating
from fact_swiggy_orders f
	join dim_category c on c.category_id = f.category_id   
group by c.category
order by total_orders desc;

# Total_Orders by Price Range
	SELECT 
    CASE
        WHEN CAST(price AS DECIMAL(10,2)) < 100 THEN 'Under 100'
        WHEN CAST(price AS DECIMAL(10,2)) BETWEEN 100 AND 199 THEN '100 - 199'
        WHEN CAST(price AS DECIMAL(10,2)) BETWEEN 200 AND 299 THEN '200 - 299'
        WHEN CAST(price AS DECIMAL(10,2)) BETWEEN 300 AND 499 THEN '300 - 499'
        ELSE '500+'
    END AS price_range,
    COUNT(*) AS total_orders
FROM fact_swiggy_orders
GROUP BY 
    CASE
        WHEN CAST(price AS DECIMAL(10,2)) < 100 THEN 'Under 100'
        WHEN CAST(price AS DECIMAL(10,2)) BETWEEN 100 AND 199 THEN '100 - 199'
        WHEN CAST(price AS DECIMAL(10,2)) BETWEEN 200 AND 299 THEN '200 - 299'
        WHEN CAST(price AS DECIMAL(10,2)) BETWEEN 300 AND 499 THEN '300 - 499'
        ELSE '500+'
    END
ORDER BY total_orders DESC;

# Rating Count distribution (1-5)
select 
	rating,
    count(*) as ranting_count
from fact_swiggy_orders
group by rating
order by ranting_count desc;

