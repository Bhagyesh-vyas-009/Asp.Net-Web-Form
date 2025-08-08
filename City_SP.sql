CREATE OR ALTER PROCEDURE [dbo].[PR_City_SelectAll]
as
	SELECT [dbo].[City].[CityID],
			[dbo].[City].[CityName],
			[dbo].[State].[StateName],
			[dbo].[Country].[CountryName]
	from [dbo].[City]
	inner join [dbo].[State]
	on [dbo].[State].[StateID]=[dbo].[City].[StateID]
	inner join [dbo].[Country]
	on [dbo].[City].[CountryID]=[dbo].[Country].[CountryID]
	ORDER BY CityName
	
CREATE OR ALTER PROCEDURE [dbo].[PR_City_SelectByUserID] 
	@UserID int
as
	SELECT [dbo].[City].[CityID],
			[dbo].[City].[CityName],
			[dbo].[State].[StateName],
			[dbo].[Country].[CountryName],
			[dbo].[User].[DisplayName]
	from [dbo].[City]
	inner join [dbo].[State]
	on [dbo].[State].[StateID]=[dbo].[City].[StateID]
	inner join [dbo].[Country]
	on [dbo].[City].[CountryID]=[dbo].[Country].[CountryID]
	inner join [dbo].[User]
	on [dbo].[City].[UserID]=[dbo].[User].[UserID]
	where [dbo].[City].[UserID]=@UserID
	ORDER BY CityName

CREATE OR ALTER PROCEDURE [dbo].[PR_City_SelectByPK]
	@CityID int
as
 SELECT [dbo].[City].[CityID],
		[dbo].[City].[CityName],
		[dbo].[City].[StateID],
		[dbo].[City].[CountryID]
from [dbo].[City]
where [dbo].[City].[CityID]=@CityID

CREATE OR ALTER PROCEDURE [dbo].[PR_City_Insert]
	@CityName varchar(50),
	@StateID int,
	@CountryID int,
	@UserID int
as
	insert into [dbo].[City]
	(
		[CityName],
		[StateID],
		[CountryID],
		[UserID]
	)
	values
	(
		@CityName,
		@StateID ,
		@CountryID,
		@UserID
	)

CREATE OR ALTER PROCEDURE [dbo].[PR_City_UpdateByPK]
	@CityID int,
	@CityName varchar(50),
	@StateID int,
	@CountryID int,
	@UserID int
as
	UPDATE [dbo].[City] SET 
		[dbo].[City].[CityName]=@CityName,
		[dbo].[City].[CountryID]=@CountryID,
		[dbo].[City].[StateID]=@StateID
	WHERE CityID=@CityID
	AND [dbo].[City].[UserID]=@UserID



CREATE OR ALTER PROCEDURE [dbo].[PR_City_DeleteByPK] 
	@CityID int
as
	Delete from [dbo].[City]
	where [dbo].[City].[CityID]=@CityID


 

truncate table city
