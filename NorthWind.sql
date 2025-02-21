--1. Select all the rows from the "Customers" table
SELECT * FROM Customers;

--2. Get distinct countries from the Customers table. (Hint: research the DISTINCT keyword.)
SELECT DISTINCT Country 
FROM Customers;

--3. Get all the rows from the table Customers where the Customer’s ID starts with “BL”.
SELECT * FROM Customers
WHERE CustomerID LIKE 'BL%';

--4. Get the first 100 records of the orders table. 
--(Hint: research the TOP keyword.)DISCUSS: Why would you do this? 
--What else would you likely need to include in this query?
SELECT TOP 100 * FROM Orders;

--5. Get all customers that live in the postal codes 1010, 3012, 12209, and 05023. 
--(Hint: research the IN keyword.)
SELECT * FROM Customers
WHERE PostalCode IN ('1010', '3012', '12209', '05023');

--6. Get all orders where the ShipRegion is not equal to NULL.
SELECT * FROM ORDERS
WHERE ShipRegion IS NULL;

--7. Get all customers ordered by the country, then by the city.
SELECT * FROM Customers
ORDER BY Country, City; 

--8.Add a new customer to the customers table. You can use whatever values.
INSERT INTO Customers(CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
VALUES('CUISA', 'Nazima LLC', 'Taj', 'Owner', '5ª Ave. Los Palos Grandes', 'London', null, '48188', 'UK', '(171) 555-7788', null);

--9. Update all ShipRegion to the value ‘EuroZone’ in the Orders table, 
--where the ShipCountry is equal to France.
UPDATE Orders
SET ShipRegion = 'EuroZone'
WHERE ShipCountry = 'France';

SELECT * FROM Orders
WHERE ShipCountry = 'France';

--10. Delete all orders from OrderDetails that have quantity of 1.
DELETE FROM [Order Details] 
WHERE Quantity = 1;

SELECT * FROM [Order Details] ORDER BY Quantity;

--11. Find the CustomerID that placed order 10290 (orders table).
SELECT CustomerID
FROM Orders
WHERE OrderID = '10290';

--12. Join the orders table to the customers table.
SELECT * 
FROM Orders
JOIN Customers ON
Orders.CustomerID = Customers.CustomerID;

--13.Get employees’ firstname for all employees who report to no one.
SELECT  FirstName FROM Employees
WHERE ReportsTo IS NULL;

SELECT  * FROM Employees;

--14. Get employees’ firstname for all employees who report to Andrew.
SELECT FirstName FROM Employees
WHERE ReportsTo = 
			(SELECT EmployeeID FROM Employees 
			WHERE FirstName = 'Andrew');

--15.Write an SQL command to create an index on the CustomerID column in the Customers table.
CREATE INDEX index_id
ON Customers (CustomerID);

SELECT * FROM Customers;







