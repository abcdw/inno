SELECT c.CustName FROM Customers AS c
JOIN Rentals_2 as r ON c.CustID = r.CustID
WHERE r.Title = "Die Hard"
