CREATE TABLE Customers (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    SubscriptionLevel NVARCHAR(50),
    SubscriptionStartDate DATE,
    SubscriptionEndDate DATE,
    State VARCHAR(100)
);
INSERT INTO Customers (FullName, Email, SubscriptionLevel, SubscriptionStartDate, SubscriptionEndDate, State) VALUES
('Aisha Khan', 'aisha.khan@yahoo.com', 'Premium', '2024-01-01', '2024-12-31', 'NY'),
('Carlos Ramirez', 'carlos.ramirez@yahoo.com', 'Standard', '2024-01-10', '2024-12-31', 'CA'),
('Liam Brown', 'liam.brown@gmail.com', 'Premium', '2024-03-01', NULL, 'WA'),
('Sophia Chen', 'sophia.chen@umich.edu', 'Standard', '2024-02-15', NULL, 'WA'),
('Chad Murphy', 'chad.murphy@gmail.com', 'Premium', '2024-04-01', NULL, 'IL'),
('Siobhan Byrne', 'siobhan.byrne@gmail.com', 'Standard', '2024-04-01', NULL, 'MA'),
('Ashley Zahra', 'ashley.zahra@gmail.com', 'Premium', '2024-05-01', '2024-12-31', 'AZ'),
('Chris Miller', 'chris.miller@yahoo.com', 'Standard', '2024-06-01', NULL, 'WA'),
('Ravi Singh', 'ravi.singh@gmail.com', 'Premium', '2024-05-01', NULL, 'NY'),
('Emma Johnson', 'emma.johnson@gmail.com', 'Standard', '2024-06-01', NULL, 'IL'),
('Hiroshi Nakamura', 'hiroshi.nakamura@gmail.com', 'Premium', '2024-07-01', NULL, 'WA'),
('Isabella Rossi', 'isabella.rossi@gmail.com', 'Standard', '2024-01-01', '2024-05-01', 'CA'),
('Sean Connor', 'sean.connor@gmail.com', 'Premium', '2024-01-01', '2024-12-31', 'WA'),
('Brittney Kelly', 'brittney.kelly@gmail.com', 'Standard', '2024-01-15', NULL, 'IL'),
('Patrick Murphy', 'patrick.murphy@gmail.com', 'Premium', '2024-02-01', NULL, 'AZ'),
('Fiona Walsh', 'fiona.walsh@gmail.com', 'Standard', '2024-03-01', NULL, 'MA'),
('Anna Schmidt', 'anna.schmidt@gmail.com', 'Premium', '2024-04-01', '2024-12-31', 'IL'),
('Max Weber', 'max.weber@gmail.com', 'Standard', '2024-05-01', NULL, 'WA'),
('Greta Fischer', 'greta.fischer@gmail.com', 'Premium', '2024-06-01', '2025-05-31', 'WA'),
('Ahmed Al-Farsi', 'ahmed.alfarsi@gmail.com', 'Premium', '2024-07-01', '2024-12-31', 'AZ'),
('Maya Patel', 'maya.patel@gmail.com', 'Standard', '2024-01-20', NULL, 'CA'),
('Jacob Lee', 'jacob.lee@gmail.com', 'Premium', '2024-02-01', '2024-12-31', 'NY'),
('Olivia Nguyen', 'olivia.nguyen@msu.edu', 'Standard', '2024-03-01', NULL, 'WA'),
('James Davis', 'james.davis@yahoo.com', 'Premium', '2024-03-15', NULL, 'TX'),
('Emma Collins', 'emma.collins@gmail.com', 'Standard', '2024-04-01', NULL, 'CA'),
('Benjamin Clark', 'benjamin.clark@gmail.com', 'Premium', '2024-04-10', '2024-12-31', 'WA'),
('Sophia Gonzalez', 'sophia.gonzalez@gmail.com', 'Standard', '2024-05-01', NULL, 'NY'),
('Ethan Moore', 'ethan.moore@wmu.edu', 'Premium', '2024-05-15', NULL, 'IL'),
('Isabella Kim', 'isabella.kim@gmail.com', 'Standard', '2024-06-01', NULL, 'TX'),
('Lucas Brown', 'lucas.brown@gmail.com', 'Premium', '2024-06-15', NULL, 'NY'),
('Zoe Martinez', 'zoe.martinez@gmail.com', 'Standard', '2024-07-01', NULL, 'AZ'),
('Oliver White', 'oliver.white@gmail.com', 'Premium', '2024-07-15', NULL, 'WA'),
('Lily Adams', 'lily.adams@gmail.com', 'Standard', '2024-08-01', NULL, 'NY'),
('Mason Turner', 'mason.turner@yahoo.com', 'Premium', '2024-08-15', NULL, 'IL'),
('Ava Robinson', 'ava.robinson@gmail.com', 'Standard', '2024-09-01', '2025-09-01', 'TX'),
('Jackson Lewis', 'jackson.lewis@yahoo.com', 'Premium', '2024-09-15', '2024-12-31', 'NY'),
('Mia Johnson', 'mia.johnson@gmail.com', 'Standard', '2024-10-01', NULL, 'WA'),
('Henry Walker', 'henry.walker@gmail.com', 'Premium', '2024-10-15', NULL, 'AZ'),
('Charlotte Hall', 'charlotte.hall@gmail.com', 'Standard', '2024-11-01', NULL, 'NY'),
('Daniel Young', 'daniel.young@yahoo.com', 'Premium', '2024-11-15', NULL, 'IL');

