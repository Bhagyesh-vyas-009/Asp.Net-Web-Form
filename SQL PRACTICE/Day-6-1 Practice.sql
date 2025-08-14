--Stored Procedures

--1. Create Stored Procedure for Employee table As User enters either First Name or Last Name
--and based on this you have to give EmployeeID, DOB, Gender & Hiredate.

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_SelectByFirstORLastName] 
    @Name varchar(100)
as
SELECT [dbo].[Employee].[EmployeeID]
      ,[dbo].[Employee].[Gender]
      ,[dbo].[Employee].[HireDate]
  FROM [dbo].[Employee]
  WHERE [dbo].[Employee].[FirstName]=@Name
  OR [dbo].[Employee].[LastName]=@Name

--2. Create a Procedure that will accept Department Name and based on that gives employees list
--who belongs to that particular department.

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_SelectByDepartmentName]
    @DepartmentName varchar(100)
as
SELECT [dbo].[Employee].[EmployeeID]
      ,[dbo].[Employee].[FirstName]
      ,[dbo].[Employee].[LastName]
      ,[dbo].[Employee].[DoB]
      ,[dbo].[Employee].[Gender]
      ,[dbo].[Employee].[HireDate]
      ,[dbo].[Departments].[DepartmentName]
      ,[dbo].[Employee].[Salary]
  FROM [dbo].[Employee]
  INNER JOIN [dbo].[Departments]
  ON [dbo].[Departments].[DepartmentID]=[dbo].[Employee].[DepartmentID]
  WHERE [dbo].[Departments].[DepartmentName]=@DepartmentName

--3. Create a Procedure that accepts Project Name & Department Name and based on that you
--have to give all the project related details.

CREATE OR ALTER PROCEDURE [dbo].[PR_Projects_SelectByNameAndDepartmentName]
    @ProjectName varchar(500),
    @DepartmentName varchar(100)
as
	SELECT [dbo].[Projects].[ProjectID]
      ,[dbo].[Projects].[ProjectName]
      ,[dbo].[Projects].[StartDate]
      ,[dbo].[Projects].[EndDate]
      ,[dbo].[Departments].[DepartmentName]
  FROM [dbo].[Projects]
  INNER JOIN [dbo].[Departments]
  ON [dbo].[Departments].[DepartmentID]=[dbo].[Projects].[DepartmentID]
  WHERE [dbo].[Projects].[ProjectName]=@ProjectName
  AND [dbo].[Departments].[DepartmentName]=@DepartmentName
  ORDER BY [ProjectName]

--4. Create a Procedure that accepts Gender’s first letter only and based on that employee details
--will be served.

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_SelectByGenderFirstLetter]
    @Gender char
as
SELECT [dbo].[Employee].[EmployeeID]
      ,[dbo].[Employee].[FirstName]
      ,[dbo].[Employee].[LastName]
      ,[dbo].[Employee].[DoB]
      ,[dbo].[Employee].[Gender]
      ,[dbo].[Employee].[HireDate]
      ,[dbo].[Departments].[DepartmentName]
      ,[dbo].[Employee].[Salary]
  FROM [dbo].[Employee]
  INNER JOIN [dbo].[Departments]
  ON [dbo].[Departments].[DepartmentID]=[dbo].[Employee].[DepartmentID]
  WHERE [dbo].[Employee].[Gender] like Concat(@Gender,'%')

  print @Gender

[PR_Employee_SelectByGenderFirstLetter] 'M'

--5. Create a Procedure that accepts First Name or Department Name as input and based on that
--employee data will come.

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_SelectByFirstNameORDepartmentName]
    @Name varchar(200)
as
SELECT [dbo].[Employee].[EmployeeID]
      ,[dbo].[Employee].[FirstName]
      ,[dbo].[Employee].[LastName]
      ,[dbo].[Employee].[DoB]
      ,[dbo].[Employee].[Gender]
      ,[dbo].[Employee].[HireDate]
      ,[dbo].[Departments].[DepartmentName]
      ,[dbo].[Employee].[Salary]
  FROM [dbo].[Employee]
  INNER JOIN [dbo].[Departments]
  ON [dbo].[Departments].[DepartmentID]=[dbo].[Employee].[DepartmentID]
  WHERE [dbo].[Departments].[DepartmentName]=@Name
  OR [dbo].[Employee].[FirstName]=@Name

--6. Create a procedure that will accepts location, if user enters a locations any characters then
--he/she will get all the departments with all data.

CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_SelectByLocationCharacter]
    @LocationChar varchar(100)
