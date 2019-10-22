CREATE Procedure [dbo].[ClaimStatusSearch](
	    @subscriber_id		varchar(50),
		@dep_seq_id			int,
		@auth_no			varchar(50),
		@search_method		int,
		@loc_id			int)
		

AS

--
/******************************************************************************************************
-- 20161018: SP New version
*******************************************************************************************************/

SET NOCOUNT ON

--
/******************************************************************************************************
-- LOCAL VARIABLES
--
*******************************************************************************************************/

declare	@MEMBER_THESYS_ID	INT
declare @dos			datetime
declare @claim_id		varchar(25)
declare @auth_no2		varchar(50)
declare @member_f_name		varchar(75)
declare @member_l_name		varchar(75)
 
  
 
DECLARE @RETURN_TABLE TABLE(
		CLAIM_ID		INT,
		dos			datetime,
		MEMBER_f_NAME		varchar(100),
		member_l_name		varchar(100),
		auth_no2			varchar(100),
		sub_id			varchar(100))


 -- Search By Subscriber Id and Dependent Sequence
if @search_method =0
begin
insert into @return_table
select distinct hcfa_claim.claim_id, hcfa_claim.dos,rpatacct.first_name,rpatacct.last_name,hcfa_claim.prior_auth_number,subscriber_id  
 from hcfa_claim  
inner join rpatacct on rpatacct.id=hcfa_claim.pat_id and dos between eff_date and exp_date
where subscriber_id=@subscriber_id and dependent_seq=@dep_seq_id and dos > (getdate()-365) 
and hcfa_claim.locsvc_id=@loc_id 

goto theexit

end

-- Search By Authorization Number
if @search_method=1
begin 
insert into @return_table
select distinct hcfa_claim.claim_id, hcfa_claim.dos,rpatacct.first_name,rpatacct.last_name,hcfa_claim.prior_auth_number,subscriber_id  
 from hcfa_claim  
inner join rpatacct on rpatacct.id=hcfa_claim.pat_id and dos between eff_date and exp_date
where prior_auth_number=@auth_no and dos > (getdate()-365)
and hcfa_claim.locsvc_id=@loc_id 
goto theexit

end
          
 
SENDERROR:
GOTO THEEXIT

THEEXIT:
 
SELECT * FROM @RETURN_TABLE  



