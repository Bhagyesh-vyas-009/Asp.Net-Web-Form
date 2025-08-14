CREATE TABLE Departments
(
	DepartmentID Int Primary Key IDENTITY(1,1),
	DepartmentName Varchar(100) NOT NULL,
	ManagerID Int NULL,
	Location Varchar(100) NOT NULL)CREATE TABLE Projects
(
	ProjectID Int Primary Key IDENTITY(1,1),
	ProjectName Varchar(100) NOT NULL,
	StartDate Datetime NOT NULL,
	EndDate Datetime NOT NULL,
	DepartmentID Int NOT NULL,
	CONSTRAINT FK_Projects_Departments Foreign Key(DepartmentID) REFERENCES Departments(DepartmentID)
)

CREATE TABLE Employee
(
	EmployeeID Int Primary Key IDENTITY(1,1),
	FirstName Varchar(100) NOT NULL,
	LastName Varchar(100) NOT NULL,
	DoB Datetime NOT NULL,
	Gender Varchar(50) NOT NULL,
	HireDate Datetime NOT NULL,
	DepartmentID Int NOT NULL, 
	Salary Decimal(10,2) NOT NULL,
	CONSTRAINT FK_Departments_Employee Foreign Key(DepartmentID) REFERENCES Departments(DepartmentID)
)

drop table Departments
drop table Employee
drop table Projects

--1. Retrieve all employees with gender column as Male to M & Female to F and Other in all other cases.

SELECT FIRSTNAME,LASTNAME ,
CASE 
	WHEN GENDER='MALE' THEN 'M'
	WHEN GENDER='FEMALE' THEN 'F'
	ELSE 'other'
	END 
AS GENDER
FROM [dbo].[Employee]

--2. Retrieve employees with column Salary_Status in that if salary is less than 40000 than
--show status ‘Low’, if salary between 40000 to 80000 than show status ‘Medium’ and
--display ‘High’ in all other cases.


SELECT FIRSTNAME,LASTNAME ,
CASE 
	WHEN Salary<40000 THEN 'Low'
	WHEN Salary>8000 THEN 'High'
	ELSE 'Medium'
	END 
AS Salary_Status
FROM [dbo].[Employee]

--3. Give First Name & Last Name with DepartmentID as Department Column.
--e.g if departmentid is 1 than ‘HR’, 2 than ‘Finance’, 3 than ‘IT’ etc.

SELECT Emp.FIRSTNAME,Emp.LASTNAME,Dept.DepartmentName as Department
FROM [dbo].[Employee] Emp
inner join [dbo].[Departments] Dept
on Emp.[DepartmentID]=Dept.[DepartmentID]

--4. Retrieve employees with full name column as combination of both First Name & Last Name.

SELECT CONCAT([FirstName],[LastName]) "Full Name" from [dbo].[Employee]

--5. Calculate performance bonus. Add performance bonus column in your selection list as
--if salary greater than 50000 than 1% of salary except all other cases 5% of salary.

SELECT FIRSTNAME,LASTNAME,Salary,
CASE 
	WHEN Salary>50000 THEN Salary*0.01
	ELSE Salary*0.05
	END 
AS "Performance Bonus"
FROM [dbo].[Employee]

--6. Give additional 5% bonus to all male employees. 

update [dbo].[Employee]
set Salary=Salary+(Salary*0.05)
FROM [dbo].[Employee]
where [dbo].[Employee].[Gender]='Male'

--7. Give employees with one more column Sal_Bonus (if gender is female then salary *0.1)

SELECT FIRSTNAME,LASTNAME,Salary,(Salary*0.1) AS "Sal_Bonus"
FROM [dbo].[Employee]
where [dbo].[Employee].[Gender]='Female'

--8. Extract Birthday Month from DOB and show it with employees list.

SELECT FIRSTNAME,LASTNAME,DATENAME(month,DoB) as Month, Month(DoB) as Birth_Month
FROM [dbo].[Employee]

--9. Bonus Eligibility Based on Department with following cases, retrieve all employees
--with bonus column as given criteria.
--a. DepartmentID is 1 than Eligible for Sales Bonus
--b. DepartmentID is 2 than Eligible for HR Bonus
--c. DepartmentID is 3 than Eligible for IT Bonus

SELECT FIRSTNAME,LASTNAME ,
CASE 
	WHEN DepartmentID=1 THEN 'Sales Bonus'
	WHEN DepartmentID=2 THEN 'HR Bonus'
	WHEN DepartmentID=3 THEN 'IT Bonus'
	ELSE 'NO BONUS'
	END 
