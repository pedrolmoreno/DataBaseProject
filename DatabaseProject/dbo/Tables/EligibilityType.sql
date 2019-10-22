CREATE TABLE [dbo].[EligibilityType] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [Name]           VARCHAR (50)     NULL,
    [LineofBusiness] INT              NULL,
    CONSTRAINT [PK_EligibilityType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

