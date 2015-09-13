SELECT m.moviename FROM Inventory AS i
JOIN Movies AS m ON m.movieid = i.movieid
GROUP BY m.movieid HAVING COUNT(m.movieid) > 1;
