use gravel_family;

-- Solve each task by writing a query below the task description.
-- Each task describes the expected result.
-- Unfortunately, tasks must be verified manually. :(

-- Example:
-- Select first_name and last_name from customer,
-- user_name from login where rows from both tables are required.
-- Expected: 659 Rows

-- select
-- 	c.first_name,
--     c.last_name,
--     l.user_name
-- from customer c
-- inner join login l on c.customer_id = l.customer_id;

-- Select first_name and last_name from customer,
-- user_name from login where rows from both tables are required.
-- Sort by user_name descending.
-- Expected: 659 Rows

-- select 
-- customer.first_name,
-- customer.last_name,
-- login.user_name
-- from customer customer
-- inner join login login on customer.customer_id = login.customer_id
-- order by user_name desc;


-- Select first_name and last_name from customer,
-- user_name from login where rows from both tables are required.
-- Only customers whose last name starts with 'W'.
-- Sort by user_name descending.
-- Expected: 24 Rows

-- select 
-- customer.first_name,
-- customer.last_name,
-- login.user_name
-- from customer customer
-- inner join login login on customer.customer_id = login.customer_id
-- where customer.last_name like 'W%'
-- order by user_name desc;

-- Join item and category. Select the item name and category name.
-- Expected: 19 Rows

-- select 
-- *
-- from item item
-- inner join category category on item.category_id = category.category_id

-- Join item and category. Select the item name and category name.
-- Create an alias for each column: item_name and category_name
-- Sort by the category_name, then item_name.
-- Expected: 19 Rows

-- select 
-- item.`name` as 'Item Name', 
-- category.`name` as 'Category Name'
-- from item item
-- inner join category category on item.category_id = category.category_id

-- Select name and price_per_unit from item,
-- name from unit. Make rows from both tables required.
-- Add column aliases to avoid confusion from two `name` columns.
-- Expected: 19 Rows

-- select 
-- item.`name` as 'Item Name', 
-- item.price_per_unit as 'Items price per unit',
-- unit.`name` as 'Unit Name'
-- from item item
-- inner join unit unit on item.unit_id = unit.unit_id

-- Select all columns from item, category, and unit.
-- Make all rows required.
-- Expected: 19 Rows

-- select
-- item.*,
-- category.*,
-- unit.*
-- from item 
-- join category on category.category_id=item.category_id
-- join unit on unit.unit_id=item.unit_id;

-- Select first_name, last_name from customer,
-- select description from project,
-- where the customer's last_name starts with 'B' or 'D'.
-- If a customer doesn't have a project, still include them.
-- (Hint: left outer join)
-- Expected: 228 Rows

-- select 
-- customer.first_name,
-- customer.last_name,
-- project.`description`
-- from customer 
-- left outer join project 
-- on project.customer_id=customer.customer_id
-- where customer.last_name like 'B%'
-- or customer.last_name like 'D%';

-- Find all customers who do not have a project.
-- Expected: 195 Rows

-- select 
-- customer.first_name,
-- customer.last_name
-- from customer 
-- left outer join project 
-- on project.customer_id=customer.customer_id
-- where project.customer_id is null;

-- Find all customers who do not have a login.
-- Expected: 341 Rows

-- select 
-- customer.first_name,
-- customer.last_name
-- from customer 
-- left outer join login
-- on login.customer_id=customer.customer_id
-- where login.customer_id is null;

-- Find all employees who are not assigned to a project.
-- Expected: 0 Rows

-- select 
-- *
-- from employee
-- left outer join project_employee
-- on employee.employee_id=project_employee.employee_id
-- where project_id is null;

-- Select employee_id, first_name, and last_name from employee,
-- project_id and description from project
-- where the employee last_name equals `Gravel`.
-- Expected: 958 Rows

-- select 
-- employee.employee_id,
-- employee.first_name,
-- employee.last_name,
-- project.project_id,
-- project.`description`
-- from employee
-- left outer join project_employee
-- on employee.employee_id=project_employee.employee_id
-- left outer join project 
-- on project.project_id=project_employee.project_id
-- where last_name = 'Gravel';

-- Which employees worked on a project for the customer
-- with last_name equal to 'Rao'?
-- Expected: Itch Gravel, Alang Durt, Ynez Durt, Ddene Soyle,
-- Mychal Soyle, Hugo Durt

-- select 
-- employee.employee_id,
-- employee.first_name,
-- employee.last_name,
-- project.project_id,
-- project.`description`
-- from employee
-- left outer join project_employee
-- on employee.employee_id=project_employee.employee_id
-- left outer join project 
-- on project.project_id=project_employee.project_id
-- left outer join customer 
-- on project.customer_id=customer.customer_id
-- where customer.last_name = 'Rao';

-- Find employees and projects for projects in 2017.
-- Select project_id from project and names from employee.
-- Expected: 410 Rows

-- select 
-- *
-- from employee
-- left outer join project_employee
-- on employee.employee_id=project_employee.employee_id
-- left outer join project 
-- on project.project_id=project_employee.project_id
-- where project.start_date like '2017-%-%';

-- Create an "invoice" with line item totals (calculated field)
-- for items billed to projects for the customer with last_name 'Stelfox'.
-- Include the customer's names, project_id, item name, and calculated cost.
-- Expected:
-- Lanie Stelfox 481 Machine Labor     9720.000000
-- Lanie Stelfox 481 Standard Labor    3675.000000
-- Lanie Stelfox 481 Construction Sand 336.000000
-- Lanie Stelfox 481 Class 5 Gravel    624.000000
-- Lanie Stelfox 481 Wall Stone        3452.100000

-- select 
-- customer.first_name,
-- customer.last_name,
-- project.project_id,
-- item.`name`,
-- item.unit_id,
-- item.price_per_unit,
-- project_item.quantity * item.price_per_unit as 'total'
-- from project

-- left outer join project_employee
-- on project.project_id=project_employee.project_id

-- left outer join project_item
-- on project.project_id=project_item.project_id

-- left outer join customer 
-- on customer.customer_id=project.customer_id

-- left outer join item
-- on project_item.item_id=item.item_id;

-- Find customers without logins using a `right outer` join.
-- Expected: 341 Rows

-- select 
-- customer.customer_id as Customer_ID,
-- login.customer_id,
-- login.password_hash
-- from login
-- right outer join customer
-- on login.customer_id=customer.customer_id
-- where login.customer_id is null;

-- List category with its parent category, but make the parent category
-- optional to include categories without a parent.
-- Expected: 8 Rows

-- select 
-- category.*,
-- item.category_id as items_category_id
-- from category
-- left outer join item
-- on item.category_id=category.category_id
-- group by category.category_id;

-- Write an "everything" query:
-- customer_id and names from customer
-- description from project
-- quantity from project_item
-- name from item
-- name from category
-- name from unit
-- for customers in the 'L3K' postal_code.
-- Expected: 39 Rows

-- NOT WORKING

select 
customer.customer_id,
customer.last_name,
project.`description`,
project_item.quantity,
item.`name` as item_name,
unit.`name` as unit_name

from project

left outer join project_item
on project.project_id=project_item.project_id

left outer join customer 
on project.customer_id=customer.customer_id

left outer join item
on project_item.item_id=item.item_id

left outer join unit
on item.unit_id=unit.unit_id

left join category
on category.category_id=item.category_id

where customer.postal_code='L3K';

-- STRETCH GOAL
-- Determine which customers employee Fleur Soyle worked for in
-- the 'M3H' postal_code. All customers in the postal_code should be included
-- regardless of if they have a project or Fleur worked on it.
-- Though something should indicate if Fleur was on a M3H project.
-- Expected: 48 Rows, 3 projects that Fleur worked on.