USE SAKILA;

select first_name, last_name, email from sakila.customer
where active = 1;

#avg for each customer
select c.customer_id, concat(c.first_name, c.last_name) as 'customer_name', avg(p.amount) as 'average_payment'
from sakila.customer as c
join sakila.payment as p on c.customer_id = p.customer_id
group by customer_id;


#Select the name and email address of all the customers who have rented the "Action" movies.
select c.email, concat(c.first_name, c.last_name) as 'customer_name', cat.name from sakila.customer as c 
left join sakila.rental as r on c.customer_id = r.customer_id
join sakila.inventory as i on r.inventory_id = i.inventory_id
join sakila.film_category as ca on ca.film_id = i.film_id
join sakila.category as cat on cat.category_id = ca.category_id
where cat.name='Action'
group by c.customer_id;



