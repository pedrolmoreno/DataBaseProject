CREATE TABLE [dbo].[ClaimAppealInfoRequest] (
    [ID]              INT              IDENTITY (1, 1) NOT NULL,
    [AppealRequestID] UNIQUEIDENTIFIER NULL,
    [UserID]          UNIQUEIDENTIFIER NULL,
    [RequestDate]     DATETIME         NULL,
    [RequestNote]     NVARCHAR (MAX)   NULL,
    [ReceivedDate]    DATETIME         NULL,
    CONSTRAINT [PK_ClaimAppealInfoRequest] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Procedures_ClaimAppealInfoRequest] FOREIGN KEY ([AppealRequestID]) REFERENCES [dbo].[ClaimAppealRequest] ([ID]) ON DELETE CASCADE
);