AS "Bonus Eligibility"
FROM [dbo].[Employee]

SELECT Emp.FIRSTNAME,Emp.LASTNAME,Dept.DepartmentName+' Bonus' as "Bonus Eligibility"
FROM [dbo].[Employee] Emp
inner join [dbo].[Departments] Dept
on Emp.[DepartmentID]=Dept.[DepartmentID]

--10. Flexible Work Arrangement on Department with following cases, retrieve all
--employees with bonus column as given criteria.
	--a. DepartmentName is IT than Eligible for Flexible Work
	--b. DepartmentName is Sales than Standard Work Arrangement
	--c. DepartmentName is HR than Standard Work Arrangement
	--d. All other Regular Work Arrangement

	SELECT Emp.FIRSTNAME,Emp.LASTNAME ,
	CASE 
		WHEN Dept.DepartmentName='IT' THEN 'Eligible for Flexible Work'
		WHEN Dept.DepartmentName='Sales' THEN 'Standard Work Arrangement'
		WHEN Dept.DepartmentName='HR' THEN 'Standard Work Arrangement'
		ELSE 'Regular Work Arrangement'
		END 
	AS "Flexible Work Arrangement"
	FROM [dbo].[Employee] Emp
	inner join [dbo].[Departments] Dept
	on Emp.[DepartmentID]=Dept.[DepartmentID]

--11. Produce output like: <firstname> receives <salary> per month which is in
--<departmentname>.

SELECT CONCAT(Emp.FIRSTNAME,' receives',Emp.Salary,' per month which is in ',Dept.DepartmentName)
FROM [dbo].[Employee] Emp
inner join [dbo].[Departments] Dept
on Emp.[DepartmentID]=Dept.[DepartmentID]

SELECT Emp.FIRSTNAME+' receives'+Cast(Emp.Salary as varchar) +' per month which is in '+Dept.DepartmentName
FROM [dbo].[Employee] Emp
inner join [dbo].[Departments] Dept
on Emp.[DepartmentID]=Dept.[DepartmentID]

SELECT Emp.FIRSTNAME+' receives'+Convert(varchar,Emp.Salary) +' per month which is in '+Dept.DepartmentName
FROM [dbo].[Employee] Emp
inner join [dbo].[Departments] Dept
on Emp.[DepartmentID]=Dept.[DepartmentID]

--12. Employee Status Based on Age: Compare the DOB with current date and Add column
--as Young, aged, other. (if difference less than 25 then young, less than 40 then aged)

SELECT FIRSTNAME,LASTNAME ,
CASE 
	WHEN DateDiff(Year,DoB,GETDATE()) < 25 THEN 'Young'
	WHEN DateDiff(Year,DoB,GETDATE()) < 40 THEN 'Aged'
	ELSE 'other'
	END 
AS "Employee Status Based on Age"
FROM [dbo].[Employee]

--13. International Travel Eligibility: if salary is greater than 50000 then mark status as
--Eligible for International Travel and remaining all cases Domestic Only.

SELECT FIRSTNAME,LASTNAME,Salary,
CASE 
	WHEN Salary>50000 THEN 'Eligible for International Travel'
	ELSE 'Domestic Only'
	END 
AS "International Travel Eligibility"
FROM [dbo].[Employee] Emp


--14. Preferred Communication Channel: if department name is IT then Email and all other
--cases Phone.

SELECT Emp.*,
CASE 
	WHEN Dept.DepartmentName='IT' THEN 'Email'
	ELSE 'Phone'
	END 
"Preferred Communication Channel"
FROM [dbo].[Employee] Emp
inner join [dbo].[Departments] Dept
on Emp.[DepartmentID]=Dept.[DepartmentID]

--15. Give one more column with if gender is male then add Mr. with first name, female
--then Ms. With first name & Mx. In all other cases.SELECT FIRSTNAME,LASTNAME,
CASE 
	WHEN Gender='Male' THEN Concat('Mr. ',FirstName)
	WHEN Gender='Female' THEN Concat('Ms. ',FirstName)
	ELSE Concat('Mx. ',FirstName)
	END 
AS "Name"
FROM [dbo].[Employee]


--Views

--16. Create view that will display department wise average, minimum & maximum salaries.

