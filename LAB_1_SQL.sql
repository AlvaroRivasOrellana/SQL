use sakila;


-- Get all the data from tables actor, film and customer.
select * from actor, film, customer;

-- Get film titles.
select title from film;

-- Get unique list of film languages under the alias language
select name as language from language;

-- Find out how many stores does the company have?
select count(store_id) from store; -- 2 Stores


-- Find out how many employees does the company have?
select count(customer_id) from customer; -- 599 Customers

-- Return a list of employee first names only?
select first_name from staff;