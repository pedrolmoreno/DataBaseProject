CREATE TABLE [dbo].[UMProcedures] (
    [Id]            INT              IDENTITY (1, 1) NOT NULL,
    [ProcedureCode] VARCHAR (8)      NOT NULL,
    [PayerId]       INT              NULL,
    [SpecialtyId]   INT              NULL,
    [ProviderState] VARCHAR (2)      NULL,
    [CreatedAt]     DATETIME         NULL,
    [Createdby]     UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_UMProcedures] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 100)
);

