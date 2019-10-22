CREATE TABLE [dbo].[ClaimAppealOverride] (
    [Id]                   UNIQUEIDENTIFIER NOT NULL,
    [ClaimAppealRequestId] UNIQUEIDENTIFIER NOT NULL,
    [OverrideCode]         NVARCHAR (MAX)   NULL,
    [DateCreated]          DATETIME         NOT NULL,
    [DateProcessed]        DATETIME         NULL,
    CONSTRAINT [PK_ClaimAppealOverride] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

