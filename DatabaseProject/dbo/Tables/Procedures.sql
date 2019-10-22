CREATE TABLE [dbo].[Procedures] (
    [Id]                 INT              IDENTITY (1, 1) NOT NULL,
    [RequestId]          UNIQUEIDENTIFIER NOT NULL,
    [CPTCode]            NCHAR (10)       NULL,
    [Description]        NVARCHAR (50)    NULL,
    [Modifier]           NCHAR (10)       NULL,
    [ReferenceDiagnosis] NVARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Procedures_RequestsProcedures] FOREIGN KEY ([RequestId]) REFERENCES [dbo].[Requests] ([Id]) ON DELETE CASCADE
);

