CREATE TABLE Product (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Ingredients VARCHAR(5000),
    Size VARCHAR(255),
    Weight DECIMAL(10,2),
    Colors VARCHAR(500),
    Category VARCHAR(100),
    Supplier VARCHAR(100),
    Discontinued VARCHAR(3),
    Description VARCHAR(255)
);

INSERT INTO Product (ProductName, UnitPrice, Ingredients, Size, Weight, Colors, Category, Supplier, Discontinued, Description)
VALUES
('Organic Sugar Tea', 120, 'sugar, tea leaves', 'Medium', 300, 'Red, Blue', 'Beverages', 'Supplier1', 'No', 'organic black tea'),

('Spicy Snack Mix', 80, 'salt, pepper, corn', 'Small', 450, 'Yellow, Green', 'Snacks', 'Supplier2', 'Yes', 'spicy handmade mix'),

('Premium Coffee', 200, 'coffee, sugar', 'Medium', 500, 'Brown, Black', 'Beverages', 'Supplier1', 'No', 'premium organic arabica'),

('Gluten-Free Bread', 60, 'rice flour, yeast', 'Small,Medium,Large', 800, 'White', 'Bakery', 'Supplier1,Supplier3', 'No', 'handmade gluten-free bread'),

('Salt & Pepper Chips', 45, 'salt, pepper, potato', 'Large', 250, 'Red, Blue', 'Snacks', 'Supplier2', 'No', 'crispy salted potato chips'),

('Herbal Green Tea', 150, 'green tea, mint', 'Small', 200, 'Green', 'Beverages', 'Supplier1', 'Yes', 'organic herbal tea'),

('Luxury Chocolate', 500, 'cocoa, sugar, milk', 'Small', 100, 'Brown, Gold', 'Confection', 'Supplier2', 'No', 'premium handmade chocolate'),

('Mango Juice', 55, 'mango, sugar', 'Medium', 350, 'Yellow', 'Beverages', 'Supplier3', 'No', 'organic mango juice'),

('Eco-Friendly Mug', 180, 'ceramic', 'Large', 700, 'White, Green', 'Utensils', 'Supplier1,Supplier2', 'No', 'handmade eco-friendly ceramic mug'),

('Red Velvet Cake', 250, 'flour, sugar, cocoa', 'Mdedium, Large', 1200, 'Red', 'Bakery', 'Supplier2', 'Yes', 'premium red velvet cake');

--1. Select all products with a unit price greater than 100 and discontinued products.

SELECT ProductName FROM Product WHERE UnitPrice>100 AND Discontinued='YES'

--2. Find products with 'sugar' as an ingredient or weight less than 500g.

SELECT ProductName,Weight FROM Product WHERE Ingredients LIKE '%sugar%' OR Weight<500

--3. Retrieve products with size 'Medium' and in the category 'Beverages'.

SELECT ProductName,Weight,Category FROM Product WHERE Size LIKE '%Medium%' AND Category='Beverages'

--4. Select all products from 'Supplier1' but not discontinued.

SELECT ProductName,Weight,Category FROM Product WHERE Supplier LIKE '%Supplier1%' AND Discontinued='NO'

--5. Find products with multiple colors including 'Red' and 'Blue'.

SELECT ProductName,Weight,Colors FROM Product WHERE Colors LIKE '%Red%' AND Colors LIKE '%Blue%'

--6. Select products where the description contains 'organic' and the unit price is between 50 and 150.

SELECT ProductName,Weight,Category,Description FROM Product WHERE Description LIKE '%organic%' AND UnitPrice between 50 and 150

--7. Retrieve products where the size is either 'Small' or 'Large' and weight is not null.

SELECT ProductName,Weight,Size,Category,Description 
FROM Product 
WHERE Size LIKE '%Small%' OR Size LIKE '%Large%' AND Weight is not null

--8. Select products with a specific ID range and supplier 'Supplier2'.

