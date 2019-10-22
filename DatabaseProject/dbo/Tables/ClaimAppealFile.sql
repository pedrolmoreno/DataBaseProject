CREATE TABLE [dbo].[ClaimAppealFile] (
    [ID]              UNIQUEIDENTIFIER CONSTRAINT [DF_ClaimAppealFile_ID] DEFAULT (newid()) NOT NULL,
    [AppealRequestID] UNIQUEIDENTIFIER NULL,
    [Name]            NVARCHAR (MAX)   NULL,
    [ContentType]     NVARCHAR (MAX)   NULL,
    [DataContent]     VARBINARY (MAX)  NULL,
    [UploadDate]      DATETIME         NULL,
    [FileSize]        DECIMAL (18, 2)  NULL,
    CONSTRAINT [PK_ClaimAppealFile] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Procedures_ClaimAppealRequestFile] FOREIGN KEY ([AppealRequestID]) REFERENCES [dbo].[ClaimAppealRequest] ([ID]) ON DELETE CASCADE
);

