CREATE TABLE [dbo].[CodesCPT] (
    [Id]        INT        IDENTITY (1, 1) NOT NULL,
    [Code]      INT        NOT NULL,
    [modifiers] NCHAR (30) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

