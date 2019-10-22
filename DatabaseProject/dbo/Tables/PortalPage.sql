CREATE TABLE [dbo].[PortalPage] (
    [Id]          UNIQUEIDENTIFIER CONSTRAINT [DF_PortalPage_Id] DEFAULT (newsequentialid()) NOT NULL,
    [Code]        NVARCHAR (50)    NULL,
    [Description] NVARCHAR (250)   NULL,
    [Title]       NVARCHAR (50)    NULL,
    [UrlPage]     NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_PortalPage] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

