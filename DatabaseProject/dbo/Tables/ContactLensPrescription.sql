﻿CREATE TABLE [dbo].[ContactLensPrescription] (
    [Id]                INT           IDENTITY (1, 1) NOT NULL,
    [ClaimId]           INT           NULL,
    [FittingType]       VARCHAR (10)  NULL,
    [SphericalOD]       VARCHAR (5)   NULL,
    [SphericalOS]       VARCHAR (5)   NULL,
    [BaseCurveOD]       VARCHAR (5)   NULL,
    [BaseCurveOS]       VARCHAR (5)   NULL,
    [DiameterOS]        VARCHAR (5)   NULL,
    [DiameterOD]        VARCHAR (5)   NULL,
    [PrismTypeOD]       VARCHAR (5)   NULL,
    [PrismTypeOS]       VARCHAR (5)   NULL,
    [Astigmatism]       BIT           NULL,
    [CylinderOS]        VARCHAR (5)   NULL,
    [CylinderOD]        VARCHAR (5)   NULL,
    [AxisOD]            VARCHAR (5)   NULL,
    [AxisOS]            VARCHAR (5)   NULL,
    [Multifocal]        BIT           NULL,
    [AddPowerOD]        VARCHAR (5)   NULL,
    [AddPowerOS]        VARCHAR (5)   NULL,
    [AddDecentrationOD] VARCHAR (5)   NULL,
    [AddDecentrationOS] VARCHAR (5)   NULL,
    [ProductId]         NVARCHAR (50) NULL,
    [ColorId]           NVARCHAR (50) NULL,
    [Quantity]          INT           NULL,
    [Active]            BIT           CONSTRAINT [DF_ContactLensPrescription_Active] DEFAULT ((1)) NULL,
    [DateCreated]       DATETIME      CONSTRAINT [DF_ContactLensPrescription_DateCreated] DEFAULT (getdate()) NULL,
    [DateUpdated]       DATETIME      CONSTRAINT [DF_ContactLensPrescription_DateUpdated] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_ContactLensPrescription] PRIMARY KEY CLUSTERED ([Id] ASC)
);

