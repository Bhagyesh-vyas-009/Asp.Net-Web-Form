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
	@CountryID int
as
	insert into [dbo].[State]
	(
		[StateName],
		[CountryID]
	)
	values
	(
		@StateName,
		@CountryID
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
	@CountryID int
as
	UPDATE [dbo].[State] SET 
		StateName=@StateName,
		CountryID=@CountryID
	WHERE StateID=@StateID

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



CREATE OR ALTER PROCEDURE [dbo].[PR_State_SelectAll]
as
 SELECT [dbo].[State].[StateID],
		[dbo].[State].[StateName],
		[dbo].[Country].[CountryName]
from [dbo].[State]
inner join [dbo].[Country]
on [dbo].[State].[CountryID]=[dbo].[Country].[CountryID]
ORDER BY StateName