CREATE VIEW DEPT_AVG_MIN_MAX_SALARY
AS
	SELECT DEPT.[DepartmentName],AVG(EMP.[Salary]) "Average Salary",MIN(EMP.[Salary]) "Minimum Salary",MAX(EMP.[Salary]) "Maximum Salary"
	FROM [dbo].[Departments] DEPT
	INNER JOIN [dbo].[Employee] EMP
	ON DEPT.[DepartmentID]=EMP.[DepartmentID]
	GROUP BY DEPT.[DepartmentName]

SELECT * FROM DEPT_AVG_MIN_MAX_SALARY

--17. Create view that will display all employees along with their department names.

CREATE VIEW V_EMP_DEPTNAME
AS
	SELECT EMP.FirstName,EMP.LastName,DEPT.DepartmentName
	FROM [dbo].[Employee] EMP
	INNER JOIN [dbo].[Departments] DEPT
	ON DEPT.[DepartmentID]=EMP.[DepartmentID]

SELECT * FROM V_EMP_DEPTNAME

--18. Create view that will display all projects and their start dates along with department names.

CREATE VIEW V_PROJECTS_DEPTNAME
AS
	SELECT [dbo].[Projects].[ProjectName],[dbo].[Projects].[StartDate],[dbo].[Departments].DepartmentName
	FROM [dbo].[Projects]
	INNER JOIN [dbo].[Departments] 
	ON [dbo].[Projects].[DepartmentID]=[dbo].[Departments].[DepartmentID]

SELECT * FROM V_PROJECTS_DEPTNAME

--19. Create view that will display employees who have no department.

CREATE VIEW V_EMP_NO_DEPT
AS
	SELECT EMP.FirstName,EMP.LastName
	FROM [dbo].[Employee] EMP
	LEFT JOIN [dbo].[Departments] DEPT
	ON DEPT.[DepartmentID]=EMP.[DepartmentID]
	WHERE DEPT.[DepartmentID]=NULL

SELECT * FROM V_EMP_NO_DEPT


--20. Create view that will display projects along with the department manager's name.

CREATE VIEW V_PROJECTS_DEPT_MNGRNAME
AS
	SELECT [dbo].[Projects].[ProjectName],[dbo].[Employee].[FirstName]+[dbo].[Employee].[LastName] "Manager Name"
	FROM [dbo].[Projects]
	INNER JOIN [dbo].[Departments] 
	ON [dbo].[Projects].[DepartmentID]=[dbo].[Departments].[DepartmentID]
	INNER JOIN [dbo].[Employee] 
	ON [dbo].[Departments].[ManagerID]=[dbo].[Employee].[EmployeeID]

SELECT * FROM V_PROJECTS_DEPT_MNGRNAME


--21. Create view that will display all departments with more than 100 employees.

CREATE OR ALTER VIEW V_DepartmentWithMoreThan100Emp
AS
	SELECT [dbo].[Departments].[DepartmentName]
	FROM [dbo].[Departments] 
	INNER JOIN [dbo].[Employee] 
	ON [dbo].[Departments].[DepartmentID]=[dbo].[Employee].[DepartmentID]
	GROUP BY [dbo].[Departments].[DepartmentName]
	HAVING COUNT([dbo].[Employee].[EmployeeID])>100

SELECT * FROM V_DepartmentWithMoreThan100Emp

--22. Create view that will display all projects managed by employees older than 30 years.

CREATE VIEW V_PROJECTS_ManagedBy_Emp_OlderThan30
AS
	SELECT [dbo].[Projects].[ProjectName],[dbo].[Employee].[FirstName]+[dbo].[Employee].[LastName] "Manager Name"
	FROM [dbo].[Projects]
	INNER JOIN [dbo].[Departments] 
	ON [dbo].[Projects].[DepartmentID]=[dbo].[Departments].[DepartmentID]
	INNER JOIN [dbo].[Employee] 
	ON [dbo].[Departments].[ManagerID]=[dbo].[Employee].[EmployeeID]
	WHERE DATEDIFF(YEAR,[dbo].[Employee].[DoB],GETDATE())>30

SELECT * FROM V_PROJECTS_ManagedBy_Emp_OlderThan30

--23. Create view that will display all projects that have both started and ended within the
--same year.

CREATE VIEW V_Projects_Same_Year
as
	SELECT [dbo].[Projects].[ProjectName]
	FROM [dbo].[Projects]
	WHERE YEAR([StartDate])=YEAR([EndDate])

SELECT * FROM V_Projects_Same_Year

--24. Create view that will display departments with more than 3 employees and list their
--project names.


