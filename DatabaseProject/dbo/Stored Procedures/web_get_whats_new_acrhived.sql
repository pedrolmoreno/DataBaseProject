
CREATE PROCEDURE [dbo].[web_get_whats_new_acrhived] (
	@location_id	int,
	@lob_id		int,
	@plob		varchar(10),
	@max_items	int,
	@archivetype int)
AS

declare @location	int


CREATE TABLE #Payors(ID int)
CREATE TABLE #WhatsNew(	whats_new_id int,
			eff_date datetime NULL ,
			story_name varchar (100) NULL ,
			file_name varchar (100) NULL,
			priority int,
			totalnewcount int
			)

SELECT @location=locsvc_id FROM locsvc_id WHERE value=@location_id AND code='tpx'

INSERT INTO #Payors 

	SELECT DISTINCT prov_status.provider_product ID
		FROM prov_status
		INNER JOIN Grp_Product ON Grp_Product.Product_ID = PROV_STATUS.PROVIDER_PRODUCT AND PROV_STATUS.EXP_DATE BETWEEN Grp_Product.EFF_DATE AND Grp_Product.EXP_DATE
		INNER JOIN GRP ON GRP.GROUP_NBR = Grp_Product.Group_ID 
		INNER JOIN payor_id ON prov_status.provider_product = payor_id.payor_id
		INNER JOIN payor ON payor.id=grp.PAYOR_ID 
			WHERE --payor.id=prov_status.provider_product
				--AND 
				location_id=@location
				AND network_flag='i'
				AND getdate () BETWEEN prov_status.eff_date AND prov_status.exp_date
				--AND prov_status.provider_product = payor_id.payor_id
				AND payor_id.code = 'PLOB'
				AND payor_id.value = @plob
		ORDER BY ID

INSERT INTO #WhatsNew
	SELECT whats_new_id, eff_date, story_name, file_name, priority, 0 AS totalnewcount FROM web_whats_new_pic WHERE providerresource_flag=@archivetype AND archived_flag = 1 AND (all_flag = 1 OR (lob_id = @lob_id AND multiple_payor_flag = 0 AND location_flag = 0));

INSERT INTO #WhatsNew
	SELECT DISTINCT web_whats_new_pic.whats_new_id whats_new_id, eff_date, story_name, file_name, priority, 0 AS totalnewcount FROM web_whats_new_pic, web_whats_new_payor, #Payors
	WHERE 
	providerresource_flag=@archivetype AND archived_flag = 1
	AND lob_id = @lob_id
	AND multiple_payor_flag = 1
	AND web_whats_new_payor.payor_id = #Payors.ID
	AND web_whats_new_pic.whats_new_id = web_whats_new_payor.whats_new_id

INSERT INTO #WhatsNew
	SELECT DISTINCT web_whats_new_pic.whats_new_id whats_new_id, eff_date, story_name, file_name, priority, 0 AS totalnewcount FROM web_whats_new_pic, web_whats_new_location
	WHERE 
	providerresource_flag=@archivetype AND archived_flag = 1
	AND location_id = @location_id
	AND location_flag = 1
	AND web_whats_new_pic.whats_new_id = web_whats_new_location.whats_new_id

DECLARE @totalrows INT
SET @totalrows=(SELECT COUNT(*) FROM #WhatsNew)
UPDATE #WhatsNew SET totalnewcount=@totalrows

SET ROWCOUNT @max_items
SELECT * FROM #WhatsNew ORDER BY priority DESC, eff_date DESC

DROP TABLE #Payors
DROP TABLE #WhatsNew



