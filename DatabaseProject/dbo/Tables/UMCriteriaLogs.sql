CREATE TABLE [dbo].[UMCriteriaLogs] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [DateCreated] DATETIME      NOT NULL,
    [Message]     VARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_UMCriteriaLogs] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

