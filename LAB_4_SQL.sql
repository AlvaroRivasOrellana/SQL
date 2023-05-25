use sakila;

-- Get film ratings.
select title, rating
from film;

-- Get release years.

select title as "Film", release_year as "Release Year" 
from film;

-- Get all films with ARMAGEDDON in the title.
select title as "Film"
from film
Where title regexp 'ARMAGEDDON';

-- Get all films with APOLLO in the title
select title as "Film"
from film
where title regexp 'APOLLO';

-- Fet all films which title ends with APOLLO.
select title as "Film"
from film
where title regexp 'APOLLO$';

-- Get all films with word DATE in the title.
select title as "Film"
from film
where title like 'DATE %' OR  title like'% DATE';

-- Get 10 films with the longest title.
SELECT title as "Longest titles"
FROM film
ORDER BY LENGTH(title) DESC
LIMIT 10;

-- Get 10 the longest films.
select title "Longest Films"
from film
order by length desc
limit 10;

-- How many films include Behind the Scenes content?
select title as "Films (with behind the scene content)"
from film
where special_features like "%Behind the Scenes%";

-- List films ordered by release year and title in alphabetical order.
select concat(title,' - ',release_year) as "List of films"
from film
order by title asc;