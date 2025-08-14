--TestPaper D


INSERT INTO Authors (name, birth_year, nationality) VALUES
('Chetan Bhagat', 1974, 'Indian'),
('Arundhati Roy', 1961, 'Indian'),
('Ruskin Bond', 1934, 'Indian'),
('Jhumpa Lahiri', 1967, 'Indian'),
('Amish Tripathi', 1974, 'Indian'),
('R.K. Narayan', 1906, 'Indian'),
('Anita Desai', 1937, 'Indian'),
('Kiran Desai', 1971, 'Indian'),
('Vikram Seth', 1952, 'Indian'),
('Sudha Murty', 1950, 'Indian');


INSERT INTO Books (title, author_id, genre, publish_year, available_copies) VALUES
('Five Point Someone', 1, 'Fiction', 2004, 5),
('The God of Small Things', 2, 'Fiction', 1997, 3),
('The Blue Umbrella', 3, 'Children', 1974, 4),
('Interpreter of Maladies', 4, 'Short Stories', 1999, 2),
('The Immortals of Meluha', 5, 'Mythology', 2010, 6),
('Malgudi Days', 6, 'Fiction', 1943, 3),
('Clear Light of Day', 7, 'Literary Fiction', 1980, 2),
('The Inheritance of Loss', 8, 'Fiction', 2006, 4),
('A Suitable Boy', 9, 'Fiction', 1993, 1),
('Wise and Otherwise', 10, 'Non-fiction', 2002, 5);

INSERT INTO Members VALUES
('Rahul Sharma', 'rahul.sharma@example.com', '9876543210', '2021-05-15'),
('Priya Mehta', 'priya.mehta@example.com', '9898989898', '2020-08-22'),
('Amit Verma', 'amit.verma@example.com', '9123456789', '2022-01-10'),
('Sneha Reddy', 'sneha.reddy@example.com', '9000000001', '2023-03-12'),
('Rohan Kapoor', 'rohan.kapoor@example.com', '9988776655', '2022-07-25'),
('Neha Singh', 'neha.singh@example.com', '9112233445', '2021-11-18'),
('Karan Malhotra', 'karan.malhotra@example.com', '9090909090', '2019-09-09'),
('Isha Agarwal', 'isha.agarwal@example.com', '9221122112', '2023-01-01'),
('Vikram Joshi', 'vikram.joshi@example.com', '9345678901',null),
('Anjali Nair', 'anjali.nair@example.com', '9445566778',null);

INSERT INTO Loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2025-08-01', '2025-08-15'),
(1, 2, '2025-08-03', '2025-08-17'),
(2, 3, '2025-08-05', '2025-08-19'),
(2, 4, '2025-08-06', '2025-08-20'),
(4, 5, '2025-08-07', '2025-08-21'),
(6, 6, '2025-08-08', '2025-08-22'),
(5, 7, '2025-08-09', '2025-08-23'),
(5, 8, '2025-08-10', '2025-08-24'),
(9, 9, '2025-08-11', '2025-08-25'),
(10, 10, '2025-08-12', '2025-08-26');


--1. Display the top 3 percentages books order by title in descending.

SELECT TOP 3 PERCENT [dbo].[Books].[Title]
FROM [dbo].[Books]
ORDER BY [dbo].[Books].[Title] DESC 

--2. Display a distinct list of genres.

SELECT DISTINCT(Genre) FROM Books

--3. Insert a new book into the books table. ('The Adventures of Sherlock Holmes', 2, 'Mystery', 1892,5)

INSERT INTO [dbo].[Books]
(title, author_id, genre, publish_year, available_copies)
VALUES('The Adventures of Sherlock Holmes', 2, 'Mystery', 1892,5)

--4. Update the number of available copies is 10 for a book whose book_id is available.

UPDATE [dbo].[Books] SET
Available_copies=10 
WHERE Book_id IS NOT NULL

--5. Delete a member from the members table whose member_id is 4.

DELETE FROM [dbo].[Members]
WHERE Member_id=4

--6. Add a new column language varchar(20) to the books table.

ALTER TABLE [dbo].[Books] ADD  language varchar(20)

--7. Truncate all data from the loans table. (Using Truncate)

TRUNCATE TABLE [dbo].[Loans]

--8. Find books whose title starts with ‘H’ and end with ‘L’.

