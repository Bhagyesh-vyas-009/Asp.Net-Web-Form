--Consider above table schema and write following queries:

--1. Display unique city of customers who have 'gold' membership.

SELECT DISTINCT(CITY)
FROM [dbo].[Customers]
WHERE  [dbo].[Customers].[Membership] ='gold'

--2. Display top 2 rating with restaurant names.

SELECT TOP 2 [dbo].[Restaurants].[RestaurantName],[dbo].[Restaurants].[Rating]
FROM [dbo].[Restaurants]

--3. Insert new restaurant in restaurant table. (5, 'Burger Junction', 'American', 4.1)

INSERT INTO [dbo].[Restaurants]
([RestaurantID],[RestaurantName],[Cuisine],[Rating])
VALUES(5, 'Burger Junction', 'American', 4.1)

--4. Update customer id to 4 in orders table where amount is 60.

UPDATE [dbo].[Orders] SET
[dbo].[ORDERS].[CustomerID]=4
WHERE [dbo].[Orders].[TotalAmount]=60

--5. Remove the costumer who belongs to Chicago city.

DELETE FROM [dbo].[Customers]
WHERE [dbo].[Customers].[City]='Chicago'

--6. Change column name Total Amount to Amount in Orders table.

SP_RENAME '[dbo].[Orders].[TotalAmount]','Amount','COLUMN'

--7. Delete Menu Items table.

DROP TABLE [dbo].[MenuItems]

--8. Display name and city of those customers whose membership contains 4 letters.

SELECT [dbo].[Customers].[CustomerName],[dbo].[Customers].[City]
FROM [dbo].[Customers]
WHERE [dbo].[Customers].[Membership] LIKE '____'

--9. Display 3rd to 7th character of restaurant name from restaurants table.

SELECT SUBSTRING([RestaurantName],3,4) AS "3RD to 7TH CHAR"  FROM [dbo].[Restaurants]

--10. Write a query to subtract 1 year from current date.

SELECT DATEADD(YEAR,-1,GETDATE()) AS "Current Date before 1 year"

--11. Find max amount of all orders.

SELECT MAX([Amount]) FROM [dbo].[Orders]

--12. Display city with the total number of customers.

SELECT DISTINCT(City),COUNT([CustomerID]) as "total number of customers"
FROM [dbo].[Customers]
GROUP BY City

--13. display restaurant names with average rating greater than 4.5.

SELECT [RestaurantName] FROM [dbo].[Restaurants]
WHERE Rating>4.5

--14. Find the highest-rated restaurant and its details.

SELECT TOP 1 [RestaurantName] FROM [dbo].[Restaurants]
ORDER BY Rating DESC

--15. Subquery to get restaurants that are visited by customers from 'New York'.

SELECT [RestaurantName] FROM [dbo].[Restaurants]
WHERE  [RestaurantID] IN
	(SELECT [CustomerID] FROM [dbo].[Orders] WHERE [CustomerID] IN
	(SELECT [CustomerID] FROM [dbo].[Customers] WHERE [City]='New York'))

--16. Create a View to list customers and their cities.

CREATE VIEW V_CustomersWithCity
as
	SELECT [CustomerName],[City]
	FROM [dbo].[Customers]

SELECT * FROM V_CustomersWithCity

--17. Get all customers and their orders (including customers without order)

SELECT [dbo].[Customers].[CustomerID],[dbo].[Customers].[CustomerName],[dbo].[Orders].[Amount]
FROM [dbo].[Customers]
LEFT JOIN [dbo].[Orders]
ON [dbo].[Orders].[CustomerID]=[dbo].[Customers].[CustomerID]
GROUP BY [dbo].[Customers].[CustomerID],[dbo].[Customers].[CustomerName],[dbo].[Orders].[Amount]

--18. Generate a combination of every customer with every restaurant.

SELECT CONCAT([CustomerName],' ', [RestaurantName]) AS "Customer with Restaurant"
FROM [dbo].[Customers]
INNER JOIN [dbo].[Orders]
ON [dbo].[Customers].[CustomerID]=[dbo].[Orders].[CustomerID]
INNER JOIN [dbo].[Restaurants]
ON [dbo].[Orders].[RestaurantID]=[dbo].[Restaurants].[RestaurantID]

SELECT [CustomerName],[RestaurantName] AS "Customer with Restaurant"
FROM [dbo].[Customers]
CROSS JOIN [dbo].[Restaurants]

--19. List all restaurants and the corresponding orders.

SELECT [dbo].[Restaurants].[RestaurantID],[dbo].[Restaurants].[RestaurantName],[dbo].[Orders].[OrderDate],[dbo].[Orders].[Amount]
FROM [dbo].[Restaurants]
INNER JOIN [dbo].[Orders]
ON [dbo].[Orders].[RestaurantID]=[dbo].[Restaurants].[RestaurantID]
INNER JOIN [dbo].[Customers]
ON [dbo].[Customers].[CustomerID]=[dbo].[Orders].[CustomerID]
GROUP BY [dbo].[Restaurants].[RestaurantID],[dbo].[Restaurants].[RestaurantName],[dbo].[Orders].[OrderDate],[dbo].[Orders].[Amount]

--20. Get the total amount spent by each customer at each restaurant, along with the customer and
--restaurant names. Include customers who have not ordered from certain restaurants, showing
--NULL for those cases.

SELECT [dbo].[Customers].[CustomerName],[dbo].[Restaurants].[RestaurantName],SUM([dbo].[Orders].[Amount]) As "Total Amount Spent"
FROM [dbo].[Customers]
LEFT JOIN [dbo].[Orders]
ON [dbo].[Orders].[CustomerID]=[dbo].[Customers].[CustomerID]
LEFT JOIN [dbo].[Restaurants]
ON [dbo].[Restaurants].[RestaurantID]=[dbo].[Orders].[RestaurantID]
GROUP BY [dbo].[Customers].[CustomerName],[dbo].[Restaurants].[RestaurantName]

SELECT [dbo].[Customers].[CustomerName],[dbo].[Restaurants].[RestaurantName],SUM([dbo].[Orders].[Amount]) As "Total Amount Spent"
FROM [dbo].[Customers]
CROSS JOIN [dbo].[Restaurants]
LEFT JOIN [dbo].[Orders]
ON [dbo].[Restaurants].[RestaurantID]=[dbo].[Orders].[RestaurantID]
AND [dbo].[Orders].[CustomerID]=[dbo].[Customers].[CustomerID]
GROUP BY [dbo].[Customers].[CustomerName],[dbo].[Restaurants].[RestaurantName]
