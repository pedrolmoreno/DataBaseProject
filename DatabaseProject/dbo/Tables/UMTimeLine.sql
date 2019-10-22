CREATE TABLE [dbo].[UMTimeLine] (
    [Id]            INT              IDENTITY (1, 1) NOT NULL,
    [PayerId]       INT              NULL,
    [GroupType]     VARCHAR (10)     NULL,
    [FastTrackDays] INT              NULL,
    [StatDays]      INT              NULL,
    [LimitDays]     INT              NULL,
    [CreatedAt]     DATETIME         NULL,
    [CreatedBy]     UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_UMTimeLine] PRIMARY KEY CLUSTERED ([Id] ASC)
);

