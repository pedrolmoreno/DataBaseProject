CREATE TABLE [dbo].[LensOrderStatus] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [AccountNumber] INT          NULL,
    [DateIn]        DATE         NULL,
    [PatientName]   VARCHAR (20) NULL,
    [InvoiceNumber] INT          NULL,
    [MaterialCode]  VARCHAR (3)  NULL,
    [TrayNumber]    INT          NULL,
    [Status]        VARCHAR (15) NULL,
    [Date]          DATE         NULL,
    [Time]          TIME (7)     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

