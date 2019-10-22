CREATE TABLE [dbo].[Action] (
    [Id]              UNIQUEIDENTIFIER CONSTRAINT [DF_Action_Id] DEFAULT (newid()) NOT NULL,
    [Description]     NVARCHAR (250)   NULL,
    [ActionGroup]     NVARCHAR (50)    NULL,
    [Code]            NVARCHAR (50)    NULL,
    [Image]           NVARCHAR (MAX)   NULL,
    [Url]             NVARCHAR (MAX)   NULL,
    [Active]          BIT              NULL,
    [SequentialGroup] INT              CONSTRAINT [DF_Action_SequentialGroup] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Action_1] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