CREATE OR ALTER VIEW V_DeptWithMoreThan3Emp_Project_Name
AS
	SELECT [dbo].[Departments].[DepartmentName],[dbo].[Projects].[ProjectName]
	FROM [dbo].[Projects]
	INNER JOIN [dbo].[Departments] 
	ON [dbo].[Projects].[DepartmentID]=[dbo].[Departments].[DepartmentID]
	INNER JOIN [dbo].[Employee] 
	ON [dbo].[Departments].[ManagerID]=[dbo].[Employee].[EmployeeID]
	GROUP BY [dbo].[Departments].[DepartmentName],[dbo].[Projects].[ProjectName]
	HAVING COUNT([dbo].[Employee].[EmployeeID])>3

SELECT * FROM V_DeptWithMoreThan3Emp_Project_Name


--25. Create view that will display the total number of employees working in departments
--where the manager has more than 10 years of experience.CREATE OR ALTER VIEW V_DeptTotalEmp_MngrExpGrthThan10years
AS
	SELECT [dbo].[Departments].[DepartmentName],COUNT([dbo].[Employee].[EmployeeID]) AS "Total Emp Count"
	FROM [dbo].[Departments] 
	INNER JOIN [dbo].[Employee] 
	ON [dbo].[Departments].[DepartmentID]=[dbo].[Employee].[DepartmentID]
	WHERE [dbo].[Departments].[DepartmentName] in
		(
			Select [dbo].[Departments].[DepartmentName]
			from [dbo].[Departments] 
			INNER JOIN [dbo].[Employee] 
			ON [dbo].[Departments].[ManagerID]=[dbo].[Employee].[EmployeeID]
			WHERE DATEDIFF(YEAR,[dbo].[Employee].[HireDate],GETDATE())>10
		)
	GROUP BY [dbo].[Departments].[DepartmentName]

SELECT * FROM V_DeptTotalEmp_MngrExpGrthThan10years

--Stored Procedures

--26. Create Stored Procedures for mentioned 3 tables
--(Total 15 Procedures you have to create as 3 table x 5 = 15)

	--a. To Retrieve all columns with all data (do apply necessary joins if applicable)
	--b. To Insert Record in a table
	--c. To Delete Record from table
	--d. To Update Record based on Primary Key
	--e. To View Single Record based on Primary Key.

--Departments

CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_SelectAll]
as
	SELECT [dbo].[Departments].[DepartmentID]
		  ,[dbo].[Departments].[DepartmentName]
		  ,Concat([dbo].[Employee].[FirstName],' ',[dbo].[Employee].[LastName] ) as 'Manager'
		  ,[dbo].[Departments].[Location]
	FROM [dbo].[Departments]
	inner join [dbo].[Employee]
	on [dbo].[Departments].[ManagerID]=[dbo].[Employee].[EmployeeID]
	ORDER BY [dbo].[Departments].[DepartmentName]

[dbo].[PR_Departments_SelectAll]

CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_SelectByPK] 
	@DepartmentID int
as
	SELECT [DepartmentID]
      ,[DepartmentName]
      ,[ManagerID]
      ,[Location]
  FROM [dbo].[Departments]
  WHERE [dbo].[Departments].[DepartmentID]=@DepartmentID

[dbo].[PR_Departments_SelectByPK] 1


CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_Insert]
	@DepartmentName varchar(100),
	@ManagerID int,
    @Location varchar(100)
as
INSERT INTO [dbo].[Departments]
           ([DepartmentName]
           ,[ManagerID]
           ,[Location])
     VALUES
           (
				@DepartmentName,
				@ManagerID,
				@Location
			)

CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_DeleteByPK]
	@DepartmentID int
as
	DELETE FROM [dbo].[Departments]
      WHERE [DepartmentID]=@DepartmentID


CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_UpdateByPK]
	@DepartmentID int,
	@DepartmentName varchar(100),
	@ManagerID int,
    @Location varchar(100)
as
	UPDATE [dbo].[Departments] SET
           [DepartmentName]=@DepartmentName,
           [ManagerID]=@ManagerID,
           [Location]=@Location
	WHERE [DepartmentID]=@DepartmentID			
	
--Employee

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_SelectAll]
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

[dbo].[PR_Employee_SelectAll]

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_SelectByPK] 
	@EmployeeID int
