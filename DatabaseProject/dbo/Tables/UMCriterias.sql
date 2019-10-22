CREATE TABLE [dbo].[UMCriterias] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [procedure_code]  VARCHAR (5)  NULL,
    [notes]           VARCHAR (50) NULL,
    [lob]             INT          NULL,
    [payor]           INT          NULL,
    [insurance_group] VARCHAR (5)  NULL,
    [specialty]       INT          NULL,
    [created]         DATETIME     NULL,
    CONSTRAINT [PK_UMCriterias] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);

