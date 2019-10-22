CREATE TABLE [dbo].[UMCriteriaFile] (
    [Id]              INT             IDENTITY (1, 1) NOT NULL,
    [CriteriaId]      INT             NOT NULL,
    [FileData]        VARBINARY (MAX) NULL,
    [FileName]        VARCHAR (100)   NULL,
    [FileContentType] VARCHAR (100)   NULL,
    [CreatedAt]       DATETIME        NULL,
    CONSTRAINT [PK_UMCriteriaFile] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UMCriteriaFile_UMCriterias] FOREIGN KEY ([CriteriaId]) REFERENCES [dbo].[UMCriterias] ([id])
);