as
SELECT [dbo].[Employee].[EmployeeID]
      ,[dbo].[Employee].[FirstName]
      ,[dbo].[Employee].[LastName]
      ,[dbo].[Employee].[DoB]
      ,[dbo].[Employee].[Gender]
      ,[dbo].[Employee].[HireDate]
      ,[dbo].[Employee].[DepartmentID]
      ,[dbo].[Employee].[Salary]
  FROM [dbo].[Employee]
  WHERE [dbo].[Employee].[EmployeeID]=@EmployeeID

[dbo].[PR_Employee_SelectByPK] 5

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_Insert]
	@FirstName	varchar(100),
	@LastName	varchar(100),
	@DoB	datetime,
	@Gender	varchar(50),
	@HireDate	datetime,
	@DepartmentID	int,
	@Salary	decimal(10, 2)	
as
	INSERT INTO [dbo].[Employee]
           ([FirstName]
           ,[LastName]
           ,[DoB]
           ,[Gender]
           ,[HireDate]
           ,[DepartmentID]
           ,[Salary])
     VALUES
	 (
		@FirstName,
		@LastName,
		@DoB,
		@Gender,
		@HireDate,
		@DepartmentID,
		@Salary	
	 )


CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_UpdateByPK]
	@EmployeeID	int,
	@FirstName	varchar(100),
	@LastName	varchar(100),
	@DoB	datetime,
	@Gender	varchar(50),
	@HireDate	datetime,
	@DepartmentID	int,
	@Salary	decimal(10, 2)	
as
	UPDATE [dbo].[Employee] SET
			[FirstName]=@FirstName
           ,[LastName]=@LastName
           ,[DoB]=@DoB
           ,[Gender]=@Gender
           ,[HireDate]=@HireDate
           ,[DepartmentID]=@DepartmentID
           ,[Salary]=@Salary
	WHERE [dbo].[Employee].[EmployeeID]=@EmployeeID
		

CREATE OR ALTER PROCEDURE [dbo].[PR_Employee_DeleteByPK]
	@EmployeeID int
as
	DELETE FROM [dbo].[Employee]
      WHERE [EmployeeID]=@EmployeeID

--Projects

CREATE OR ALTER PROCEDURE [dbo].[PR_Projects_SelectAll]
as
	SELECT [dbo].[Projects].[ProjectID]
      ,[dbo].[Projects].[ProjectName]
      ,[dbo].[Projects].[StartDate]
      ,[dbo].[Projects].[EndDate]
      ,[dbo].[Departments].[DepartmentName]
  FROM [dbo].[Projects]
  INNER JOIN [dbo].[Departments]
  ON [dbo].[Departments].[DepartmentID]=[dbo].[Projects].[DepartmentID]
  ORDER BY [ProjectName]

CREATE OR ALTER PROCEDURE [dbo].[PR_Projects_SelectByPK]
	@ProjectID int
as

SELECT [dbo].[Projects].[ProjectID]
      ,[dbo].[Projects].[ProjectName]
      ,[dbo].[Projects].[StartDate]
      ,[dbo].[Projects].[EndDate]
      ,[dbo].[Projects].[DepartmentID]
  FROM [dbo].[Projects]
  WHERE [dbo].[Projects].[ProjectID]=@ProjectID

CREATE OR ALTER PROCEDURE [dbo].[PR_Projects_Insert]
	@ProjectName	varchar(100)	,
	@StartDate	datetime	,
	@EndDate	datetime	,
	@DepartmentID	int	
as
	INSERT INTO [dbo].[Projects]
           ([ProjectName]
           ,[StartDate]
           ,[EndDate]
           ,[DepartmentID])
     VALUES
           (
			@ProjectName,
			@StartDate,
			@EndDate,
			@DepartmentID
		   )

CREATE OR ALTER PROCEDURE [dbo].[PR_Projects_UpdateByPK]
	@ProjectID	int	,
	@ProjectName	varchar(100)	,
	@StartDate	datetime	,
	@EndDate	datetime	,
	@DepartmentID	int	
as
	UPDATE [dbo].[Projects] SET
		[ProjectName]=@ProjectName
           ,[StartDate]=@StartDate
           ,[EndDate]=@EndDate
           ,[DepartmentID]=@DepartmentID
	WHERE [dbo].[Projects].[ProjectID]=@ProjectID

CREATE OR ALTER PROCEDURE [dbo].[PR_Projects_DeleteByPK]
	@ProjectID	int	
as
	DELETE FROM [dbo].[Projects]
	WHERE [dbo].[Projects].[ProjectID]=@ProjectID
