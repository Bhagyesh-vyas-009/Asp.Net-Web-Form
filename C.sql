CREATE OR ALTER PROCEDURE [dbo].[PR_ContactWiseContactCategory_Insert]
    @ContactCategoryID int,
    @ContactID int
as

    INSERT INTO [dbo].[ContactWiseContactCategory]
           (
               [ContactID],
               [ContactCategoryID]
           )
     VALUES
           (
               @ContactID,
               @ContactCategoryID
           )
	