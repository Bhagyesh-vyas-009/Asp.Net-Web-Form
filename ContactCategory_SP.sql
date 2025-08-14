CREATE OR ALTER PROCEDURE [dbo].[PR_ContactCategory_SelectForDropDownList]
as
    SELECT [ContactCategoryID]
          ,[ContactCategoryName]
    FROM [dbo].[ContactCategory]
    ORDER BY [ContactCategoryName]



