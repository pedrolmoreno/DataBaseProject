CREATE TABLE [dbo].[ClaimAppealStatus] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [ShortName]   NVARCHAR (30)    NULL,
    [Description] NVARCHAR (50)    NULL,
    CONSTRAINT [PK_ClaimAppealStatus] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

