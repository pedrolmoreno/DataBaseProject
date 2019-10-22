
CREATE view [dbo].[COAMonthToDate]

as
	

with months (date)
   as (select cast(cast(datepart(yy, getdate()) as char(4))+'-01-01' as date)
      	union all
      	select cast(dateadd(month, 1, date) as date)
      	from months
      	where dateadd(month, 1, date)<=getdate()
	)
select convert(varchar(7), date, 126) CoaMonth,
         format(date, 'MMM yyyy', 'en-us') MonthText, 
         cast(dateadd(month, datediff(month, 0, date), 0) as datetime) startofmonth,
         cast(eomonth(date) as datetime) endofmonth

from months



