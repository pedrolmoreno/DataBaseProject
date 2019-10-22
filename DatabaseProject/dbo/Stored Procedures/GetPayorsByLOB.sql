
CREATE PROCEDURE [dbo].[GetPayorsByLOB] (
	@location_id	int,
	@plob		varchar(10) )
AS

declare @location	int


SELECT DISTINCT GRP.PAYOR_ID ID,payor.name
 FROM prov_status
 INNER JOIN Grp_Product ON Grp_Product.Product_ID = PROV_STATUS.PROVIDER_PRODUCT AND PROV_STATUS.EXP_DATE BETWEEN Grp_Product.EFF_DATE AND Grp_Product.EXP_DATE
 INNER JOIN GRP ON GRP.GROUP_NBR = Grp_Product.Group_ID 
 INNER JOIN payorid ON grp.PAYOR_ID  = payorid.payor_id
 INNER JOIN payor ON payor.id=grp.PAYOR_ID 
  WHERE location_id=@location_id  
   AND network_flag='i'
   AND getdate () BETWEEN prov_status.eff_date AND prov_status.exp_date
   AND payorid.code = 'PLOB'
   AND payorid.value = @plob 
 ORDER BY payor.name






