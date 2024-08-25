-- Based on the following table definitions and data, I wrote a query that returns each customer name along with their total payments:

-- customer Table:

+-------------+---------------+
| customer_id | name          |
+-------------+---------------+
|           1 | MARY SMITH    |
|           4 | BARBARA JONES |
|         210 | ELLA OLIVER   |
+-------------+---------------+
  
payment Table:

+------------+-------------+--------+
| payment_id | customer_id | amount |
+------------+-------------+--------+
|          1 |           1 |   2.99 |
|          4 |           1 |   0.99 |
|        210 |           8 |   4.99 |
+------------+-------------+--------+

-- all customers are included (while the examples filter on last_name and payment_id), even if no payment records exist for that customer.

SELECT c.name, SUM(p.amount) total
 FROM customer c
 LEFT OUTER JOIN payment p
 ON c.customer_id = p.customer_id
 GROUP BY c.name;

-- Here is a reformulated query from the previous one where I use the RIGHT outer join type that retrieves the same results as the previous query.

SELECT c.name, SUM(p.amount) total
 FROM payment p
 RIGHT OUTER JOIN customer c
 ON p.customer_id = c.customer_id
 GROUP BY c.name;

-- Here is a query that generates the set {1,2,3, ..., 99, 100}. (I use a cross join.)

SELECT ones.num + tens.num + hundreds.num as number_set
 FROM 
 (SELECT 0 num UNION ALL
 SELECT 1 num UNION ALL
 SELECT 2 num UNION ALL
 SELECT 3 num UNION ALL
 SELECT 4 num UNION ALL
 SELECT 5 num UNION ALL
 SELECT 6 num UNION ALL
 SELECT 7 num UNION ALL
 SELECT 8 num UNION ALL
 SELECT 9 num) ones
 CROSS JOIN
 (SELECT 0 num UNION ALL
 SELECT 10 num UNION ALL
 SELECT 20 num UNION ALL
 SELECT 30 num UNION ALL
 SELECT 40 num UNION ALL
 SELECT 50 num UNION ALL
 SELECT 60 num UNION ALL
 SELECT 70 num UNION ALL
 SELECT 80 num UNION ALL
 SELECT 90 num) tens
 CROSS JOIN
 (SELECT 1 num) hundreds
 ORDER BY ones.num + tens.num + hundreds.num;



