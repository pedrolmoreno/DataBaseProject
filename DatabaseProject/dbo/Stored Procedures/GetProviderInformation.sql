-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProviderInformation] 
	-- Add the parameters for the stored procedure here
	@providerId INT,
	@locId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PR.FIRST_NAME,
	       PR.LAST_NAME,
		   ISNULL(PR.MIDDLE_NAME,' ') as MIDDLE_NAME,
		   PR.DEGREE_CODE,PID.Value as Prov_License,
		   (select top 1 Value from prov_id where code='XX' and provider_id = @providerId) as NPI,
		   (select top 1 Value from LOCSVC_ID where code='ltid' and locsvc_id = @locId) as TIN,
		   (select taxonomy_code from Specialty 
		         where code in (select Specialty from PROVIDER where Id = @providerId) ) as taxonomy_code
    FROM PROVIDER PR left join Prov_Id PID on PID.Provider_Id=PR.Id and PID.Code='0B' AND GETDATE() BETWEEN PID.EFF_DATE AND PID.EXP_DATE
    WHERE PR.ID = @providerId AND GETDATE() BETWEEN PR.EFF_DATE AND PR.EXP_DATE
END


