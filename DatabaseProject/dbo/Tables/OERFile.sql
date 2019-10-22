CREATE TABLE [dbo].[OERFile] (
    [Id]           INT              IDENTITY (1, 1) NOT NULL,
    [OERId]        UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (100)   NULL,
    [ContentType]  NVARCHAR (100)   NULL,
    [DocumentType] NVARCHAR (100)   NULL,
    [Data]         VARBINARY (MAX)  NULL,
    CONSTRAINT [PK_dbo.OERFile] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

