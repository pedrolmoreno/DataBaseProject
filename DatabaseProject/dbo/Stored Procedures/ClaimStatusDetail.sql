

Create Procedure [dbo].[ClaimStatusDetail](
	        @CLAIM_ID			INT)
		

AS


SET NOCOUNT ON

--
/******************************************************************************************************
-- LOCAL VARIABLES
--
*******************************************************************************************************/
declare @dos			datetime
declare	@cpt			varchar(5)
declare @cpt_desc		varchar(100)
declare	@charge_amt		money
declare	@plan_allowed		money
declare	@mat_copay		money
declare	@allowance_allowed	money
declare @exam_copay		money
declare	@amount_paid		money
declare	@except_code		varchar(5)
declare	@exception_desc		varchar(100)

--
/*****************************************************************************************************
-- 
--
******************************************************************************************************/
declare @return_table table(
	dos		datetime,
	cpt		varchar(5),
	cpt_desc	varchar(100),
	charge_amt	money,
	plan_allowed	money,
	mat_copay	money,
	allowance_allowed	money,
	exam_copay	money,
	amount_paid	money,
	except_code	varchar(5),
	exception_desc	varchar(100)
)


insert into @return_table
select dbo.barry_justthedate(service_from_date),
	procedure_code,
	cpt.description,
	line_charge_amount,
	accepted_amount,
	(select repricing.plan_allowed from repricing where @claim_id=repricing.claim_id and hcfa_line.line=repricing.line_no),
	(select repricing.oop_allowed from repricing where @claim_id=repricing.claim_id and hcfa_line.line=repricing.line_no),
	copay_applied_amount,
	amount_paid,
	exception_code_01, 
	(select ACTCODE.description from actcode where code=exception_code_01)
from hcfa_line
--left join repricing on repricing.claim_id=hcfa_line.claim_id and repricing.line_no=hcfa_line.line 
--right join actcode on actcode.code=hcfa_line.shad_exception_code_01
left join cpt on cpt.code=hcfa_line.procedure_code
where hcfa_line.claim_id=@claim_id

goto theexit
             
 
SENDERROR:
GOTO THEEXIT

THEEXIT:
 
SELECT * FROM @RETURN_TABLE  


