-- a query against the film table that uses a filter condition with a noncorrelated subquery against the category table to find all action films (category.name = 'Action'):
 
 SELECT * FROM film 
     WHERE film_id IN (SELECT film_id 
     FROM film_category fc 
     INNER JOIN category c 
     ON fc.category_id = c.category_id  
     WHERE c.name = 'Action');

-- a reworked query from above using a correlated subquery against the category and film_category tables to achieve the same results:

SELECT * FROM film f 
     INNER JOIN film_category fc 
     ON f.film_id = fc.film_id 
     WHERE EXISTS (SELECT category_id 
     FROM category c 
     WHERE c.category_id = fc.category_id 
     AND c.name = 'Action');

-- joining the query that fabricated data to a subquery against the film_actor table to show the level of each actor. 
-- The subquery against the film_actor table counts the number of rows for each actor using group by actor_id, and the count is 
-- compared to the min_roles/max_roles columns to determine which level each actor belongs to:

 SELECT role_counts.actor_id, level_grps.level FROM (
     SELECT actor_id, count(*) tot_roles FROM film_actor GROUP BY actor_id) role_counts
     INNER JOIN 
     (
     SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
		UNION ALL
		SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles
		UNION ALL
		SELECT 'Newcomer' level, 1 min_roles, 19 max_roles) level_grps
        ON role_counts.tot_roles
			BETWEEN level_grps.min_roles AND level_grps.max_roles;
