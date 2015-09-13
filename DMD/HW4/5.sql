SELECT m.moviename FROM Orders AS o
JOIN Movies AS m ON o.movieid = m.movieid
WHERE o.copies > 4;
