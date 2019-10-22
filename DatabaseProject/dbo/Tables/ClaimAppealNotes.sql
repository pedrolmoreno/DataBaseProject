CREATE TABLE [dbo].[ClaimAppealNotes] (
    [ID]              BIGINT           IDENTITY (1, 1) NOT NULL,
    [AppealRequestId] UNIQUEIDENTIFIER NULL,
    [InternalNote]    NVARCHAR (MAX)   NULL,
    [CreatedBy]       UNIQUEIDENTIFIER NULL,
    [CreatedAt]       DATETIME         NULL,
    [TheSysNoteID]    BIGINT           NULL,
    CONSTRAINT [PK_ClaimAppealNotes] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100),
    CONSTRAINT [FK_ClaimAppealNotes_ClaimAppealRequest] FOREIGN KEY ([AppealRequestId]) REFERENCES [dbo].[ClaimAppealRequest] ([ID])
);

