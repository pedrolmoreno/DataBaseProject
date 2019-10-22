-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMemberEligibilityById]
	-- Add the parameters for the stored procedure here
	 @Id int,
	 @EffDate Datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PAT.SUBSCRIBER_ID, PAT.DEPENDENT_SEQ, PAT.ID, PAT.LAST_NAME, PAT.FIRST_NAME,
           PAT.STREET1, PAT.STREET2, PAT.DATE_OF_BIRTH, PAT.SEX, ISNULL(REL.[DESCRIPTION],'SELF') as RELDESC, 
           PAT.CITY, PAT.STATE, PAT.ZIP_CODE, GRP.GROUP_NAME AS PGROUPNAME, PLN.NAME AS PPLANNAME, PLN.PLAN_NBR as PLANID,
           PAT.PHONE, PAT.EFF_DATE,PAT.EXP_DATE, C.[DESCRIPTION] as COUNTY, GRP.GROUP_ID AS PGROUPID
    FROM RPATACCT AS PAT(NOLOCK)
          LEFT JOIN RELATION as REL (NOLOCK) ON REL.CODE = PAT.PAT_REL_TO_INSURED
          LEFT JOIN PLNHIST AS PLNH(NOLOCK) ON PLNH.PAT_ID = PAT.ID AND @EffDate BETWEEN PLNH.EFF_DATE AND PLNH.EXP_DATE
          LEFT JOIN GRP(NOLOCK) ON GRP.GROUP_NBR = PLNH.GROUP_NBR
          LEFT JOIN PLN(NOLOCK) ON PLN.PLAN_NBR = PLNH.PLAN_ID AND PLNH.EFF_DATE BETWEEN PLN.EFF_DATE AND PLN.EXP_DATE
          LEFT JOIN COUNTY AS C ON PAT.COUNTY = C.CODE
    WHERE PAT.ID = @Id AND 
	      @EffDate BETWEEN PAT.EFF_DATE AND 
		  PAT.EXP_DATE
    ORDER BY PAT.LAST_NAME, PAT.FIRST_NAME
END




