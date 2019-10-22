CREATE TABLE [dbo].[ClaimAppealHistory] (
    [ID]              INT              IDENTITY (1, 1) NOT NULL,
    [AppealRequestID] UNIQUEIDENTIFIER NULL,
    [UserID]          UNIQUEIDENTIFIER NULL,
    [CreatedAt]       DATETIME         NULL,
    [AppealStatus]    UNIQUEIDENTIFIER NULL,
    [AppealNote]      NVARCHAR (100)   NULL,
    CONSTRAINT [PK_ClaimAppealHistory] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Procedures_ClaimAppealHistoryStatus] FOREIGN KEY ([AppealStatus]) REFERENCES [dbo].[ClaimAppealStatus] ([Id]),
    CONSTRAINT [FK_Procedures_ClaimAppealRequestHistory] FOREIGN KEY ([AppealRequestID]) REFERENCES [dbo].[ClaimAppealRequest] ([ID]) ON DELETE CASCADE
);

