CREATE TABLE [dbo].[MultiProcedures] (
    [Id]                   INT              IDENTITY (1, 1) NOT NULL,
    [SourceProcedure]      NCHAR (10)       NOT NULL,
    [SourceModifier]       NCHAR (10)       NOT NULL,
    [DestinationProcedure] NCHAR (10)       NOT NULL,
    [DestinationModifer]   NCHAR (10)       NOT NULL,
    [EffectiveDate]        DATETIME         NOT NULL,
    [ExpirationDate]       DATETIME         NOT NULL,
    [CreatedDate]          DATETIME         NOT NULL,
    [CreatedBy]            UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

