use sakila;



-- Select all the actors with the first name ‘Scarlett’.
select first_name, last_name
from actor
where first_name = 'SCARLETT';




-- Select all the actors with the last name 'Johansson'.
select first_name, last_name
from actor
where last_name = 'JOHANSSON';




-- How many films (movies) are available for rent?
select count(inventory_id) from inventory; -- 4581 total movies (copies)
select count(DISTINCT film_id) as 'Different films' from inventory; -- 958 films in the catalog




-- How many films have been rented?
select count(rental_id) as 'Films rented' from rental; -- 16,044 films rented




-- What is the shortest and longest rental period?
SELECT max(TIMESTAMPDIFF(MINUTE, rental_date, return_date)) as "Max Rental Period"
from rental; 			 -- The longest rent lasted 13319 minutes, or 222 hours(aprox).
SELECT min(TIMESTAMPDIFF(MINUTE, rental_date, return_date)) as "Min Rental Period"
from rental;			 -- The shortest rent lasted 1080 minutes, or 18 hours.

/* I later found a column named 
"rental_duration" in the 'film' table,
but it doesn't specify the unit of time. 
For the sake of the exercise
 it would work as it follows:*/
 
select min(rental_duration) as 'Shortest rent' from film; -- 3 units of time
select max(rental_duration) as 'Longest rent' from film; -- 7 units of time




-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select min(length) as 'Shortest film' from film; -- 46 
select max(length) as 'Longest film' from film;  -- 185




-- What's the average movie duration?
select floor(avg(length)) as 'Average film duration' from film; -- The average film duration last an aprox. 115 mins.


-- What's the average movie duration expressed in format (hours, minutes)?
select convert(floor(avg(length)),time) as 'Average film duration' from film; -- Average film duration: 00:01:15



-- How many movies longer than 3 hours?
select count(length) from film
where length > 180					-- 39 films last more than 3 hours.
order by length desc;


-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select concat(concat(substring(first_name,1,1),lower(substring(first_name,2,length(first_name)))),' ',upper(last_name),' - ',lower(email))
as 'Customer Details'  from customer;



-- What's the length of the longest film title?
select length(title) from film
order by length(title) desc; -- The longest title has 27 characters.

select * from language