Declare @minProductID int=1
Declare @maxProductID int=5
SELECT ProductName,Weight,Category,Description 
FROM Product 
WHERE Supplier LIKE '%Supplier2%' AND ProductID between @minProductID and @maxProductID

--9. Find products with discontinued status 'No' and ingredients excluding 'gluten'.

SELECT ProductName,Weight,Ingredients,Category,Description 
FROM Product 
WHERE Ingredients NOT LIKE '%gluten%' AND Discontinued='No'

--10. Retrieve top 10 most expensive products.

SELECT TOP 10 ProductName,UnitPrice,Category,Description 
FROM Product 
ORDER BY UnitPrice DESC

--11. Select products grouped by category and count the number of products in each category.

SELECT Category,COUNT(PRODUCTNAME) AS "Count by Category" FROM PRODUCT
GROUP BY Category

--12. Find products with size 'Large' and either 'Supplier1' or 'Supplier3'.

SELECT ProductName,Weight,Category,Description 
FROM Product
WHERE Size LIKE '%Large%' AND Supplier LIKE '%Supplier1%' OR Supplier LIKE '%Supplier2%' 

--13. Select products where weight is either less than 250g or greater than 1000g.

SELECT ProductName,Weight
FROM Product
WHERE Weight<250 OR Weight>1000

--14. Retrieve products with colors containing 'Green' but not discontinued.

SELECT ProductName,Weight,Colors 
FROM Product 
WHERE Colors LIKE '%Green%' AND Discontinued='No'

--15. Select products where the description has both 'handmade' and 'eco-friendly'.

SELECT ProductName,Weight,Category,Description 
FROM Product 
WHERE Description LIKE '%handmade%eco-friendly%'

--16. Find products with a unit price less than 20 and weight more than 300g.

SELECT ProductName,UnitPrice,Weight,Category,Description 
FROM Product 
WHERE UnitPrice <20 AND Weight>300  

--17. Select products with unit price not between 50 and 150.

SELECT ProductName,UnitPrice,Weight,Category,Description 
FROM Product 
WHERE UnitPrice not between 50 and 150

--18. Select products with ingredients containing both 'salt' and 'pepper'.

SELECT ProductName,Weight,Category,Description,Ingredients 
FROM Product 
WHERE Ingredients LIKE '%salt%pepper%' 

--19. Find products with unit price in top 5% and supplier 'Supplier2'.

SELECT top 5 PERCENT ProductName,Weight,Category,Description 
FROM Product 
WHERE Supplier LIKE '%Supplier2%' 
ORDER BY UnitPrice DESC

--20. Retrieve products with weight more than 500g and not 'Supplier3' & arrange it with Product
--Name in descending order

SELECT ProductName,Weight,Category,Description
FROM Product 
WHERE Weight>500 AND Supplier LIKE '%Supplier3%' 
ORDER BY ProductName

--21. Select products supplied by multiple suppliers and not discontinued.

SELECT ProductName
FROM Product 
WHERE Discontinued='NO'
GROUP BY ProductName
HAVING 

--22. Select products with unique ingredients across the database.



--23. Retrieve products where the size is 'Large' and ingredient list is extensive.



--24. Select products by suppliers with an average unit price below a threshold 50.




--25. Retrieve products grouped by category with the highest average unit price per supplier.



--26. Select products where the unit price and weight both exceed average values.



--27. Find products with multiple sizes and unique colors.



--28. Creates a ProductBackUp table of the entire Product table. 

Select * into ProductBackUp from Product

--29. Copies ProductID, ProductName, and Description into a new table called ProductDetails. 

Select ProductID, ProductName, Description into ProductDetails from Product

--30. Creates a new table with PRD_Product having Unit Price Less than 5000. 

Select * into PRD_Product from Product
where UnitPrice < 5000

--31. Creates a table ActiveProducts with non-discontinued products. 

Select * into ActiveProducts from Product
where Discontinued = 'No'

--32. Creates a table with products of size 'Large'. 

