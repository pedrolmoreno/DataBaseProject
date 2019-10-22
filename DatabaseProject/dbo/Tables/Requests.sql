CREATE TABLE [dbo].[Requests] (
    [Id]               UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [ServiceDate]      DATE             NULL,
    [LevelId]          INT              NULL,
    [SpecialtyId]      INT              NULL,
    [LocationId]       INT              NULL,
    [MemberId]         INT              NULL,
    [ProviderId]       INT              NULL,
    [LocId]            INT              NULL,
    [TheSysRequest]    INT              NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NULL,
    [DateCreated]      DATETIME         CONSTRAINT [DF_Requests_DateCreated] DEFAULT (getdate()) NULL,
    [DateModified]     DATETIME         NULL,
    [Completed]        INT              DEFAULT ((0)) NOT NULL,
    [IsLetterUploaded] INT              CONSTRAINT [DF_Requests_IsLetterUploaded] DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Procedures_Levels] FOREIGN KEY ([LevelId]) REFERENCES [dbo].[Levels] ([Id])
);

