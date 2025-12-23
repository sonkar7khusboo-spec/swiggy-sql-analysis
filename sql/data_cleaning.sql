use sql_project;

# Data Validation & cleaning
# Null Check
select 
	sum(case when state is null then 1 else 0 end) as null_state,
    sum(case when city is null then 1 else 0 end) as null_city,
    sum(case when Order_date is null then 1 else 0 end) as null_order_date,
    sum(case when restaurant_name is null then 1 else 0 end) as null_restaurant_name,
    sum(case when location is null then 1 else 0 end) as null_location,
    sum(case when category is null then 1 else 0 end) as null_category,
    sum(case when dish_name is null then 1 else 0 end) as null_dish_name,
    sum(case when price is null then 1 else 0 end) as null_price,
    sum(case when rating is null then 1 else 0 end) as null_rating,
    sum(case when rating_count is null then 1 else 0 end) as null_rating_count
from swiggy_data;
    
# Blank & Empty String
select * from swiggy_data
	where
	state = '' or city = '' or restaurant_name = '' or location = '' or category = '' or dish_name = '';
    
# Duplicate Diduction 
select 
	state,city,Order_date,restaurant_name,location,category,dish_name,price,rating,rating_count , count(*) as duplicated
from swiggy_data
group by state,city,Order_date,restaurant_name,location,category,dish_name,price,rating,rating_count
having count(*) >1;
    
# Delete Duplicate Value
delete from swiggy_data
	where id in (
		with CTE as (
		select *, 
			row_number() over(partition by state,city,Order_date,restaurant_name,location,category,dish_name,price,rating,rating_count order by id) as rn from swiggy_data)
            select id from CTE where rn >1);

