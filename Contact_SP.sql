CREATE OR ALTER PROCEDURE [dbo].[PR_Contact_SelectAll]
as
 SELECT [dbo].[Contact].[ContactID],
		[dbo].[Contact].[ContactName],
		[dbo].[Contact].[ContactPhotoPath]
from [dbo].[Contact]
ORDER BY ContactName

CREATE OR ALTER PROCEDURE [dbo].[PR_Contact_Insert]
	@ContactName varchar(50),
	@ContactPhotoPath varchar(500)
as
	insert into [dbo].[Contact]
	(
		[ContactName],
		[ContactPhotoPath]
	)
	values
	(
		@ContactName,
		@ContactPhotoPath
	)

drop table [dbo].[Contact]
