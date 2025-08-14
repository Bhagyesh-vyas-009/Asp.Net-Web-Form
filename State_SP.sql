CREATE OR ALTER PROCEDURE [dbo].[PR_State_SelectAll]
as
 SELECT [dbo].[State].[StateID],
		[dbo].[State].[StateName],
		[dbo].[Country].[CountryName]
from [dbo].[State]
inner join [dbo].[Country]
on [dbo].[State].[CountryID]=[dbo].[Country].[CountryID]
ORDER BY StateName

CREATE OR ALTER PROCEDURE [dbo].[PR_State_SelectByPK] 
	@StateID int
as
 SELECT [dbo].[State].[StateID],
		[dbo].[State].[StateName],
		[dbo].[State].[CountryID]
from State
where StateID=@StateID

CREATE OR ALTER PROCEDURE [dbo].[PR_State_Insert]
	@StateName varchar(50),
	@CountryID int,
	@UserID int
as
	insert into [dbo].[State]
	(
		[StateName],
		[CountryID],
		[UserID]
	)
	values
	(
		@StateName,
		@CountryID,
		@UserID
	)

CREATE OR ALTER PROCEDURE [dbo].[PR_State_DeleteByPK]
	@StateID int
as
	Delete from [dbo].[State]
	where StateID=@StateID

[dbo].[PR_State1_DeleteByPK]  13

CREATE OR ALTER PROCEDURE [dbo].[PR_State_UpdateByPK]
	@StateID int,
	@StateName varchar(50),
	@CountryID int,
	@UserID int
as
	UPDATE [dbo].[State] SET 
		[dbo].[State].[StateName]=@StateName,
		[dbo].[State].[CountryID]=@CountryID
	WHERE StateID=@StateID
	AND [dbo].[State].[UserID]=@UserID

CREATE OR ALTER PROCEDURE [dbo].[PR_State_SelectForDropDownList]
as
 SELECT [dbo].[State].[StateID],
		[dbo].[State].[StateName]
from [dbo].[State]

CREATE OR ALTER PROCEDURE [dbo].[PR_State_SelectForDropDownListByUserID] 
	@UserID int
as
 SELECT [dbo].[State].[StateID],
		[dbo].[State].[StateName]
from [dbo].[State]
where [dbo].[State].[UserID]=@UserID


CREATE OR ALTER PROCEDURE [dbo].[PR_State_SelectByUserID] 
	@UserID int
as
 SELECT [dbo].[State].[StateID],
		[dbo].[State].[StateName],
		[dbo].[Country].[CountryName],
		[dbo].[User].[DisplayName]
from [dbo].[State]
inner join [dbo].[Country]
on [dbo].[State].[CountryID]=[dbo].[Country].[CountryID]
inner join [dbo].[User]
on [dbo].[State].[UserID]=[dbo].[User].[UserID]
where [dbo].[State].[UserID]=@UserID
ORDER BY [dbo].[State].[StateName]

CREATE OR ALTER PROCEDURE [dbo].[PR_State_SelectForDropDownListByUserIDCountryID] 7,1018
	@UserID int,
	@CountryID int
as
 SELECT [dbo].[State].[StateID],
		[dbo].[State].[StateName]
from [dbo].[State]
where [dbo].[State].[UserID]=@UserID
and [dbo].[State].[CountryID]=@CountryID


