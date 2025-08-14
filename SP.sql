CREATE OR ALTER PROCEDURE [dbo].[PR_Country_SelectAll]
as
 SELECT [dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName],
		[dbo].[User].[DisplayName]
from [dbo].[Country]
inner join [dbo].[User]
on [dbo].[Country].[UserID]=[dbo].[User].[UserID]
ORDER BY CountryName

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_SelectByPK]
	@CountryID int
as
 SELECT [dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName]
from Country
where CountryID=@CountryID

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_Insert]
	@CountryName varchar(50),
	@UserID int
as
	insert into Country
	(
		[CountryName],
		[UserID]
	)
	values(@CountryName,@UserID)

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_DeleteByPK] 
	@CountryID int
as
	Delete from Country
	where CountryID=@CountryID

[dbo].[PR_Country1_DeleteByPK]  13

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_UpdateByPK]
	@CountryID int,
	@CountryName varchar(50),
	@UserID int
as
	UPDATE Country SET 
		CountryName=@CountryName
	WHERE CountryID=@CountryID
	AND [dbo].[Country].[UserID]=@UserID

[PR_Country_UpdateByPK] 1006,'Russia new'

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_SelectForDropDownList]
as
 SELECT [dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName]
from Country


CREATE OR ALTER PROCEDURE [dbo].[PR_Country_SelectByUserID]
	@UserID int
as
 SELECT [dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName],
		[dbo].[User].[DisplayName]
from Country
inner join [dbo].[User]
on [dbo].[Country].[UserID]=[dbo].[User].[UserID]
where [dbo].[Country].[UserID]=@UserID
ORDER BY [dbo].[Country].[CountryName]

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_SelectForDropDownListByUserID] 
	@UserID int
as
 SELECT [dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName]
from [dbo].[Country]
where [dbo].[Country].[UserID]=@UserID



