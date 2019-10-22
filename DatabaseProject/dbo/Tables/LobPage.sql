CREATE TABLE [dbo].[LobPage] (
    [Id]             UNIQUEIDENTIFIER CONSTRAINT [DF_EspecialtyPic_Id] DEFAULT (newsequentialid()) NOT NULL,
    [LobId]          NVARCHAR (10)    NULL,
    [PortalPageId]   UNIQUEIDENTIFIER NOT NULL,
    [Order]          INT              NULL,
    [SubmissionForm] SMALLINT         NULL,
    CONSTRAINT [PK_EspecialtyPic] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

