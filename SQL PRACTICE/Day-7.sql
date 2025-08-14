--SET Operators – Part - 1

--Create below two tables with RollNo as Int & Name as varchar (50) & insert records as given below.

CREATE TABLE Computer
(
	RollNo int,
	Name varchar(50)
)

CREATE TABLE Electrical
(
	RollNo int,
	Name varchar(50)
)

insert into [dbo].[Computer]
	(
		[RollNo],
		[Name]
	)
	values
	(101,'Ajay'), 
	(109 ,'Haresh'),
	(115 ,'Manish')


insert into [dbo].[Electrical]
	(
		[RollNo],
		[Name]
	)
	values
	(105,'Ajay'), 
	(107 ,'Mahesh'),
	(115 ,'Manish')

--1. Display name of students who is either in Computer or in Electrical.

SELECT NAME FROM [dbo].[Computer] UNION SELECT NAME FROM [dbo].[Electrical]

--2. Display name of students who is either in Computer or in Electrical including duplicate data.

SELECT NAME FROM [dbo].[Computer] UNION ALL SELECT NAME FROM [dbo].[Electrical]

--3. Display name of students who is in both Computer and Electrical.

SELECT NAME FROM [dbo].[Computer] INTERSECT SELECT NAME FROM [dbo].[Electrical]

--4. Display name of students who are in Computer but not in Electrical.

SELECT NAME FROM [dbo].[Computer] EXCEPT SELECT NAME FROM [dbo].[Electrical]

--5. Display name of students who are in Electrical but not in Computer.

SELECT NAME FROM [dbo].[Electrical]  EXCEPT SELECT NAME FROM [dbo].[Computer]

--6. Display all the details of students who is either in Computer or in Electrical.

SELECT [RollNo],[Name] FROM [dbo].[Computer] 
UNION ALL 
SELECT [RollNo],[Name] FROM [dbo].[Electrical] 
EXCEPT 
SELECT [RollNo],[Name] FROM [dbo].[Computer] 
INTERSECT  
SELECT [RollNo],[Name] FROM [dbo].[Electrical]

--7. Display all the details of students who is in both Computer and Electrical.

SELECT [RollNo],[Name] FROM [dbo].[Computer]
INTERSECT
SELECT [RollNo],[Name] FROM [dbo].[Electrical] 

--Sub Queries – Part - 1

--Create table as per following data.

CREATE TABLE Student 
(
	RNo int, 
	Name varchar (50), 
	City varchar (50), 
	DID int
)

CREATE TABLE Academic
(
	RNo int,
	SPI Decimal (4,2), 
	Bklog int
)

CREATE TABLE Department
(
	DID int, 
	DName varchar (50)
)


INSERT INTO [dbo].[Department]
	(
		[DID],
		[DName]
	)VALUES
	(10, 'Computer'),
	(20, 'Electrical'),
	(30, 'Mechanical'),
	(40, 'Civil')


INSERT INTO [dbo].[Student]
	(
		Rno, Name, City, DID
	)VALUES
	(101, 'Raju', 'Rajkot', 10),
	(102, 'Amit', 'Ahmedabad', 20),
	(103, 'Sanjay', 'Baroda', 40),
	(104, 'Neha' ,'Rajkot', 20),
	(105, 'Meera','Ahmedabad' ,30),
	(106, 'Mahesh', 'Baroda',10)

INSERT INTO [dbo].[Academic]
	(Rno, SPI, Bklog)
	VALUES
	(101 ,8.8 ,0),
	(102 ,9.2 ,2),
	(103 ,7.6 ,1),
	(104 ,8.2 ,4),
	(105 ,7.0 ,2),
	(106 ,8.9 ,3)

--1. Display details of students who are from computer department.

SELECT	[dbo].[Student].[RNo],
		[dbo].[Student].[Name],
		[dbo].[Student].[City],
		[dbo].[Student].[DID]
