CREATE TABLE [dbo].[UMCriteriaFiles] (
    [ID]              INT             IDENTITY (1, 1) NOT NULL,
    [CriteriaID]      INT             NOT NULL,
    [FileName]        NVARCHAR (MAX)  NULL,
    [FileContentType] NVARCHAR (MAX)  NULL,
    [FileData]        VARBINARY (MAX) NULL,
    [CreatedAt]       DATETIME        NULL,
    CONSTRAINT [PK_dbo.UMCriteriaFiles] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Procedures_CriteriasFiles] FOREIGN KEY ([CriteriaID]) REFERENCES [dbo].[UMCriterias] ([id]) ON DELETE CASCADE
);

