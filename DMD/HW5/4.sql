SELECT movie, COUNT(movie) FROM nominations
GROUP BY movie
HAVING COUNT(movie) = (
    SELECT MAX(count) FROM (
        SELECT COUNT(movie) FROM nominations GROUP BY movie
    ) AS counts
)
ORDER BY movie;
