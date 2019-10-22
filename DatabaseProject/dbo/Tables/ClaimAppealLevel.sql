CREATE TABLE [dbo].[ClaimAppealLevel] (
    [ID]          UNIQUEIDENTIFIER NOT NULL,
    [ShortName]   NVARCHAR (30)    NULL,
    [Description] NVARCHAR (50)    NULL,
    CONSTRAINT [PK_ClaimAppealLevel] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

