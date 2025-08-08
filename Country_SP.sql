CREATE OR ALTER PROCEDURE [dbo].[PR_Country_SelectAll]
as
 SELECT [dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName]
from Country
ORDER BY CountryName

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_SelectByPK]
	@CountryID int
as
 SELECT [dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName]
from Country
where CountryID=@CountryID

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_Insert]
	@CountryName varchar(50)
as
	insert into Country
	values(@CountryName)

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_DeleteByPK] 
	@CountryID int
as
	Delete from Country
	where CountryID=@CountryID

[dbo].[PR_Country1_DeleteByPK]  13

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_Update]
	@CountryID int,
	@CountryName varchar(50)
as
	UPDATE Country SET CountryName=@CountryName
	WHERE CountryID=@CountryID

CREATE OR ALTER PROCEDURE [dbo].[PR_Country_SelectForDropDownList]
as
 SELECT [dbo].[Country].[CountryID],
		[dbo].[Country].[CountryName]
from Country



