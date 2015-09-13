SELECT DISTINCT c.FirstName, c.LastName FROM Rentals AS r
JOIN Customers AS c ON c.custid = r.customerid
WHERE r.duration > 1;