Select * into LargeSizedProducts from Product
where Size like '%Large%'

--33. Creates a table with products whose description contains 'organic'. 

Select * into OrganicProducts from Product
where Description like '%organic%'

--34. Copies products with colors containing 'Red' into a new table. 

Select * into RedColouredProducts from Product
where Colors like '%Red%'

--35. Copies specific columns of products in the 'Beverages' and 'Snacks' categories into a new table. 

Select ProductID, ProductName, Category into BeveragesAndSnacks from Product
where Category in ('Beverages','Snacks')

--36. Find categories with an average unit price greater than 50 and order by average unit price.

Select Category, AVG(UnitPrice) as 'AvgUnitPrice' from Product
group by Category
having AVG(UnitPrice) > 50
order by AVG(UnitPrice)

--37. Retrieves categories with an average unit price greater than 50, ordered by the average price descending. 

Select Category, AVG(UnitPrice) as 'AvgUnitPrice' from Product
group by Category
having AVG(UnitPrice) > 50
order by AVG(UnitPrice) DESC

--38. Finds suppliers with total product weight over 1000, ordered by total weight descending. 


--39. Identifies categories with maximum unit price greater than 150, ordered by maximum price descending. 

Select Category, max(UnitPrice) as 'MaxUnitPrice' from Product
group by Category
having max(UnitPrice) > 150
order by max(UnitPrice) DESC

--40. Lists suppliers with more than 10 products, ordered by product count descending. 


--41. Retrieves categories with an average product weight greater than 200, ordered by average weight descending.

Select Category, AVG(Weight) as 'AvgWeight' from Product
group by Category
having AVG(Weight) > 200
order by AVG(Weight) DESC

--42. Finds suppliers with total unit price over 500, ordered by total price descending. 


--43. Identifies categories with minimum unit price less than 20, ordered by minimum price ascending. 

Select Category, min(UnitPrice) as 'AvgUnitPrice' from Product
group by Category
having min(UnitPrice) < 20
order by min(UnitPrice)

--44. Lists categories with more than 5 products, ordered by product count descending. 

Select Category, COUNT(ProductID) as 'CountOfProducts' from Product
Group by Category
having COUNT(ProductID) > 5
order by COUNT(ProductID) DESC

--45. Finds categories with total weight over 1000, ordered by total weight descending. 

Select Category, sum(Weight) as 'TotalWeight' from Product
group by Category
having sum(Weight) > 1000
order by sum(Weight) DESC

--46. Lists categories with more than 20 products, ordered by total products descending.

Select Category, COUNT(ProductID) as 'CountOfProducts' from Product
Group by Category
having COUNT(ProductID) > 20
order by COUNT(ProductID) DESC

--47. Finds suppliers with total weight over 500, ordered by total weight descending. 


--48. Calculates the total revenue for each product by multiplying the unit price by the quantity. 

Select ProductName, (UnitPrice * Quantity) as 'Total Revenue' from Product

--49. Calculates the discounted price for each product with a 10% discount. 

Select ProductName, UnitPrice, 0.9*UnitPrice as 'Discounted Price'  from Product

--50. Calculates the weight difference from the average weight for each product. 

Select ProductName, Weight, ABS(Weight - (Select AVG(Weight) from Product)) as 'DifferenceFromAvgWeight' from Product

--51. Counts the total number of products in each category. 

Select Category, COUNT(ProductID) as 'CountOfProducts' from Product
Group by Category

--52. Calculates the total revenue for each category by summing the product of unit price and quantity. 



--53. Calculates the price increase by 5% for each product. 

Select ProductName, UnitPrice, 1.05*UnitPrice as 'IncreasedPrice' from Product

--54. Finds the maximum, minimum, and average unit price for each supplier. 


--55. Calculates total number of products and average unit price for each category.

Select Category, COUNT(ProductID) as 'CountOfProducts', AVG(UnitPrice) as 'AvgUnitPrice' from Product
Group by Category