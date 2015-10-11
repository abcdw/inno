CREATE TABLE Rentals_2(
    RentalID INTEGER NOT NULL,
    CustID INTEGER NULL,
    CheckOutDate DATETIME NOT NULL,
    Title char(50) NOT NULL,
    PRIMARY KEY(RentalID, Title),
    FOREIGN KEY (CustID) REFERENCES Customers(CustID)
);
