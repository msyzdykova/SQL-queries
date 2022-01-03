use sakila;
# Select all columns from the table "actor" (only the first 100 rows)
select * from actor
limit 100;
# Select last name column from the table "actor"
select last_name from actor;
# Select title, description, rental duration, rental rate, total rental cost (rental duration*rental rate) from the table "film":
select title, description, rental_duration, rental_rate, rental_duration*rental_rate as total_rental_cost from film;
# Select unique last names from the table "actor"
select distinct last_name from actor;
# Select unique postal codes from the table "address"
select distinct postal_code from address;
# Select unique ratings from the table "flm"
select distinct rating from film;
# ---------------------------------------------------------#

# Select columns title, description, rating, length from the table "film" that last longer than 3 hours
select title, description, rating, length from film
where length > 180;
# Select columns payment_id, amount, payment_date from the table "payment", in which payments were made on 05/27/2005 or later
select payment_id, amount, payment_date from payment
where payment_date >= '2005-05-27';
# Select all columns from the table "customer", in which last names start with an "S" and end with an "N"
select * from customer
where last_name like 's%' and first_name like '%n';
# Select all columns from the table "customer", in which client is inactive and his/her last name starts with an "M"
select * from customer
where active = 0 and last_name like 'm%';
# Select all columns from the table "category", in which primary key is more than 4 and column "name" starts with a "C", "S" or "T"
select * from category
where category_id > 4 and name like 'c%' or name like 's%' or name like 't%';
# Select all columns from the table "staff", except for the column "password" with password values in it.
select * from staff
where password is null; 
# ---------------------------------------------------------#

select * from payment;
# Select columns phone, district from the table "address"with the following district values: California, England, Taipei or West Java.
select phone, district from address
where district = 'California' or district = 'England' or district = 'Taipei' or district = 'West Java';
# Select columns payment_id, amount, payment_date from the table "payment", in which payments were made on 05/25/2005, 05/27/2005, 05/29/2005.
select payment_id, amount, payment_date from payment
where payment_date like '2005-05-25%' or payment_date like '2005-05-27%' or payment_date like '2005-05-29%';
# Select all columns from the table "film", in which film's rating is G, PG-13 or NC-17.
select * from film
where rating = 'G' or rating = 'PG-13' or rating = 'NC-17';
# ---------------------------------------------------------#

# Select all columns from the table "payment", in which payment were made between 05/25/2005 and 05/27/2005.
select * from payment
where payment_date between '2005-05-25' and '2005-05-27';
# Select title, description, release year, total rental cost (rental duration*rental rate) from the table "film", in which film's length is between 100 and 120.
select * from film;
select title, description, release_year, rental_duration*rental_rate as total_rental_cost from film
where length in (100, 120);
# ---------------------------------------------------------#

# Select title, description, release year from the table "film", in which description starts with "A Thoughtful"
select title, description, release_year from film
where description like 'A Thoughtful%';
# Select title, description, rental duration from the table "film", in which description ends with "Boat"
select title, description, release_year from film
where description like '%Boat';
# Select title, length, description, rental rate from the table "film", in which description contains a word "database" and film lasts longer than 3 hours.
select title, length, description, release_year from film
where description like '%Database%' and length > 180;
# ---------------------------------------------------------#

# Select all columns from the table "film" and sort rows based on the column length in an ascending order
select * from film
order by length;
# Select unique ratings from the table "film" sorted based on the column rating in a descending order
select distinct rating from film
order by rating desc;
# Select columns payment date, amount from the table "payment" sorted based on the column amount in a descending order (only the first 20 rows)
select payment_date, amount from payment
order by amount desc
limit 20;
# ---------------------------------------------------------#

# Select columns first name, last name from the table "customer" and first name, last name from the table "actor" using left join
# Rename customer first name, last name as customer_first_name, customer_last_name
# Rename actor first name, last name as customer_first_name, customer_last_name
select a.first_name as customer_first_name, a.last_name as customer_last_name, b.first_name as actor_first_name, b.last_name as actor_first_name
from customer a
left join actor b
on a.first_name = b.first_name and a.last_name = b.last_name;
# Select columns first name, last name from the table "customer" and first name, last name from the table "actor" using right join
# Rename customer first name, last name as customer_first_name, customer_last_name
# Rename actor first name, last name as customer_first_name, customer_last_name
select a.first_name as customer_first_name, a.last_name as customer_last_name, b.first_name as actor_first_name, b.last_name as actor_first_name
from customer a
right join actor b
on a.first_name = b.first_name and a.last_name = b.last_name;
# Select columns first name, last name from the table "customer" and first name, last name from the table "actor" using inner join only on last name
# Rename customer first name, last name as customer_first_name, customer_last_name
# Rename actor first name, last name as customer_first_name, customer_last_name
select a.first_name as customer_first_name, a.last_name as customer_last_name, b.first_name as actor_first_name, b.last_name as actor_last_name
from customer a
join actor b
on a.last_name = b.last_name;
# Select columns city, country from the table "city" using left join with the table "country"
select * from staff;
select * from address;
select * from city;
select a.city, b.country
from city a
left join country b
on a.country_id = b.country_id;
# Select columns title, description, release year, language name from the table "film" using left join with the table "language"
select a.title, a.description, a.release_year, b.name
from film a
left join language b
on a.language_id = b.language_id;
# Select columns first name, last name, address, address2, city name, district, postal code from the table "staff" using 2 left joins with the table "address" and "city"
select a.first_name, a.last_name, b.address, b.address2, c.city as city_name, b.district, b.postal_code
from staff a
left join address b
on a.address_id = b.address_id
left join city c
on b.city_id = c.city_id;