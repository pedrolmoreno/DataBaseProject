CREATE TABLE [dbo].[DictionaryData] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [GroupValues] NVARCHAR (50)  NULL,
    [Code]        NVARCHAR (50)  NOT NULL,
    [Value]       NVARCHAR (200) NOT NULL,
    [Text]        NVARCHAR (MAX) NULL,
    [Sequential]  INT            CONSTRAINT [DF_LOB_PROC_EXAM_ITEM] DEFAULT ((0)) NULL,
    [Type]        NVARCHAR (50)  NULL,
    [Parent]      NVARCHAR (50)  NULL,
    [Description] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_DictionaryData_1] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

