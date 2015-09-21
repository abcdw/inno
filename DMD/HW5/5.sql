SELECT first_name, COUNT(first_name) FROM people
GROUP BY first_name
HAVING COUNT(first_name) = (
    SELECT MAX(count) FROM (
        SELECT COUNT(first_name) FROM people GROUP BY first_name
    ) AS cnt
)
ORDER BY first_name ASC
LIMIT 1;
