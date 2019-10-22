-- =============================================
-- Author:		Renier Serven
-- Create date: 2/27/2018
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[FindContactLensProducts] 
	@ManId nvarchar(300),
    @PrdId nvarchar(300),
    @PrdColor nvarchar(300),
    @PrfBaseCurveOD nvarchar(300),
	@PrfBaseCurveOS nvarchar(300),
    @PrfDiameterOD nvarchar(300),
	@PrfDiameterOS nvarchar(300),
    @PrdAdditionOD nvarchar(300),
	@PrdAdditionOS nvarchar(300),
    @PrdAxisOD nvarchar(300),
	@PrdAxisOS nvarchar(300),
    @PrdCylinderOD nvarchar(300),
	@PrdCylinderOS nvarchar(300),
    @PrdPowerOD nvarchar(300),
	@PrdPowerOS nvarchar(300)
AS
BEGIN

DECLARE @sqLQuery VARCHAR(MAX)
    Declare @AnswersTempTable Table
    (  
	   [Row] bigint,
       ManId nvarchar(300),
	   ManName nvarchar(300),
       PrdId nvarchar(300),
	   PrdDescription nvarchar(300),
	   PrdColor nvarchar(300),
       PrfBaseCurve nvarchar(300),
       PrfDiameter nvarchar(300),
       PrdAddition nvarchar(300),
       PrdAxis nvarchar(300),
       PrdCylinder nvarchar(300),
	   PrdPower nvarchar(300),
	   PrdColorId nvarchar(300)
    )

	SET NOCOUNT ON;

	 Set @sqlQuery ='SELECT [Row], ManId, ManName, PrdId, PrdDescription, PrdColor, PrfBaseCurve, PrfDiameter, PrdAddition, PrdAxis, PrdCylinder, PrdPower, PrdColorId from  XmlCatalogProducts WHERE '
	 
	 --ManId
	 IF NOT (@ManId is null or @ManId = '')
	 BEGIN
		Set @sqlQuery=  @sqlQuery+'ManId='''+@ManId+''''
	 END
	 ELSE
	 BEGIN
		Set @sqlQuery=  @sqlQuery+CONCAT('ManId like ''', '%%''')
	 END

	 --PrdId
	 IF NOT (@PrdId is null or @PrdId = '')
	 BEGIN
	 Set @sqlQuery=  @sqlQuery+' and PrdId='''+@PrdId+''''
	 END

	  --PrdColor
	 IF NOT (@PrdColor is null or @PrdColor = '')
	 BEGIN
	 Set @sqlQuery=  @sqlQuery+' and PrdColor='''+@PrdColor+''''
	 END

	 --PrfBaseCurve
	 IF NOT (@PrfBaseCurveOD is null or @PrfBaseCurveOD = '')
	 BEGIN
		 IF(@PrfBaseCurveOS is null or @PrfBaseCurveOS = '')
		 BEGIN
			SET @PrfBaseCurveOS=@PrfBaseCurveOD
		 END
	 SET @sqlQuery=  @sqlQuery+' and PrfBaseCurve between '''+ @PrfBaseCurveOD +''' and '''+ @PrfBaseCurveOS +''''
	 END

	 --PrfDiameter
	 IF NOT (@PrfDiameterOD is null or @PrfDiameterOD = '')
	 BEGIN
		 IF(@PrfDiameterOS is null or @PrfDiameterOS = '')
		 BEGIN
			SET @PrfDiameterOS=@PrfDiameterOD
		 END
	 SET @sqlQuery=  @sqlQuery+' and PrfDiameter between '''+ @PrfDiameterOD +''' and '''+ @PrfDiameterOS +''''
	 END

	 --PrdAddition
	 IF NOT (@PrdAdditionOD is null or @PrdAdditionOD = '')
	 BEGIN
		 IF(@PrdAdditionOS is null or @PrdAdditionOS = '')
		 BEGIN
			SET @PrdAdditionOS=@PrdAdditionOD
		 END
	 SET @sqlQuery=  @sqlQuery+' and PrdAddition between '''+ @PrdAdditionOD +''' and '''+ @PrdAdditionOS +''''
	 END

	  --PrdAxis
	 IF NOT (@PrdAxisOD is null or @PrdAxisOD = '')
	 BEGIN
		 IF(@PrdAxisOS is null or @PrdAxisOS = '')
		 BEGIN
			SET @PrdAxisOS=@PrdAxisOD
		 END
	 SET @sqlQuery=  @sqlQuery+' and PrdAxis between '''+ @PrdAxisOD +''' and '''+ @PrdAxisOS +''''
	 END

	   --PrdCylinder
	 IF NOT (@PrdCylinderOD is null or @PrdCylinderOD = '')
	 BEGIN
		 IF(@PrdCylinderOS is null or @PrdCylinderOS = '')
		 BEGIN
			SET @PrdCylinderOS=@PrdCylinderOD
		 END
	 SET @sqlQuery=  @sqlQuery+' and PrdCylinder between '''+ @PrdCylinderOD +''' and '''+ @PrdCylinderOS +''''
	 END

	   --PrdPower
	 IF NOT (@PrdPowerOD is null or @PrdPowerOD = '')
	 BEGIN
		 IF(@PrdPowerOS is null or @PrdPowerOS = '')
		 BEGIN
			SET @PrdPowerOS=@PrdPowerOD
		 END
	 SET @sqlQuery=  @sqlQuery+' and PrdPower between '''+ @PrdPowerOD +''' and '''+ @PrdPowerOS +''''
	 END

	 Insert into @AnswersTempTable
     exec (@sqlQuery)
     select * from @AnswersTempTable

	 select @sqlQuery

END

