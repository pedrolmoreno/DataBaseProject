CREATE TABLE [dbo].[COARequest] (
    [Id]                          INT              IDENTITY (1, 1) NOT NULL,
    [MemberId]                    INT              NOT NULL,
    [RequestingProviderId]        INT              NOT NULL,
    [RequestingProviderLocSvcId]  INT              NOT NULL,
    [ChangeReasonId]              NVARCHAR (5)     NOT NULL,
    [CurrentNetworkId]            INT              NOT NULL,
    [NewNetworkId]                INT              NOT NULL,
    [CurrentProviderAssignmentId] INT              NOT NULL,
    [NewProviderAssignmentId]     INT              NOT NULL,
    [NewProviderPcpTypeCode]      NVARCHAR (5)     NOT NULL,
    [RequestDate]                 DATETIME2 (7)    NOT NULL,
    [Notes]                       NVARCHAR (500)   NULL,
    [DecisionStatus]              NVARCHAR (2)     NULL,
    [DecisionDate]                DATETIME2 (7)    NULL,
    [ReviewerId]                  UNIQUEIDENTIFIER NULL,
    [EffectiveDate]               DATETIME2 (7)    NOT NULL,
    [ExpirationDate]              DATETIME2 (7)    NOT NULL,
    [RequestCreator]              UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_COARequest] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_COARequest_COARequestStatus_DecisionStatus] FOREIGN KEY ([DecisionStatus]) REFERENCES [dbo].[COARequestStatus] ([Id])
);

