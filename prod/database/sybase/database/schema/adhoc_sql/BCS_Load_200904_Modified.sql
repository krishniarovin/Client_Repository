/***************NRT BCS Load for April 2009************************/
insert into dbo.OfficeBCS
 ( OfficeIDNum,  YearMonth,  BCS,  BCSYTD)
 SELECT o.OfficeIDNum, i.YearMonth, round(convert(numeric(7,3),i.BCS),0),
        round(convert(numeric(7,3),i.BCSYTD),0)
 FROM dbo.Office o, tempdb.guest.BCSLoad i
 WHERE i.FranchiseNum = o.FranchiseNum
     and i.YearMonth = 200904
     and not exists (select 1 from dbo.OfficeBCS
     where OfficeIDNum = o.OfficeIDNum and YearMonth = 200904)
go

exec dbo.proc_AMCP_ClientAndAcctMgrCalc 2009, 04
go

exec dbo.proc_AMCP_ClientAndAcctMgrCalc 2009, 05
go