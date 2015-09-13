SELECT COUNT(*), s.SupplierName FROM Inventory AS i
JOIN MovieSupplier AS ms ON ms.movieid = i.movieid
JOIN Suppliers AS s ON ms.supplierid = s.supplierid
GROUP BY s.supplierid
