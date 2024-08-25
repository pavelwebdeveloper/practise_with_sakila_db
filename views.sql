The film rental company manager wants to have a report that includes the name of every country, together with the total payments for all customers who live in each country. 
Here is a view definition that queries the country table and uses a scalar subquery to calculate a value for a column named tot_payments.

CREATE VIEW country_tot_payments
(
country_id,
country,
tot_payments
)
AS
SELECT
    country_id, country, 
    (SELECT sum(p.amount)
        FROM country AS c
        INNER JOIN city AS ci ON c.country_id = ci.country_id
        INNER JOIN address AS a ON ci.city_id = a.city_id
        INNER JOIN customer AS cu ON a.address_id = cu.address_id
        INNER JOIN payment AS p ON cu.customer_id = p.customer_id
        WHERE c.country_id = country.country_id
    ) tot_payments
    FROM country;

-- Here is an example of a nonupdateable view that displays the result set showed below or any subset of columns in a single row where there's a column name for each rating. 
-- With the use of the following query:
-- SELECT *
-- FROM   rating_distribution;
-- The column names should be displayed in uppercase letters as: G, PG, PG_13, R, and NC_17.

+------+------+-------+------+-------+
| G    | PG   | PG-13 | R    | NC-17 |
+------+------+-------+------+-------+
|  178 |  194 |   223 |  195 |   210 |
+------+------+-------+------+-------+

CREATE VIEW rating_distribution
(G,
PG,
PG_13,
R,
NC_17)
AS
SELECT
    SUM(CASE WHEN film.rating = 'G' THEN 1
            ELSE 0 END) G,
    SUM(CASE WHEN film.rating = 'PG' THEN 1
            ELSE 0 END) PG,
    SUM(CASE WHEN film.rating = 'PG-13' THEN 1
            ELSE 0 END) 'PG-13',
    SUM(CASE WHEN film.rating = 'R' THEN 1
            ELSE 0 END) R,
    SUM(CASE WHEN film.rating = 'NC-17' THEN 1
            ELSE 0 END) 'NC-17'
FROM film
WHERE film.rating IN ('PG', 'G', 'NC-17', 'PG-13', 'R');

