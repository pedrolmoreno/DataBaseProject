


-- =============================================
-- Author:		Dariana Contreras
-- Create date: 11/11/2018
-- Description:	Get expired vendors by LOB (WP-823)
-- =============================================

create PROCEDURE [dbo].[GetExpiredVendorByLobId] 
	-- Add the parameters for the stored procedure here
	@LOBID INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		SELECT DISTINCT 
			V.ID, '['+CAST(VN.ID AS VARCHAR(12))+'] '+VN.Name+' - '+Street1 AS Name,  V.TAX_ID as TaxId
		FROM 
			VENDOR V 
			INNER JOIN LOCSVC_ID LS ON V.TAX_ID=LS.VALUE AND LS.CODE='LTID'  AND V.ID = LS.LOCSVC_ID AND GETDATE() > LS.EXP_DATE
			INNER JOIN LOCSVC_ID LOB ON LOB.CODE='LOB' AND LS.LOCSVC_ID=LOB.LOCSVC_ID AND GETDATE() > LOB.EXP_DATE
			INNER JOIN LOCSVC VN ON VN.ID=V.ID
		WHERE 
			LOB.VALUE=@LOBID 
		ORDER BY 
			Name
END




