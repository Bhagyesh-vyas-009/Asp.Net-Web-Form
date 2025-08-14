CREATE OR ALTER PROCEDURE [dbo].[PR_Contact_SelectAll]
as
	SELECT [dbo].[Contact].[ContactID]
		  ,[dbo].[Country].[CountryName]
		  ,[dbo].[State].[StateName]
		  ,[dbo].[City].[CityName]
		  ,[dbo].[Contact].[ContactName]
		  ,[dbo].[Contact].[Gender]
		  ,[dbo].[Contact].[MobileNo]
		  ,[dbo].[Contact].[WhatsAppNo]
		  ,[dbo].[Contact].[Email]
		  ,[dbo].[Contact].[Address]
		  ,[dbo].[Contact].[Age]
		  ,[dbo].[Contact].[BirthDate]
		  ,[dbo].[Contact].[BloodGroup]
	FROM [dbo].[Contact]
	INNER JOIN [dbo].[Country]
	ON [dbo].[Contact].[CountryID]=[dbo].[Country].[CountryID]
	INNER JOIN [dbo].[State]
	ON [dbo].[Contact].[StateID]=[dbo].[State].[StateID]
	INNER JOIN [dbo].[City]
	ON [dbo].[Contact].[CityID]=[dbo].[City].[CityID]
	ORDER BY ContactName

CREATE OR ALTER PROCEDURE [dbo].[PR_Contact_SelectByPK]
	@ContactID int
as
 SELECT [ContactID]
      ,[CountryID]
      ,[StateID]
      ,[CityID]
      ,[ContactName]
      ,[Gender]
      ,[MobileNo]
      ,[WhatsAppNo]
      ,[Email]
      ,[Address]
      ,[Age]
      ,[BirthDate]
      ,[BloodGroup]
  FROM [dbo].[Contact]
where [dbo].[Contact].[ContactID]=@ContactID

CREATE OR ALTER PROCEDURE [dbo].[PR_Contact_Insert]
	@ContactID int Out,
	@CountryID	int,
	@StateID	int,
	@CityID	int,
	@ContactName	varchar(50)	,
	@Gender	varchar(10)	,
	@MobileNo	varchar(250)	,
	@WhatsAppNo	varchar(50)	,
	@Email	varchar(200)	,
	@Address	varchar(500)	,
	@Age	int	,
	@BirthDate	datetime	,
	@BloodGroup	varchar(50)	
as
	insert into [dbo].[Contact]
	(
		CountryID,
		StateID,
		CityID	,
		ContactName	,
		Gender	,
		MobileNo	,
		WhatsAppNo,
		Email,
		Address,
		Age,
		BirthDate,
		BloodGroup	
	)
	values
	(
		@CountryID,
		@StateID,
		@CityID	,
		@ContactName	,
		@Gender	,
		@MobileNo	,
		@WhatsAppNo,
		@Email,
		@Address,
		@Age,
		@BirthDate,
		@BloodGroup	
	)

	SET @ContactID=SCOPE_IDENTITY()

CREATE OR ALTER PROCEDURE [dbo].[PR_Contact_DeleteByPK] 
	@ContactID int
as
	Delete from [dbo].[ContactWiseContactCategory]
	where [dbo].[ContactWiseContactCategory].[ContactID]=@ContactID

	Delete from [dbo].[Contact]
	where [dbo].[Contact].[ContactID]=@ContactID

[PR_Contact_DeleteByPK] 4


CREATE OR ALTER PROCEDURE [dbo].[PR_Contact_UpdateByPK]
	@ContactID int,
	@CountryID	int,
	@StateID	int,
	@CityID	int,
	@ContactName	varchar(50)	,
	@Gender	varchar(10)	,
	@MobileNo	varchar(250)	,
	@WhatsAppNo	varchar(50)	,
	@Email	varchar(200)	,
	@Address	varchar(500)	,
	@Age	int	,
	@BirthDate	datetime	,
	@BloodGroup	varchar(50)	
as
	UPDATE  [dbo].[Contact] SET
		CountryID=@CountryID,
		StateID=@StateID,
		CityID=@CityID,
		ContactName=@ContactName,
		Gender=@Gender,
		MobileNo=@MobileNo,
		WhatsAppNo=@MobileNo,
		Email=@Email,
		Address=@Address,
		Age=@Age,
		BirthDate=@BirthDate,
		BloodGroup=@BloodGroup
	WHERE [dbo].[Contact].[ContactID]=@ContactID
	
drop table [dbo].[Contact]
