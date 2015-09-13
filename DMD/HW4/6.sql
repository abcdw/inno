SELECT c.FirstName, c.LastName FROM Rentals AS r
JOIN Inventory AS i ON r.tapeid = i.tapeid
JOIN Movies AS m ON m.movieid = i.movieid
JOIN Customers AS c ON c.custid = r.customerid
JOIN MovieSupplier AS ms ON ms.movieid = m.movieid
JOIN Suppliers AS s ON s.supplierid = ms.supplierid
WHERE m.moviename = 'Fatal Attraction 1987' OR s.SupplierName = 'VWS Video';
