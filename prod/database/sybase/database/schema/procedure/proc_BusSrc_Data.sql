 CREATE PROCEDURE proc_BusSrc_Data
/*********************************************************************************************
** Name          : proc_BusSrc_Data
** Author        : CTS - Vivek Barde
** Date          : 01/15/2008
** Purpose          : To extract Business source Information for LOANSPAN TAHOE Project
Proj will be called from LOANSPAN
**Modify By   : Vivek Barde CTS On  02/29/2008 To Add the IsNullcheck 
**Modify By   : Vivek Barde CTS On  03/03/2008 To Add Convert the Return values
*********************************************************************************************/
AS
       -- Retrieve the BusCrc Information Information
     SELECT convert(Varchar, ClassNum) ,
           ClassDesc,
          convert(varchar,BgnEffDate,110),
          convert(varchar,EndEffDate,110),
          IsNull(BusSrcClass,'PLS')
        FROM Classification
        Where ClassGrpIDNum = 3 And ClassNum is Not Null

IF @@error != 0
    RETURN -1 -- NON FATAL ERROR

/* Success */
RETURN 0
go


EXEC sp_procxmode 'dbo.proc_BusSrc_Data','unchained'
go
IF OBJECT_ID('dbo.proc_BusSrc_Data') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE dbo.proc_BusSrc_Data >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE dbo.proc_BusSrc_Data >>>'
go
GRANT EXECUTE ON dbo.proc_BusSrc_Data TO CCRRole
go
GRANT EXECUTE ON dbo.proc_BusSrc_Data TO public
go