SELECT [dbo].[Books].[Title]
FROM [dbo].[Books]
WHERE [dbo].[Books].[Title] LIKE 'H%L'

--9. Find authors whose name does not ends with vowel.

SELECT [dbo].[Authors].[Name]
FROM [dbo].[Authors]
WHERE [dbo].[Authors].[NAME] NOT LIKE '%[aeiouAEIOU]'

--10. Find Lenth of ‘Manish Pandey’

SELECT LEN('Manish Pandey')

--11. Calculate your age in year.

SELECT DATEDIFF(YEAR,'2005-01-09',GETDATE()) AS "Age"

--12. Display the total number of books by genre.

SELECT [dbo].[Books].[Genre],COUNT([dbo].[Books].[Title]) AS "total number of books by genre"
FROM [dbo].[Books]
GROUP BY [dbo].[Books].[Genre]

--13. Display the minimum, maximum, and average number of available copies for each genre whose
--book_id is available.

SELECT [dbo].[Books].[Genre],MIN([dbo].[Books].[Available_copies]) AS "Minimum Copies",MAX([dbo].[Books].[Available_copies]) AS "Maximum Copies",AVG([dbo].[Books].[Available_copies]) AS "Average Copies"
FROM [dbo].[Books]
WHERE [dbo].[Books].[Book_id] IS NOT NULL
GROUP BY [dbo].[Books].[Genre]


--14. Display the title of books where the author was born before 1970.(Using Sub query)

SELECT [dbo].[Books].[Title]
FROM [dbo].[Books]
WHERE [dbo].[Books].[Author_id] IN
(SELECT Author_id FROM [dbo].[Authors] 
WHERE [dbo].[Authors].[Birth_year]<1970)

--15. Create a view View_Member whose membership date is not available from members table

CREATE VIEW V_Members_DateNotAvailable
as
	SELECT * FROM [dbo].[Members]
	WHERE [dbo].[Members].[Membership_date] IS NULL

SELECT * FROM V_Members_DateNotAvailable

--16. Find the title of books that have been borrowed the most (the top 1 book) and the corresponding
--author name (Using sub Query)

SELECT b.title, a.name AS "Author Name"
FROM [dbo].[Books] b
JOIN [dbo].[Authors] a ON b.[Author_id] = a.[Author_id]
WHERE b.[Book_id] = (
    SELECT TOP 1 [Book_id]
    FROM [dbo].[Loans]
    GROUP BY book_id
    ORDER BY COUNT(*) DESC
);



--17. Display the loan_id ,member name ,title ,loan date whose member name is 'Raj'.

SELECT [dbo].[Loans].[Loan_id],[dbo].[Members].[Name],[dbo].[Books].[Title],[dbo].[Loans].[Loan_date]
FROM [dbo].[Loans]
INNER JOIN [dbo].[Books]
ON [dbo].[Loans].[Book_id]=[dbo].[Books].[Book_id]
INNER JOIN [dbo].[Members]
ON [dbo].[Loans].[Member_id]=[dbo].[Members].[Member_id]
WHERE [dbo].[Members].[Name] ='Raj' or [dbo].[Members].[Name] LIKE 'Raj%' 

--18. List the titles of books that have been borrowed by members who registered before 2020.(using
--Sub query)

SELECT [dbo].[Books].[Title]
FROM [dbo].[Books]
WHERE [dbo].[Books].[Book_id] IN
(SELECT Book_id FROM [dbo].[Loans] 
WHERE Member_id IN
	(SELECT Member_id FROM [dbo].[Members]
	WHERE YEAR(Membership_date)<2020))

--19. Display the total number of books borrowed by each member.

SELECT [dbo].[Members].[Name],COUNT([dbo].[Loans].[Book_id]) AS "Count of Borrowed Books"
FROM [dbo].[Members]
INNER JOIN [dbo].[Loans]
ON [dbo].[Members].[Member_id]=[dbo].[Loans].[Member_id]
GROUP BY [dbo].[Members].[Name]

--20. Display the title of books that have not been borrowed by any members.

SELECT [dbo].[Books].[Title]
FROM [dbo].[Books]
LEFT JOIN [dbo].[Loans]
ON [dbo].[Books].[Book_id]=[dbo].[Loans].[Book_id]
WHERE [dbo].[Loans].[Book_id] IS NULL