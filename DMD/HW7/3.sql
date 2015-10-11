INSERT INTO Rentals_2 (RentalID, CustID, CheckOutDate, Title)
SELECT RentalID, CustID, CheckOutDate, Title1 FROM Rentals
UNION
SELECT RentalID, CustID, CheckOutDate, Title2 FROM Rentals
UNION
SELECT RentalID, CustID, CheckOutDate, Title3 FROM Rentals