FROM [dbo].[Student] WHERE [dbo].[Student].[DID] in 
	( SELECT [dbo].[Department].[DID]
	FROM [dbo].[Department]
	WHERE [dbo].[Department].[DName]='Computer')

--2. Display name of students whose SPI is more than 8.

SELECT [dbo].[Student].[Name] 
FROM [dbo].[Student]
WHERE [dbo].[Student].[RNo] IN
(SELECT RNO FROM [dbo].[Academic]
WHERE [dbo].[Academic].[SPI]>8)

--3. Display details of students of computer department who belongs to Rajkot city.

SELECT	[dbo].[Student].[RNo],
		[dbo].[Student].[Name],
		[dbo].[Student].[City],
		[dbo].[Student].[DID]
FROM [dbo].[Student]
WHERE [dbo].[Student].[DID] IN
(SELECT DID FROM [dbo].[Department]
WHERE [dbo].[Department].[DName]='Computer')
AND [dbo].[Student].[City]='Rajkot'

--4. Find total number of students of electrical department.

SELECT COUNT([dbo].[Student].[RNo]) AS "total number of students"
FROM [dbo].[Student] WHERE [dbo].[Student].[DID] IN
(SELECT [DID] FROM [dbo].[Department]
WHERE [dbo].[Department].[DName]='Electrical')

--5. Display name of student who is having maximum SPI.

SELECT NAME FROM [dbo].[Student]
WHERE RNO =(SELECT RNO FROM [dbo].[Academic]
			WHERE SPI=(SELECT max(SPI) FROM [dbo].[Academic]))

--6. Display details of students having more than 1 backlog.

SELECT RNO,NAME,DID FROM [dbo].[Student]
WHERE RNO IN(SELECT RNO FROM [Academic] WHERE Bklog>1)

--7. Display name of student who is having second highest SPI.

SELECT NAME FROM [dbo].[Student]
WHERE RNO =(SELECT RNO FROM [dbo].[Academic]
			WHERE SPI=(SELECT max(SPI) FROM [dbo].[Academic]
			WHERE SPI<(SELECT MAX(SPI) FROM [Academic]))) 

--8. Display name of students who are either from computer department or from mechanical
--department.

SELECT NAME FROM [dbo].[Student]
WHERE DID IN(SELECT DID FROM [dbo].[Department]
			WHERE DName='Computer' or DName='Mechanical')


--9. Display name of students who are in same department as 102 studying in.

SELECT NAME FROM Student 
WHERE DID IN (SELECT DID FROM Department WHERE DID=(SELECT DID FROM Student WHERE RNO=102))

--10. Display name of students whose SPI is more than 9 and who is from electrical department. 

SELECT NAME FROM Student
WHERE RNO IN(SELECT RNO FROM Academic WHERE SPI>9)
AND DID=(SELECT DID FROM Department WHERE DNAME='Electrical')


--Select * Into
--Create table Cricket with Name varchar (50), City varchar (50) & Age Int columns & insert records
--as given below.

CREATE TABLE Cricket
(
	Name varchar(50),
	City varchar(50),
	Age int
)

INSERT INTO CRICKET VALUES
(
	'Sachin Tendulkar',
	'Mumbai',
	30
),
(
	'Rahul Dravid ',
	'BOMBAY',
	35
),
(
	'M. S. Dhoni',
	'Jharkhand',
	31
),
(
	'Suresh Raina',
	'Gujarat',
	30
)


--1. Create table World cup from cricket with all the columns.

SELECT * INTO Worldcup FROM Cricket WHERE 1=2

--2. Create table T20 from cricket with first two columns with no data.

SELECT NAME,CITY INTO T20 FROM Cricket WHERE 1=2

--3. Create table IPL From Cricket with No Data

SELECT * INTO IPL FROM Cricket WHERE 1=2

--4. Insert the Data into IPL from Cricket Whose Second Character Should Be ‘A’ And String Should
--Have At least 7 Characters in Cricket Name Field.

