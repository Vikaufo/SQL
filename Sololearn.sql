-- Complete the command to list all of the databases.
show databases;
-- View a list of tables for the currently selected database.
show tables;
-- View the columns from the 'customers' table.
show columns
from customers;
-- Build a query to get distinct results from the 'customers' table.
select distinct state 
from customers;
-- Complete the following statement, which selects five names from 'students'.
select name
from students limit 5;
-- Select the 'id' and 'name' columns from 'customers'. Show 12 results, starting from the fifth.
select id, name
from customers
limit 4, 12;
-- At the conclusion of a bank transaction, 6 checks are printed -- 3 originals for the bank, and 3 copies for the customer. 
-- Write a query to show only the unique checks that are given to the customer.
select distinct checks
from Operation;
-- Fill in the blanks to select the 'address' from 'customers', using the fully qualified name for the 'address' column.
select customers.address 
from customers;
-- Build a query to select 'name' and 'city' from the 'people' table, and order by the 'id'.
select name, city
from people order by id;
-- A local bakery creates unique cake sets. Each cake set contains three different cakes.
-- Тoday a customer want a cake set that has minimal calories.
-- Write a query to sort the cakes by calorie count and select the first 3 cakes from the list to offer the customer.
select name, calories from cakes
order by calories asc
limit 3;
-- Select student names whose id is greater than or equal to 12.
select id, name 
from students 
where id >= 12;
-- Build a query to select the names of students whose ids are between 13 and 45.
select id, name
from students
where id between 13 and 45;
-- Select all values from the ''people'' table where the city equals to ''Boston''.
select * from people
where city = 'Boston';
-- Select customers who live in Hollywood, CA.
select * from customers
where state = 'CA' and city = 'Hollywood';
-- Select customers who live either in CA or in Boston.
select name, state, city 
FROM customers 
where state = 'CA' or city = 'Boston';
-- Select customers whose ids are either 1 or 2, and whose city is ''Boston''.
select * from customers
where (id = 1 or id = 2) and city = 'Boston';
-- Select users from NY and CA.
select * from users
where state = 'NY' or state = 'CA';
-- Select customers from NY, CA, or NC, using the IN statement.
select name, state 
from customers 
where state IN ('CA', 'NY', 'NC');
-- Select concatenated ''city'' and ''state'' columns, represented with a new custom column named ''new_address''.
select concat (city, ', ', state)
as new_address
from customers;
-- Select the average cost from the ''items'' table.
select avg(cost)
from items;
-- Select all items from the ''items'' table for which cost is greater than 463. Order the result by cost in descending order.
select * from items
where cost > 463
order by cost desc;
-- Search ''boxes'' in the ''name'' column of the ''items'' table.
select seller_id FROM items
where name like '%boxes';
-- Select ''name'' and minimum of the "cost'' from ''items'', filtering by name and seller id.
select name, min(cost) 
from items where name 
like '%boxes of frogs' AND seller_id in(68, 6, 18);
-- You want to rent an apartment and have the following table named Apartments.
-- Write a query to output the apartments whose prices are greater than the average and are also not rented, sorted by the 'Price' column.
select * from Apartments
where price > (select avg(price) from Apartments) and status = 'Not rented'
order by price;
-- Complete the following statement, which shows item names and the names of customers who bought the items.
select customers.name, items.names 
from customers, items
where items.seller_id = customers.id;
-- Fill in the blanks to select item names and names of customers who bought the items. Use custom names to shorten the statement.
select ct.name, it.name
from customers as ct, items AS it 
where it.seller_id = ct.id;
-- Outer join the table ''items'' with ''customers''.
select customers.name, items.name
from customers
left outer join items on customers.id = seller_id
-- Insert the data into the ''students'' table.
insert into students
values ('John Smith', 'MIT');
-- Update the ''students'' table by changing the university's value to ''Stanford'' if the student's name is ''John''.
update students 
set university = 'Stanford'
where name = 'John';
-- Delete a row from ''people'' in which the ids falls in the range of 5 to 10.
delete from people
where id>5 and id<10;
-- Create a table with three columns: ''id'' as a primary key, username and password of type varchar.
create table test (
id int,
username varchar(30),
password varchar(20),
primary key(id)
);
-- Create a table with an auto incremented and not empty primary key ''id''.
create table test (
id int not null auto_increment,
name varchar(30) not null,
primary key(id)
);
-- Add a new column entitled ''specialty'' to the table ''students''.
alter table students 
add specialty varchar(50);
-- Delete the column named DateOfBirth in the People table.
alter table people
drop column DateOfBirth;
-- Rename the table ''people'' as ''humans''.
rename table people
to humans;
-- Create a view named ''temp'' for students with the highest marks.
create view temp as
select id, name, mark
from students
order by mark desc
limit 10;
-- You manage a zoo. Each animal in the zoo comes from a different country. 
-- 1) A new animal has come in, with the following details:
-- name - "Slim", type - "Giraffe", country_id - 1
-- Add him to the Animals table.
-- 2) You want to make a complete list of the animals for the zoo’s visitors. 
-- Write a query to output a new table with each animal's name, type and country fields, sorted by countries.
insert into Animals (name, type, country_id)
values ('Slim', 'Giraffe', '1');
select Animals.name, Animals.type, Countries.country from Animals 
inner join Countries
on Animals.country_id = Countries.id
order by Countries.country;
============================================
-- Challenge 1
-- 1. In the "users" table of website logins and passwords, select the first 10 records in the table.
select * from users
limit 10;
-- 2. Create the table "users" to store website user logins and passwords.
create table users (
id int not null
auto_increment
login varchar(100),
password varchar(100) 
);
-- 3. Rearrange the query to select all students under age 21. The result should be sorted according to the students' names.
select * from students
where age < 21
order by name;
-- 4. Your boss asks you to print the list of the first one hundred customers who have balances greater than $1000 or who are from NY.
select * from customers
where balance > 1000
or city = 'NY'
limit 100;
-- 5. You need the ages of all bears and lions. The first query shows the ages of bears and birds from zoo1, the other shows the ages of lions and crocodiles from zoo2.
select age from zoo1
where animal in('bear', 'bird')
union
select age from zoo2
where animal in('lion', 'crocodile');
-- 6. Create a list of customers in the form "name is from city".
select(name, 'is from', city)
from customers;
-- 7. The zoo administration wants a list of animals whose age is greater than the average age of all of the animals. 
select * from zoo
where age > (select avg(age) from zoo);
-- 8. There are many wolves in the zoo: black wolf, white wolf, lucky wolf, little wolf. They all have 'wolf' at the end of their names. Print the ages of all of the wolves.
select age from zoo
where animal like '%wolf';
-- Challenge 2
-- 1. Retrieve all students between the ages of 18 and 22.
select name from students
where age between 18 and 22;
-- 2. Update the "students" table to set Jake's university to MIT. His id is 682.
update students
set university = 'MIT'
where id = 682
-- 3. When you inserted "elephant" as a new animal, you forgot to include the elephant's age. Correct this mistake by updating the "zoo" table.
update zoo
set age = 14
where animal = 'elephant';
-- 4. Update the food_balance to 23 for animals whose age is greater than the average age of the animals.
update zoo
set food_balance = 23
where age > (select avg(age) from zoo);
-- 5. You need your customer's names, along with the names of the cities in which they live. The names of the cities are stored in a separate table called "cities".
select customers.name, cities.name
from customers
right outer join cities
on cities.id = customers.city_id;
-- 6. In the university's table containing student data, the students' last names have been omitted. Correct this by adding a new column to the table.
alter table students
add last_name varchar(100);
-- 7. Retrieve from MIT, Stanford, and Harvard the names of all students whose first name is Jake.
select name from students
where university in('MIT', 'Stanford', 'Harvard')
and name = 'Jake';
