CREATE TABLE [dbo].[DiagnosisT] (
    [Id]          INT              IDENTITY (1, 1) NOT NULL,
    [RequestId]   UNIQUEIDENTIFIER NOT NULL,
    [DiagCode]    NCHAR (10)       NOT NULL,
    [Description] NVARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_Procedures_RequestsDiagnosis] FOREIGN KEY ([RequestId]) REFERENCES [dbo].[Requests] ([Id]) ON DELETE CASCADE
);

