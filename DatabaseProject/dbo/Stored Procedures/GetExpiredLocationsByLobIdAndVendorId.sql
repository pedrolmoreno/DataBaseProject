-- =============================================
-- Author:		Dariana Contreras
-- Create date: 11/20/2018
-- Description:	Get expired locations by LOB and Vendor (WP-823)
-- =============================================

CREATE PROCEDURE [dbo].[GetExpiredLocationsByLobIdAndVendorId] 
	@LOBID			INT,
	@VendorID		INT
AS
BEGIN

	    SET NOCOUNT ON;

		-- GET EXPIRED LOCATIONS
		SELECT DISTINCT  L.LOCSVC_ID,'['+CAST(ID AS VARCHAR(12))+'] '+LN.Name+' - '+Street1 AS NAME,L.VALUE as TaxId
		
		FROM 
			LOCSVC_ID L INNER JOIN LOCSVC LN ON L.LOCSVC_ID=LN.ID
		WHERE 
			L.LOCSVC_ID IN (
			SELECT DISTINCT LS.LOCSVC_ID
			FROM VENDOR V 
			INNER JOIN LOCSVC_ID LS ON V.TAX_ID=LS.VALUE AND LS.CODE='LTID' 
			 AND GETDATE() >  LS.EXP_DATE
			INNER JOIN LOCSVC_ID LOB ON LOB.CODE='LOB' AND LS.LOCSVC_ID=LOB.LOCSVC_ID  AND GETDATE() > LOB.EXP_DATE
			WHERE LOB.VALUE= @LOBID AND V.ID=  @VendorID )  
			 AND GETDATE() > L.EXP_DATE
		ORDER BY
			Name

END

