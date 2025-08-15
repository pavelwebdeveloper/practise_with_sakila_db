-- a query that counts the number of rows in a payment table

SELECT COUNT(*) as number_of_rows
FROM payment;

-- The previous query is modified in order to count the number of payments made by each customer. It shows the customer_id and the total amount paid for each customer

SELECT customer_id, COUNT(*) as number_of_payments, SUM(amount) total_paid
FROM payment
GROUP BY customer_id;

-- The previous query is modified in order to include only those customers who have at least 40 payments

SELECT customer_id, COUNT(*) as number_of_payments, SUM(amount) total_paid
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40;
