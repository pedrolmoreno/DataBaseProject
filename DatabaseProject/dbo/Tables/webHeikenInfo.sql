CREATE TABLE [dbo].[webHeikenInfo] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [PATID]              INT           NULL,
    [fundusWhyNot]       VARCHAR (50)  NULL,
    [VANoGlassesR]       VARCHAR (4)   NULL,
    [VANoGlassesRNote]   VARCHAR (5)   NULL,
    [VANoGlassesL]       VARCHAR (4)   NULL,
    [VANoGlassesLNote]   VARCHAR (5)   NULL,
    [VAWithGlassesR]     VARCHAR (4)   NULL,
    [VAWithGlassesRNote] VARCHAR (5)   NULL,
    [VAWithGlassesL]     VARCHAR (4)   NULL,
    [VAWithGlassesLNote] VARCHAR (5)   NULL,
    [results]            VARCHAR (255) NULL,
    [useFor]             VARCHAR (50)  NULL,
    [drSignature]        INT           NULL,
    [voucherDate]        DATETIME      NULL,
    [issueDate]          DATETIME      NULL,
    [expDate]            DATETIME      NULL,
    [parentName]         VARCHAR (50)  NULL,
    CONSTRAINT [PK_webHeikenInfo] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90)
);

