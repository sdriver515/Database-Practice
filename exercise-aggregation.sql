use gravel_family;

-- Solve each task by writing a query below the task description.
-- Each task describes the expected result.
-- Unfortunately, tasks must be verified manually. :(

-- Example: 
-- Count the number of customer in Toronto
-- Expected: 14

-- select count(*)
-- from customer
-- where city = 'Toronto';

-- How many employees have the last_name 'Soyle'?
-- Expected: 12

-- select count(*)
-- from employee
-- where last_name = 'Soyle';

-- How many projects are there in the database?
-- Expected: 1121

-- select count(*)
-- from project;

-- What's the earliest project start_date?
-- Expected: 2017-09-23

-- select 
-- min(start_date)
-- from project;

-- What's the latest employee start_date?
-- Expected: 2020-08-25

-- select 
-- max(start_date)
-- from employee;

-- Count customers per city.
-- Expected: 88 Rows

-- select 
-- count(customer_id)
-- from customer
-- group by city;

-- Count customers per postal_code.
-- Expected: 84 Rows

-- select
-- count(customer_id)
-- from customer 
-- group by postal_code;

-- Count employees per last_name.
-- Expected: 3 Rows

-- select
-- count(last_name)
-- from employee;

-- Count the number of projects per city.
-- Expected: 88 Rows

-- select
-- count(customer_id)
-- from customer
-- group by city;

-- Count the number of projects per city.
-- Sort by the count descending and select the top 10 rows.
-- Expected: 10 Rows

-- select 
-- count(customer_id)
-- from customer 
-- group by city
-- order by count(customer_id) desc
-- limit 10;

-- Which postal_code has the most projects?
-- Expected: M3H

-- select 
-- count(customer_id),
-- postal_code
-- from customer
-- group by postal_code
-- order by count(customer_id) desc;

-- Count the number of projects per start_date year.
-- Expected: 4 Rows

-- select 
-- count(project_id),
-- extract(year from start_date) as year
-- from project 
-- group by year;

-- Count the number of employees per project in the M3H postal_code.
-- Group by project_id, sort by count descending.
-- Expected: 39 Rows

 -- select
 --    p.project_id,
 --    count(pe.employee_id)
 -- from customer c
 -- inner join project p on c.customer_id = p.customer_id
 -- inner join project_employee pe on p.project_id=pe.project_id
 -- inner join project_item pi on p.project_id = pi.project_id
 -- inner join item i on pi.item_id = i.item_id
 -- where c.postal_code = 'M3H'
 -- group by p.project_id;

-- Calculate the total cost per project in the 'M3H' postal_code.
-- (Hint: sum a calculation)
-- Expected: 39 Rows

-- select
--    p.project_id,
--    sum(pi.quantity * i.price_per_unit)
-- from customer c
-- inner join project p on c.customer_id = p.customer_id
-- inner join project_item pi on p.project_id = pi.project_id
-- inner join item i on pi.item_id = i.item_id
-- where c.postal_code = 'M3H'
-- group by p.project_id
-- order by sum(pi.quantity * i.price_per_unit) desc;

-- What's the most expensive project in the 'M3H' postal_code?
-- Expected: 18828.00

-- select
--    p.project_id,
--    sum(pi.quantity * i.price_per_unit)
-- from customer c
-- inner join project p on c.customer_id = p.customer_id
-- inner join project_item pi on p.project_id = pi.project_id
-- inner join item i on pi.item_id = i.item_id
-- where c.postal_code = 'M3H'
-- group by p.project_id
-- order by sum(pi.quantity * i.price_per_unit) desc
-- limit 1;

-- How many projects did each employee work on?
-- Expected: 33 Rows

-- select
-- count(project_id) as count_of_projects
-- from project_employee
-- group by employee_id;

-- How many employees worked on more than 140 projects?
-- Expected: 10 Rows

-- select
-- count(project_id) as count_of_projects
-- from project_employee
-- group by employee_id
-- having count_of_projects > 140;

-- How many projects cost more than $20,000?
-- Expected: 55 Rows

-- select
--    p.project_id,
--    sum(pi.quantity * i.price_per_unit) as total_cost_of_project 
-- from customer c
-- inner join project p on c.customer_id = p.customer_id
-- inner join project_item pi on p.project_id = pi.project_id
-- inner join item i on pi.item_id = i.item_id
-- group by p.project_id
-- having total_cost_of_project > 20000
-- order by total_cost_of_project desc;

-- Across all projects, what are the total costs per item?
-- Select the item name and sum.
-- Sort by the sum desc;
-- Expected: 18 Rows

-- Across all projects, what are the total costs per item category?
-- Select the category name and sum.
-- Sort by the sum desc;
-- Expected: 7 Rows

--  select
--     ct.category_id,
--     sum(pi.quantity * i.price_per_unit) as total_cost_of_project 
--  from customer c
--  inner join project p on c.customer_id = p.customer_id
--  inner join project_item pi on p.project_id = pi.project_id
--  inner join item i on pi.item_id = i.item_id
--  inner join category ct on i.category_id=ct.category_id
 -- group by ct.category_id;


-- What's the average 'Standard Labor' cost per city?
-- Expected: 88 Rows

-- NOTHING YET 

-- Challenge: Which customer has the first project of 2019?
-- (Requires a subquery.)
-- Expected: Starkie 2019-01-01