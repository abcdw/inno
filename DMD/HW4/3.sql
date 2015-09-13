SELECT ms.supplierid FROM MovieSupplier AS ms
NATURAL JOIN Suppliers
GROUP BY ms.supplierid
HAVING COUNT(ms.supplierid) = (SELECT COUNT(DISTINCT movieid) FROM Inventory)
