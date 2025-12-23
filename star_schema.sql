# Data Modelling

# Creating Schema
# Dimentions Table
# Dim_date
create table dim_date(
	date_id int auto_increment primary key,
    Full_date date,
    year int,
    month int,
    month_name varchar(20),
    quarter int,
    day int,
    week int);
    
# dim_location
create table dim_location(
	location_id int auto_increment primary key,
    state varchar(200),
    city varchar(200),
    location varchar(200));

# dim_Restaurant
create table dim_restaurant(
	restaurant_id int auto_increment primary key, 
    restaurant_name varchar(200));

# dim_Category
create table dim_category(
	category_id int auto_increment primary key, 
    category varchar(200));

# dim_Dish_name
create table dim_dish(
	dish_id int auto_increment primary key,
	dish_name varchar(200));
    
#fact table 
create table fact_swiggy_orders(
	order_id int auto_increment primary key,
    
    date_id int,
    price int,
    rating int,
    rating_count int,
    
    location_id int,
    restaurant_id int,
    category_id int,
    dish_id int,
    
    foreign key (date_id) references dim_date(date_id),
    foreign key (location_id) references dim_location(location_id),
    foreign key (restaurant_id) references dim_restaurant(restaurant_id),
    foreign key (category_id) references dim_category(category_id),
    foreign key (dish_id) references dim_dish(dish_id));
    
# insert into data in Fact & Dimentions tables
insert into dim_date(full_date,year,month,month_name,quarter,day,week)
select distinct
    order_date,
    year(order_date),
    month(order_date),
    monthname(order_date),
    quarter(order_date),
    day(order_date),
    week(order_date)
from swiggy_data
where order_date is not null;

# Dim_location
insert into dim_location(state,city,location)
select distinct
	state,
    city,
    location
from swiggy_data;

# Dim_Restaurant
insert into dim_restaurant(restaurant_name)
select distinct
    restaurant_name
from swiggy_data;

 # Dim_Category
insert into dim_category(category)
select distinct
    category
from swiggy_data;   

# Dim_Dish
insert into dim_dish(dish_name)
select distinct
    dish_name
from swiggy_data;  

# Fsct table
insert into fact_swiggy_orders(
	date_id,
    price,
    rating,
    rating_count,
    location_id,
    restaurant_id,
    category_id,
    dish_id
)
select
	dd.date_id,
    s.price,
    s.rating,
    s.rating_count,
    
    dl.location_id,
    r.restaurant_id,
    c.category_id,
    dsh.dish_id
from swiggy_data s

join dim_date dd 
	on dd.full_date = s.order_date

join dim_location dl 
	on dl.state = s.state
	and dl.city = s.city
	and dl.location = s.location
    
join dim_restaurant r
	on r.restaurant_name = s.restaurant_name
    
join dim_category c
	on c.category = s.category
    
join dim_dish dsh 
	on dsh.dish_name = s.dish_name;

select * from fact_swiggy_orders f
	join dim_date d on d.date_id = f.date_id
    join dim_location l on l.location_id = f.location_id
    join dim_restaurant r on r.restaurant_id = f.restaurant_id
    join dim_category c on c.category_id = f.category_id
    join dim_dish dsh on dsh.dish_id = f.dish_id;
    
