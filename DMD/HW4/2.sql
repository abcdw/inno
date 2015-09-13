SELECT m.moviename FROM Movies AS m
JOIN Inventory AS i ON m.movieid = i.movieid
JOIN Rentals AS r ON r.tapeid = i.tapeid
WHERE r.duration = (SELECT MAX(duration) FROM Rentals);
