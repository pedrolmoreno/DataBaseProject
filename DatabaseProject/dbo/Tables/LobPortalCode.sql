CREATE TABLE [dbo].[LobPortalCode] (
    [ID]         INT IDENTITY (1, 1) NOT NULL,
    [LobId]      INT NULL,
    [PortalCode] INT NULL,
    CONSTRAINT [PK_LobPortalCode] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

