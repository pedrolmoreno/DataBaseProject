CREATE TABLE [dbo].[COARequestStatus] (
    [Id]          NVARCHAR (2)   NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [State]       BIT            NOT NULL,
    CONSTRAINT [PK_COARequestStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);

