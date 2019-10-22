CREATE TABLE [dbo].[UserRegistration] (
    [UserId]     UNIQUEIDENTIFIER NOT NULL,
    [LobId]      INT              NULL,
    [VendorId]   INT              NULL,
    [LocationId] INT              NULL,
    CONSTRAINT [PK_UserRegistration] PRIMARY KEY CLUSTERED ([UserId] ASC) WITH (FILLFACTOR = 90)
);

