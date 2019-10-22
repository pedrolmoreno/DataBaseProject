CREATE PROCEDURE [dbo].[GetVendorById] 
	-- Add the parameters for the stored procedure here
	@VendorId INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		SELECT  Distinct
			V.ID, '['+CAST(VN.ID AS VARCHAR(12))+'] '+VN.Name as Name
		FROM 
			VENDOR V INNER JOIN LOCSVC_ID LS ON V.TAX_ID=LS.VALUE AND LS.CODE='LTID' AND GETDATE() BETWEEN LS.EFF_DATE AND LS.EXP_DATE
			INNER JOIN LOCSVC VN ON VN.ID=V.ID
		WHERE 
			V.ID= @VendorId
		
END