INSERT INTO IPL SELECT * FROM Cricket WHERE NAME LIKE '_A_____%'

--5. Delete All the Rows From IPL.

TRUNCATE TABLE IPL

--6. Delete the Detail of Cricketer Whose City is Jharkhand.

DELETE FROM CRICKET WHERE CITY='JHARKHAND'

--7. Rename the Table IPL to IPL2018.

SP_RENAME 'IPL','IPL2018'

--8. Destroy table T20 with All the Data.

DROP TABLE T20

--User Defined Functions (UDF)

--1. Write a function to print number from 1 to 10. (Using while loop)

CREATE OR ALTER FUNCTION PRINT_1TO10()
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @I INT=1,@R VARCHAR(100)=''
	WHILE(@I<=10)
	BEGIN
		SET @R=CONCAT(@R,' ',@I)
		SET @I=@I+1
	END
		RETURN @R
END

SELECT [dbo].PRINT_1TO10()

--2. Write a function to check where given number is ODD or EVEN.

CREATE OR ALTER FUNCTION ODD_EVEN(@N INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @RES VARCHAR(100)=''
	IF(@N%2=0)
	BEGIN
		SET @RES= CONCAT(@N,' IS EVEN')
	END
	ELSE 
	BEGIN
		SET @RES=CONCAT(@N,' IS ODD')
	END
	RETURN @RES 
END

SELECT [dbo].ODD_EVEN(10)

--3. Write a function to print ODD numbers between 1 and 10.

CREATE OR ALTER FUNCTION ODD_1_10()
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @I INT=1,@R VARCHAR(100)=''
	WHILE(@I<=10)
	BEGIN
		IF(@I%2!=0)
		BEGIN
			SET @R=CONCAT(@R,' ',@I)
		END
		SET @I=@I+1
	END
	RETURN @R
END


SELECT [dbo].ODD_1_10()

--4. Write a function to print Sum of numbers from 1 to 50.

CREATE FUNCTION SumOf50Numbers()
RETURNS INT
AS
BEGIN
	DECLARE @I INT=1
	DECLARE @SUM INT=0
	WHILE(@I<=50)
	BEGIN
		SET @SUM+=@I
		SET @I+=1
	END
	RETURN @SUM
END

SELECT [dbo].SumOf50Numbers()

--5. Write a function to print Sum of even numbers between 1 to 20.

CREATE OR ALTER FUNCTION SumOfEven1_20()
RETURNS INT
AS
BEGIN
	DECLARE @I INT=2
	DECLARE @SUM INT=0
	WHILE(@I<=20)
	BEGIN
		IF(@I%2=0)
			SET @SUM+=@I
		SET @I+=1
	END
	RETURN @SUM
END

SELECT [dbo].SumOfEven1_20()

--6. Write a function to check weather given number is prime or not.

CREATE OR ALTER FUNCTION PrimeN(@N int)
RETURNS VARCHAR(500)
AS
BEGIN
	DECLARE @I INT=2
	WHILE(@I<@N)
	BEGIN
		IF(@N%@I=0)
		BEGIN
			RETURN CONCAT(@N,' IS NOT PRIME')
			BREAK
		END
		SET @I+=1
	END
	RETURN CONCAT(@N,' IS PRIME')
END 

SELECT [dbo].PrimeN(5)

--7. Write a function to inserting even numbers into even table & odd numbers into odd table between
--1 to 50.
CREATE TABLE EVEN
(
	NO INT
)

CREATE TABLE ODD
(
	NO INT
)
CREATE FUNCTION INSERT_ODD_EVEN()
RETURNS INT
AS
BEGIN
	DECLARE @I INT=1
	WHILE(@I<=50)
	BEGIN
		IF(@I%2=0)
			INSERT INTO EVEN(NO) VALUES(@I)
		ELSE
			INSERT INTO ODD(NO) VALUES(@I)
		SET @I+=1
	END
	RETURN @I
END