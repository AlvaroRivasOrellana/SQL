use sakila;

select * from actor;



-- 1 // In the table actor, which are the actors whose last names are not repeated?

select first_name, last_name from actor
where last_name in
( select last_name from actor
	group by last_name
		having count(*) = 1)
order by last_name asc;



-- 2 // Which last names appear more than once?

select first_name, last_name from actor
where last_name in
( select last_name from actor
	group by last_name
		having count(*) > 1)
order by last_name asc;



-- 3 // How many rentals were processed by each employee?

select s.*, r.total_count from staff s
join
(select staff_id, count(*) as total_count
	from rental
		group by staff_id) r
on s.staff_id = r.staff_id;



-- 4 // How many films were released each year?

select release_year, count(*) as count
from film 
group by release_year;

select count(film_id) from film;  -- Found odd to find just one result



-- 5 // For each rating how many films were there?

select rating, count(*) as count
from film 
group by rating;



-- 6 // What is the mean lenght of the film for each rating type? 
-- Round off the average lenghts to two decimal places.

select rating, round(avg(length), 2) as mean_length
from film
group by rating;



-- 7 // Which kind of movies (rating) have a mean duration of more than two hours?

select rating from film
group by rating
having avg(length) > 120;

