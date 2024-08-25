SELECT name,
CASE
WHEN language.name IN ('English', 'Italian', 'French', 'German')
THEN 'latin1'
ELSE 'utf8'
END character_set
FROM language;


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


SELECT
CASE
WHEN customer.last_name LIKE 'A%' THEN 'A'
WHEN customer.last_name LIKE 'B%' THEN 'B'
WHEN customer.last_name LIKE 'C%' THEN 'C'
WHEN customer.last_name LIKE 'D%' THEN 'D'
WHEN customer.last_name LIKE 'E%' THEN 'E'
WHEN customer.last_name LIKE 'F%' THEN 'F'
WHEN customer.last_name LIKE 'G%' THEN 'G'
WHEN customer.last_name LIKE 'H%' THEN 'H'
WHEN customer.last_name LIKE 'I%' THEN 'I'
WHEN customer.last_name LIKE 'J%' THEN 'J'
WHEN customer.last_name LIKE 'K%' THEN 'K'
WHEN customer.last_name LIKE 'L%' THEN 'L'
WHEN customer.last_name LIKE 'M%' THEN 'M'
WHEN customer.last_name LIKE 'N%' THEN 'N'
WHEN customer.last_name LIKE 'O%' THEN 'O'
WHEN customer.last_name LIKE 'P%' THEN 'P'
WHEN customer.last_name LIKE 'Q%' THEN 'Q'
WHEN customer.last_name LIKE 'R%' THEN 'R'
WHEN customer.last_name LIKE 'S%' THEN 'S'
WHEN customer.last_name LIKE 'T%' THEN 'T'
WHEN customer.last_name LIKE 'V%' THEN 'V'
WHEN customer.last_name LIKE 'W%' THEN 'W'
WHEN customer.last_name LIKE 'Y%' THEN 'Y'
END starts_with,
SUM(CASE WHEN customer.active = 1 THEN 1
ELSE 0 END) active_count,
SUM(CASE WHEN customer.active = 0 THEN 1
ELSE 0 END) inactive_count
FROM customer
GROUP BY starts_with
ORDER BY starts_with;

SELECT
CASE
WHEN customer.last_name LIKE 'A%' THEN 'A'
WHEN customer.last_name LIKE 'B%' THEN 'B'
WHEN customer.last_name LIKE 'C%' THEN 'C'
WHEN customer.last_name LIKE 'D%' THEN 'D'
WHEN customer.last_name LIKE 'E%' THEN 'E'
WHEN customer.last_name LIKE 'F%' THEN 'F'
WHEN customer.last_name LIKE 'G%' THEN 'G'
WHEN customer.last_name LIKE 'H%' THEN 'H'
WHEN customer.last_name LIKE 'I%' THEN 'I'
WHEN customer.last_name LIKE 'J%' THEN 'J'
WHEN customer.last_name LIKE 'K%' THEN 'K'
WHEN customer.last_name LIKE 'L%' THEN 'L'
WHEN customer.last_name LIKE 'M%' THEN 'M'
WHEN customer.last_name LIKE 'N%' THEN 'N'
WHEN customer.last_name LIKE 'O%' THEN 'O'
WHEN customer.last_name LIKE 'P%' THEN 'P'
WHEN customer.last_name LIKE 'Q%' THEN 'Q'
WHEN customer.last_name LIKE 'R%' THEN 'R'
WHEN customer.last_name LIKE 'S%' THEN 'S'
WHEN customer.last_name LIKE 'T%' THEN 'T'
WHEN customer.last_name LIKE 'U%' THEN 'U'
WHEN customer.last_name LIKE 'V%' THEN 'V'
WHEN customer.last_name LIKE 'W%' THEN 'W'
WHEN customer.last_name LIKE 'Y%' THEN 'Y'
END starts_with,
SUM(CASE WHEN customer.active = 1 THEN 1
ELSE 0 END) active_count,
SUM(CASE WHEN customer.active = 0 THEN 1
ELSE 0 END) inactive_count
FROM customer
GROUP BY starts_with
UNION ALL
SELECT 'U' starts_with, 0 active_count, 0 inactive_count
UNION ALL
SELECT 'X' starts_with, 0 active_count, 0 inactive_count
UNION ALL
SELECT 'Z' starts_with, 0 active_count, 0 inactive_count
ORDER BY starts_with;


SELECT
CASE
WHEN customer.last_name LIKE 'A%' THEN 'A'
WHEN customer.last_name LIKE 'B%' THEN 'B'
WHEN customer.last_name LIKE 'C%' THEN 'C'
WHEN customer.last_name LIKE 'D%' THEN 'D'
WHEN customer.last_name LIKE 'E%' THEN 'E'
WHEN customer.last_name LIKE 'F%' THEN 'F'
WHEN customer.last_name LIKE 'G%' THEN 'G'
WHEN customer.last_name LIKE 'H%' THEN 'H'
WHEN customer.last_name LIKE 'I%' THEN 'I'
WHEN customer.last_name LIKE 'J%' THEN 'J'
WHEN customer.last_name LIKE 'K%' THEN 'K'
WHEN customer.last_name LIKE 'L%' THEN 'L'
WHEN customer.last_name LIKE 'M%' THEN 'M'
WHEN customer.last_name LIKE 'N%' THEN 'N'
WHEN customer.last_name LIKE 'O%' THEN 'O'
WHEN customer.last_name LIKE 'P%' THEN 'P'
WHEN customer.last_name LIKE 'Q%' THEN 'Q'
WHEN customer.last_name LIKE 'R%' THEN 'R'
WHEN customer.last_name LIKE 'S%' THEN 'S'
WHEN customer.last_name LIKE 'T%' THEN 'T'
WHEN customer.last_name LIKE 'V%' THEN 'V'
WHEN customer.last_name LIKE 'W%' THEN 'W'
WHEN customer.last_name LIKE 'Y%' THEN 'Y'
END starts_with,
SUM(CASE WHEN customer.active = 1 THEN 1
ELSE 0 END) active_count,
SUM(CASE WHEN customer.active = 0 THEN 1
ELSE 0 END) inactive_count
FROM customer
GROUP BY starts_with
HAVING SUM(CASE WHEN customer.active = 1 THEN 1
ELSE 0 END) > 30
ORDER BY starts_with;
