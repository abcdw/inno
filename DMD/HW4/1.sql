SELECT m.moviename FROM Movies AS m
JOIN MovieSupplier AS ms ON m.movieid = ms.movieid
JOIN Suppliers AS s ON s.supplierid = ms.supplierid
WHERE suppliername <> 'Lionsgate' AND suppliername <> 'Pixar';
