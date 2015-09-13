SELECT * FROM Movies AS m
JOIN MovieSupplier AS ms ON ms.movieid = m.movieid
JOIN Suppliers AS s ON ms.supplierid = s.supplierid
WHERE m.moviename = 'Almost Angels 1962' AND ms.price = (
    SELECT MIN(price) FROM MovieSupplier AS ms
    JOIN Movies m ON m.movieid = ms.movieid
    WHERE m.moviename = 'Almost Angels 1962'
);
