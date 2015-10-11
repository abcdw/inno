SELECT c.CustName FROM Customers AS c
JOIN Rentals as r ON c.CustID = r.CustID
WHERE r.Title1 = "Die Hard" or r.Title2 = "Die Hard" or r.Title3 = "Die Hard"
