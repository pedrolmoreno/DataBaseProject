CREATE VIEW [dbo].[XmlCatalogProducts]
AS
SELECT         ROW_NUMBER() OVER (ORDER BY ManId ASC) AS Row, dbo.XmlCatalogManufacturer.ManId, dbo.XmlCatalogManufacturer.ManName, dbo.XmlCatalogProduct.PrdId, dbo.XmlCatalogProduct.PrdDescription, dbo.XmlCatalogProduct.PrdColor, 
                         dbo.XmlCatalogProductFamily.PrfBaseCurve, dbo.XmlCatalogProductFamily.PrfDiameter, dbo.XmlCatalogProduct.PrdAddition, dbo.XmlCatalogProduct.PrdAxis, dbo.XmlCatalogProduct.PrdCylinder, 
                         dbo.XmlCatalogProduct.PrdPower, dbo.XmlCatalogProduct.PrdColorId
FROM            dbo.XmlCatalogManufacturer INNER JOIN
                         dbo.XmlCatalogSerie ON dbo.XmlCatalogManufacturer.Id = dbo.XmlCatalogSerie.XmlCatalogManufacturerId INNER JOIN
                         dbo.XmlCatalogProductFamily ON dbo.XmlCatalogSerie.Id = dbo.XmlCatalogProductFamily.XmlCatalogSerieId INNER JOIN
                         dbo.XmlCatalogProduct ON dbo.XmlCatalogProductFamily.Id = dbo.XmlCatalogProduct.XmlCatalogProductFamilyId


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "XmlCatalogManufacturer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "XmlCatalogSerie"
            Begin Extent = 
               Top = 6
               Left = 255
               Bottom = 136
               Right = 488
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "XmlCatalogProductFamily"
            Begin Extent = 
               Top = 6
               Left = 526
               Bottom = 136
               Right = 712
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "XmlCatalogProduct"
            Begin Extent = 
               Top = 6
               Left = 750
               Bottom = 136
               Right = 988
            End
            DisplayFlags = 280
            TopColumn = 13
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'XmlCatalogProducts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'XmlCatalogProducts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'XmlCatalogProducts';

