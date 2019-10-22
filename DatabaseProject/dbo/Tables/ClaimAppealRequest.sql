CREATE TABLE [dbo].[ClaimAppealRequest] (
    [ID]                UNIQUEIDENTIFIER NOT NULL,
    [ClaimID]           INT              NULL,
    [ClaimLine]         INT              NULL,
    [Reason]            NVARCHAR (50)    NULL,
    [ReasonDescription] NVARCHAR (MAX)   NULL,
    [AppealLevel]       UNIQUEIDENTIFIER NULL,
    [AppealStatus]      UNIQUEIDENTIFIER NULL,
    [DecisionNote]      VARCHAR (5000)   NULL,
    [Reviewer]          UNIQUEIDENTIFIER NULL,
    [CreatedBy]         UNIQUEIDENTIFIER NULL,
    [CreatedAt]         DATETIME         NULL,
    [ModifiedAt]        DATETIME         NULL,
    [ModifiedBy]        UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_ClaimAppealRequest] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Procedures_ClaimAppealLevel] FOREIGN KEY ([AppealLevel]) REFERENCES [dbo].[ClaimAppealLevel] ([ID]),
    CONSTRAINT [FK_Procedures_ClaimAppealStatus] FOREIGN KEY ([AppealStatus]) REFERENCES [dbo].[ClaimAppealStatus] ([Id])
);

