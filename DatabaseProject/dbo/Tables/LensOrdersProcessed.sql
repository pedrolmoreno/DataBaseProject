CREATE TABLE [dbo].[LensOrdersProcessed] (
    [Id]            BIGINT       IDENTITY (1, 1) NOT NULL,
    [ClaimID]       INT          NOT NULL,
    [Status]        VARCHAR (10) NOT NULL,
    [DateProcessed] DATETIME     NOT NULL,
    [RetryCount]    INT          CONSTRAINT [DF_LensOrdersProcessed_RetryCount] DEFAULT ((0)) NULL,
    [LastRetry]     DATETIME     NULL,
    CONSTRAINT [PK_LensOrdersProcessed] PRIMARY KEY CLUSTERED ([Id] ASC)
);

