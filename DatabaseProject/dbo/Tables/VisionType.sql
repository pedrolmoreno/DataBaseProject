CREATE TABLE [dbo].[VisionType] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [Lob]          INT          NULL,
    [DisplayOrder] INT          NULL,
    [Code]         VARCHAR (5)  NULL,
    [Description]  VARCHAR (50) NULL,
    [Active]       BIT          NULL,
    CONSTRAINT [PK_VisionType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

