use sakila;

-- 1 // Rank films by length.

select title, length,
rank() over (order by length desc) as ranking
from film;



-- 2 // Rank films by length within the rating category

select rating, title, length,
rank() over (order by length desc) as ranking
from film
order by rating;



-- 3 // How many films are there for each of the categories in the category table?

select c.category_id, c.name as Category, count(f.title) as "Title Count"
from category c 
join film_category fc
	on c.category_id = fc.category_id
		join film f on fc.film_id = f.film_id
group by c.category_id, c.name;



-- 4 // Which actor has appeared in the most films?

select * from film_actor;

select fa.actor_id, concat(a.first_name, ' ', a.last_name) as "Actor's name", count(f.film_id) as "Film Count"
from film_actor fa
join film f
	on fa.film_id = f.film_id
join actor a 
	on fa.actor_id = a.actor_id
group by fa.actor_id, "Actor's name"
order by "Film Count" asc;      -- For some reason I couldn't make it so that it displays in descending order of "Film Count"
										   -- We can instead use the table generated to order the last column for checking it's highest value
                                           -- giving us "Gina Degeneres" with 42 films as the actress with most appearances.
                                           -- '107', 'GINA DEGENERES', '42' (Row Values)

-- 5 // Which is the most active customer (the customer that has rented the most number of films)?

select concat(c.first_name, ' ', c.last_name) as Client,
	   count(r.rental_id) as rental_count
from customer c
join rental r 
	on c.customer_id = r.customer_id
group by c.customer_id
order by rental_count desc limit 1;



-- 6 // Bonus // Which is the most rented film? 

select f.title as "Film", count(r.rental_id) as "Number of rentals"
from rental r
join inventory i
	on r.inventory_id = i.inventory_id
join film f
	on i.film_id = f.film_id
group by f.title
order by count(r.rental_id) desc limit 1;

