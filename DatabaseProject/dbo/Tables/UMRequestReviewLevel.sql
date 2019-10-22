CREATE TABLE [dbo].[UMRequestReviewLevel] (
    [Id]          INT              IDENTITY (1, 1) NOT NULL,
    [UMRequestId] UNIQUEIDENTIFIER NULL,
    [PrecertId]   INT              NULL,
    [ReviewLevel] INT              NULL,
    [DateCreated] DATETIME         NULL,
    [CreatedBy]   UNIQUEIDENTIFIER NULL
);

