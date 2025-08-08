CREATE OR ALTER PROCEDURE [dbo].[PR_User_SelectByUserNamePassword]
	@UserName varchar(50),
	@Password varchar(100)
as
	select  [dbo].[User].[UserID],
			[dbo].[User].[UserName],
			[dbo].[User].[Password],
			[dbo].[User].[DisplayName],
			[dbo].[User].[MobileNo],
			[dbo].[User].[Email]
	From [dbo].[User]
	WHERE [dbo].[User].[UserName]=@UserName
	AND [dbo].[User].[Password]=@Password

CREATE OR ALTER PROCEDURE [dbo].[PR_User_Register]
	@UserName varchar(50),
	@Password varchar(50),
	@DisplayName varchar(50),
	@MobileNo varchar(50),
	@Email varchar(100)
as
	INSERT INTO [dbo].[User]
	(
		[UserName],
		[Password],
[DisplayName],
[MobileNo],
[Email]
	)
	VALUES
	(
		@UserName ,
		@Password ,
		@DisplayName,
		@MobileNo ,
		@Email
	)
