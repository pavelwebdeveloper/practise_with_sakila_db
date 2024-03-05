-- a query that returns the 17th through 25th characters of the string 'Please find the substring in this string' by using a "Parsed" column alias

SELECT substring('Please find the substring in this string', 17, 9) as parsed;

-- a query that returns three columns. The first column provides the absolute value of -25.76823 with an alias of 'abs', 
-- the second column provides the sign (-1,0, or 1) of the number -25.76823 with an alias of 'sign', 
-- and the third column provides the number -25.76823 rounded to the nearest hundredth with an alias of 'round'.

SELECT abs(-25.76823) as abs, sign(-25.76823) as sign, round(-25.76823, 2) as round;

-- a query that returns just the month portion of the current date with a column alias of 'month' (for example, the number displayed changes with the day on which the query is run).

SELECT MONTH(CURRENT_DATE()) as month;
