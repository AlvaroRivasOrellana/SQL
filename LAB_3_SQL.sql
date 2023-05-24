use Sakila;

-- How many distinct (different) actors' last names are there?
select COUNT(distinct last_name) as "Number of different last names" from actor;

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct language_id) as "Number of production languages" from film;

-- How many movies were released with "PG-13" rating?
select count(distinct title) as "Number of PG-13 movies" 
from film
where rating = 'PG-13';

-- Get 10 the longest movies from 2006.
SELECT title FROM film
where release_year = '2006'
ORDER BY length DESC
limit 10;

-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(payment_date), min(payment_date)) as "Time operating" from payment;

-- Show rental info with additional columns month and weekday. Get 20.
select *,

CASE
    WHEN WEEKDAY(date(rental_date)) = 0 THEN "Monday"
    WHEN WEEKDAY(date(rental_date)) = 1 THEN "Tuesday"
    WHEN WEEKDAY(date(rental_date)) = 2 THEN "Wednesday"
    WHEN WEEKDAY(date(rental_date)) = 3 THEN "Thursday"
    WHEN WEEKDAY(date(rental_date)) = 4 THEN "Friday"
    WHEN WEEKDAY(date(rental_date)) = 5 THEN "Saturday"
    WHEN WEEKDAY(date(rental_date)) = 6 THEN "Sunday"
    ELSE 'Error'
END as "Day of the week",

CASE
    WHEN MONTH(date(rental_date)) = 1 THEN "January"
    WHEN MONTH(date(rental_date)) = 2 THEN "February"
    WHEN MONTH(date(rental_date)) = 3 THEN "March"
    WHEN MONTH(date(rental_date)) = 4 THEN "April"
    WHEN MONTH(date(rental_date)) = 5 THEN "May"
    WHEN MONTH(date(rental_date)) = 6 THEN "June"
    WHEN MONTH(date(rental_date)) = 7 THEN "July"
    WHEN MONTH(date(rental_date)) = 8 THEN "August"
    WHEN MONTH(date(rental_date)) = 9 THEN "September"
    WHEN MONTH(date(rental_date)) = 10 THEN "October"
    WHEN MONTH(date(rental_date)) = 11 THEN "November"
    WHEN MONTH(date(rental_date)) = 12 THEN "December"
    ELSE 'Error'
END as "Month"

FROM rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *,

CASE
    WHEN WEEKDAY(date(rental_date)) between 0 AND 4 THEN "Working day"
    WHEN WEEKDAY(date(rental_date)) = 5 OR 6 THEN "Weekend"
    ELSE 'Error'
END as "Day of the week"

from rental;

-- How many rentals were in the last month of activity?
select count(date(rental_date)) as "Last Month's Rentals" 
from rental
where date(rental_date) = '2006-02-14';