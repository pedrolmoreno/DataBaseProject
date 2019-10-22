CREATE TABLE [dbo].[ClaimFiles] (
    [ID]          UNIQUEIDENTIFIER NOT NULL,
    [ClaimId]     INT              NOT NULL,
    [Name]        NVARCHAR (MAX)   NULL,
    [ContentType] NVARCHAR (MAX)   NULL,
    [DataContent] VARBINARY (MAX)  NULL,
    [UploadDate]  DATETIME         NOT NULL,
    [Size]        DECIMAL (16, 3)  NULL,
    CONSTRAINT [PK_dbo.ClaimFiles] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

