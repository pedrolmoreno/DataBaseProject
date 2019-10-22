
Create PROCEDURE [dbo].[GetUMAuthProcedure]
	@precert_id	INT
AS
BEGIN
	
--
/******************************************************************************************************
-- WEB AUTHORIZATION REPORT
*******************************************************************************************************/

SET NOCOUNT ON

 
DECLARE @RETURN_TABLE TABLE(
	EFF_DATE	DATETIME,
	EXP_DATE	DATETIME,
	CODE		VARCHAR(100),
	Description	VARCHAR(500))

--
/*****************************************************************************************************
--  GET DETAIL DATA FOR PROCEDURE CODE AND DESCRIPTION FOR AUTHORIZATION
******************************************************************************************************/

INSERT INTO @RETURN_TABLE
SELECT 
	CONVERT(VARCHAR(10),CPT.Eff_DATE,101) AS EFF_DATE, CONVERT(VARCHAR(10),CPT.Exp_DATE,101) AS EXP_DATE, 
	PP.CODE, CPT.Description
FROM 
	precertp PP INNER JOIN CPT ON PP.CODE=CPT.Code 
WHERE 
	ID=@precert_id 
ORDER BY PP.SEQ


SELECT * FROM @RETURN_TABLE 
END




