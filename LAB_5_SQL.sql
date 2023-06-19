use sakila;


-- 1 // Drop column picture from staff.

alter table staff
drop column picture;


-- 2 //  A new person is hired to help Jon. Her name is TAMMY SANDERS,
-- and she is a customer. Update the database accordingly.

insert into staff (staff_id,first_name,last_name) values
(3, "Tammy", "Sanders");



-- 3 // Add rental for movie "Academy Dinosaur" by Charlotte Hunter
-- from Mike Hillyer at Store 1. You can use current date for 
-- the rental_date column in the rental table.

insert into rental
select (max(rental_id) + 1), -- new rental id
(select now()), -- time of rental
(select inventory_id from inventory where film_id = (select film_id from film where title= "ACADEMY DINOSAUR")
and store_id = (select store_id from staff where first_name = "Mike") limit 1), -- inventory id of the film
(select customer_id from customer where first_name = "Charlotte" and last_name = "Hunter"), -- id of customer
NULL, -- no return date
(select staff_id from staff where first_name = "Mike" and last_name = "Hillyer"), -- employee id
(select now()) -- last time the operation was updated
from rental;

select * from rental
order by rental_id desc;  -- it worked :D



-- 4 // Delete non-active users, but first, create a backup table deleted_users to
-- store customer_id, email, and the date for the users that would be deleted.

create table backup_nonactive
select * from customer
where active = 0;  -- check for non active customers and create a backup table with these


alter table backup_nonactive
drop column store_id,drop column address_id,drop column active;

select * from backup_nonactive; -- cleared the table of unnecessary columns of the table

SET FOREIGN_KEY_CHECKS = 0; -- seemed the better option to not cascade delete all the data in other tables

DELETE FROM customer
WHERE active = 0; -- delete inactive users from the customer data base