as
	SELECT [dbo].[Departments].[DepartmentID]
		  ,[dbo].[Departments].[DepartmentName]
		  ,Concat([dbo].[Employee].[FirstName],' ',[dbo].[Employee].[LastName] ) as 'Manager'
		  ,[dbo].[Departments].[Location]
	FROM [dbo].[Departments]
	inner join [dbo].[Employee]
	on [dbo].[Departments].[ManagerID]=[dbo].[Employee].[EmployeeID]
    WHERE [dbo].[Departments].[Location] LIKE '%' + @LocationChar + '%'
	ORDER BY [dbo].[Departments].[DepartmentName]

--7. Create a procedure that will accepts From Date & To Date and based on that he/she will
--retrieve Project related data.

CREATE OR ALTER PROCEDURE [dbo].[PR_Projects_SelectFromToDate]
    @FromDate dateTime,
    @ToDate dateTime
as
	SELECT [dbo].[Projects].[ProjectID]
      ,[dbo].[Projects].[ProjectName]
      ,[dbo].[Projects].[StartDate]
      ,[dbo].[Projects].[EndDate]
      ,[dbo].[Departments].[DepartmentName]
  FROM [dbo].[Projects]
  INNER JOIN [dbo].[Departments]
  ON [dbo].[Departments].[DepartmentID]=[dbo].[Projects].[DepartmentID]
  WHERE [dbo].[Projects].[StartDate] >=@FromDate
  AND [dbo].[Projects].[EndDate] <=@ToDate
  ORDER BY [ProjectName]

[PR_Projects_SelectFromToDate] '2020-01-01','2027-12-31'

--8. Create a procedure that will accepts any integer and if salary is between provided integer then
--those employee list comes in output.

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_SelectBySalaryInteger]
    @MinSalary int,
    @MaxSalary int
as
SELECT [dbo].[Employee].[EmployeeID]
      ,[dbo].[Employee].[FirstName]
      ,[dbo].[Employee].[LastName]
      ,[dbo].[Employee].[DoB]
      ,[dbo].[Employee].[Gender]
      ,[dbo].[Employee].[HireDate]
      ,[dbo].[Departments].[DepartmentName]
      ,[dbo].[Employee].[Salary]
  FROM [dbo].[Employee]
  INNER JOIN [dbo].[Departments]
  ON [dbo].[Departments].[DepartmentID]=[dbo].[Employee].[DepartmentID]
  WHERE [dbo].[Employee].[Salary] BETWEEN @MinSalary AND @MaxSalary

[PR_Employee_SelectBySalaryInteger] 25000,95000 

--9. Create a Procedure that will accepts a date and gives all the employees who all are hired on
--that date.

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_SelectByHireDate]
    @HireDate DateTime
as
SELECT [dbo].[Employee].[EmployeeID]
      ,[dbo].[Employee].[FirstName]
      ,[dbo].[Employee].[LastName]
      ,[dbo].[Employee].[DoB]
      ,[dbo].[Employee].[Gender]
      ,[dbo].[Employee].[HireDate]
      ,[dbo].[Departments].[DepartmentName]
      ,[dbo].[Employee].[Salary]
  FROM [dbo].[Employee]
  INNER JOIN [dbo].[Departments]
  ON [dbo].[Departments].[DepartmentID]=[dbo].[Employee].[DepartmentID]
  WHERE [dbo].[Employee].[HireDate]=@HireDate

[PR_Employee_SelectByHireDate] '2025-07-15'

--10. Create a procedure in which user will enter project name & location and based on that you
--have to provide all data with Department Name, Manager Name With Project Name& Starting
--Ending Dates.CREATE OR ALTER PROCEDURE [dbo].[PR_Project_SelectByProjectNameAndLocation]    @ProjectName varchar(500),    @Location varchar(250)as    SELECT             [dbo].[Projects].[ProjectName],            [dbo].[Projects].[StartDate],            [dbo].[Projects].[EndDate],            [dbo].[Departments].[DepartmentName],
		    Concat([dbo].[Employee].[FirstName],' ',[dbo].[Employee].[LastName] ) as 'Manager',
		  [dbo].[Departments].[Location]
	FROM [dbo].[Projects]
    inner join[dbo].[Departments]
    on [dbo].[Projects].[DepartmentID]=[dbo].[Departments].[DepartmentID]
	inner join [dbo].[Employee]
	on [dbo].[Departments].[ManagerID]=[dbo].[Employee].[EmployeeID]
    WHERE [dbo].[Projects].[ProjectName]=@ProjectName
    AND [dbo].[Departments].[Location]=@Location

[PR_Project_SelectByProjectNameAndLocation] 'Darshan UMS','Rajkot'