--1. Select all the records from the Customers table.
SELECT * FROM Customers

--2. Find all customers who have a Premium subscription.
SELECT * FROM Customers
WHERE SubscriptionLevel = 'Premium';

--3. Get distinct States from the Customers table. Sort alphabetically. 
--(Hint: research the DISTINCT keyword. Notice the difference with and without DISTINCT.)
SELECT DISTINCT State 
FROM Customers
ORDER BY State;

--4. Count the number of customers from the State of NY.
SELECT Count(*) FROM Customers
WHERE State = 'NY';

--5. List the customer name and email data for customers with no subscription end date.
SELECT FullName, email FROM Customers
WHERE SubscriptionEndDate IS null;

--6. Create an index on the State column.
CREATE INDEX idx
ON customers(state);

--7. Insert a new customer into the Customers table.
INSERT INTO Customers (FullName, Email, SubscriptionLevel, SubscriptionStartDate, SubscriptionEndDate, State) VALUES
('Maliha', 'maliha@yahoo.com', 'Premium', '2024-01-01', '2024-12-31', 'MI');

--8.Update Emma Collins to a Premium subscription.
UPDATE Customers
SET SubscriptionLevel = 'Primium'
WHERE FullName = 'Emma Collins';

--Check
SELECT * FROM Customers
WHERE FullName = 'Emma Collins';

--9. Count the number of accounts who have an .edu email address. (Hint: research the LIKE operator.)
SELECT  Count(*)
FROM  customers
WHERE  email  LIKE  '%.edu';

--10. Delete all customers whose subscription has expired (assume the date today is August 1, 2024). 
DELETE FROM Customers
WHERE SubscriptionEndDate <= '2024-08-01';

--11. Select all premium customers in New York, listing their name and email address. Sort by name in ascending order.
SELECT FullName, Email FROM Customers
WHERE SubscriptionLevel = 'premium'
ORDER BY FullName;

--12. Create a new table called Meals, with the following columns: 
--MealID - INT IDENTITY(1,1) PRIMARY KEY
--MealName - NVARCHAR(255) NOT NULL
--Calories - INT
--Price - MONEY
--IsVegetarian - BIT (NOTE: BIT represents a boolean value 1 (true) or 0 (false).)
--SubscriptionLevel - NVARCHAR(50)

CREATE TABLE Meals (
    MealID INT IDENTITY(1,1) PRIMARY KEY,
    MealName NVARCHAR(255) NOT NULL,
    Calories  INT,
	Price MONEY,
	IsVegetarian  BIT, --(NOTE: BIT represents a boolean value 1 (true) or 0 (false).)
	SubscriptionLevel  NVARCHAR(50)
);

--13. Insert 3 Meals into the Meals table.
INSERT INTO Meals (MealName, Calories, Price, IsVegetarian, SubscriptionLevel) 
VALUES ('Pasta Salad', 400, 11.00, 0, 'Premium'),
('Rice', 200, 5.99, 1, 'Standard'),
('Greek yogurt', 100, 1.99, 1, 'Standard');

--14. Insert these Meals as well.
INSERT INTO Meals (MealName, Calories, Price, IsVegetarian, SubscriptionLevel) 
VALUES ('Truffle Risotto', 700, 25.00, 0, 'Premium'), 
('Lobster Mac & Cheese', 900, 28.00, 0, 'Premium'), 
('Vegetable Quiche', 500, 11.00, 1, 'Standard'), 
('Roasted Duck Breast', 700, 22.50, 0, 'Premium'), 
('Mushroom Stroganoff', 500, 12.00, 1, 'Standard'), 
('Filet Mignon', 700, 30.00, 0, 'Premium'), 
('Greek Salad', 500, 9.00, 1, 'Standard'), 
('Wild Mushroom Soup', 500, 14.00, 1, 'Premium'), 
('Chicken Parmesan', 700, 13.50, 0, 'Standard'), 
('Seafood Paella', 900, 26.00, 0, 'Premium');

--15. List the meal names of the first 5 Meals that are vegetarian. (Hint: In MS SQL, use 1 for True and 0 for False.)
SELECT TOP 5 MealName
FROM Meals
WHERE IsVegetarian = 1;

--16. Get all Meals sorted by Calories in descending order and then by Price in ascending order.
SELECT * FROM Meals
ORDER BY Calories desc;

SELECT * FROM Meals
ORDER BY Price;

--17. Update the Price of all Meals with SubscriptionLevel 'Premium' to increase by 5.00.
UPDATE Meals
SET Price = Price + 5
WHERE SubscriptionLevel = 'Premium';

--CHECK
SELECT * FROM Meals
WHERE SubscriptionLevel = 'Premium';

--18. Calculate the average, max, and min of the Price in the Meals table.
SELECT AVG(Price) AS Average, MAX(Price) AS Max_Price, MIN(price) AS Min_Price
FROM Meals;

--19.Get all Meals that have a Price between 10.00 and 20.00. (Hint: research the BETWEEN keyword.)
SELECT * FROM Meals
WHERE Price BETWEEN 10.00 AND 20.00;

--20. BONUS: Add a new INT column named star_rating to Meals, initialized to NULL. (Hint: Use an ALTER TABLE Statement.)
ALTER TABLE Meals 
ADD star_rating int Default null;

--21. Drop the Meals table.
DROP TABLE Meals;