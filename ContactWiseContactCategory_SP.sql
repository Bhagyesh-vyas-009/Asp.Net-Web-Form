CREATE OR ALTER PROCEDURE [dbo].[PR_ContactWiseContactCategory_SelectAll]
as
    SELECT 
        [ContactWiseContactCategoryID],
        [dbo].[ContactCategory].[ContactCategoryName],
        [dbo].[Contact].[ContactName]
    FROM [dbo].[ContactWiseContactCategory]
    INNER JOIN [dbo].[ContactCategory]
    ON [dbo].[ContactWiseContactCategory].[ContactCategoryID]=[dbo].[ContactCategory].[ContactCategoryID]
    INNER JOIN [dbo].[Contact]
    ON [dbo].[ContactWiseContactCategory].[ContactID]=[dbo].[Contact].[ContactID]
    ORDER BY [dbo].[Contact].[ContactName]

CREATE OR ALTER PROCEDURE [dbo].[PR_ContactWiseContactCategory_SelectByContactID] 
    @ContactID int
as
    SELECT 
        [ContactWiseContactCategoryID],
        [ContactCategoryID],
        [ContactID]
    FROM [dbo].[ContactWiseContactCategory]

[PR_ContactWiseContactCategory_SelectByContactID] @ContactID=13

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

declare @xml xml='
    <ContactWiseContactCategory>
        <ContactNode>
             <ContactCategoryID>3</ContactCategoryID>
            <ContactID>7</ContactID>
        </ContactNode>
          <ContactNode>
            <ContactCategoryID>4</ContactCategoryID>
            <ContactID>7</ContactID>
        </ContactNode>
    </ContactWiseContactCategory>
'
insert into [dbo].[ContactWiseContactCategory] 
SELECT 
    Contact.value('(ContactCategoryID/text())[1]','varchar(100)') as "ContactCategoryID",
    Contact.value('(ContactID/text())[1]','varchar(100)') as "ContactID"
    From 
    @xml.nodes('/ContactWiseContactCategory/ContactNode') as TEMPTABLE(Contact)

truncate table [dbo].[ContactWiseContactCategory]


CREATE OR ALTER PROCEDURE [dbo].[PR_ContactWiseContactCategory_Insert]
    @xml xml
as
    insert into [dbo].[ContactWiseContactCategory] 
        SELECT 
            Contact.value('(ContactCategoryID/text())[1]','varchar(100)') as "ContactCategoryID",
            Contact.value('(ContactID/text())[1]','varchar(100)') as "ContactID"
        From 
        @xml.nodes('/ContactWiseContactCategory/ContactNode') as TEMPTABLE(Contact)