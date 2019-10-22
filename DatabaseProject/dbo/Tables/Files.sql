CREATE TABLE [dbo].[Files] (
    [Id]                 INT              IDENTITY (1, 1) NOT NULL,
    [RequestId]          UNIQUEIDENTIFIER NOT NULL,
    [Name]               NVARCHAR (100)   NOT NULL,
    [ContentType]        NVARCHAR (100)   NOT NULL,
    [DocumentType]       NVARCHAR (100)   NOT NULL,
    [Data]               VARBINARY (MAX)  NULL,
    [IsProviderDocument] BIT              NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Procedures_RequestsFiles] FOREIGN KEY ([RequestId]) REFERENCES [dbo].[Requests] ([Id]) ON DELETE CASCADE
);

