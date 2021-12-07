IF OBJECT_ID('dbo.SP_FA_Update') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.SP_FA_Update
    IF OBJECT_ID('dbo.SP_FA_Update') IS NOT NULL
        PRINT '<<< FAILED DROPPING PROCEDURE dbo.SP_FA_Update >>>'
    ELSE
        PRINT '<<< DROPPED PROCEDURE dbo.SP_FA_Update >>>'
END
go



CREATE PROCEDURE dbo.SP_FA_Update
   @ret varchar(100) out

AS

/********************************************************************************************
Name 	: SP_FA_Update
Author	: Vivek Barde
Created On	: 09/09/2005
Input	:
Output	: Error Mesaage
Tables 	:
Accessed	: tempdb..FATemp,FAInfo,FARole,ManagerDownload
Purpose	: To pass Financial Advisor info from FATemp table to FAInfo table and FARole
Version	: 225
Modified By	: Cognizant 
Modified On	:10/19/2005
Modified : Eliminated the duplicate record entry into FAInfo table MR 225 T05059

Modified By	: Cognizant 
Modified On	:10/20/2005
Modified : Added Commente -MR 225 T05059

Modified By	: Cognizant 
Modified On	:11/03/2005
Modified : Replaced FATEMP.PhoneNbr and FaxNbr with substring(a.PhoneNbr,4,3)  + substring(a.PhoneNbr,8,3) +  substring(a.PhoneNbr,12,4) and 
           substring(a.FaxNbr,4,3)  + substring(a.FaxNbr,8,3) +  substring(a.FaxNbr,12,4)
           in all the places
           
Modified By	: Cognizant 
Modified On	:12/06/2005 - MR 225 T05059
Modified : The size fof FAX nbr and Phone NBR is increased since SCWHAB may send |+001(901)752-7005.Need to clean and store it like
              '9017527005'              

Modified By	:Cognizant 
Modified On	:01/18/2005 - MR 235 T05059
Modified :     Swapping the beta to Employee id and Employee id to BETA id in all the places.
********************************************************************************************/


Begin
    IF OBJECT_ID('tempdb.guest.FATemp') IS  NULL
    Begin
       Select @ret ='tempdb..FATemp table not found '
       Return (-1)
    END


--Before Proceeding Clean up if FAX nbr and Phone Nbr is greater than
-- 15 characters  - Take the 14 char from the right and add + to it.
-- Proceeding SQL will take care of the rest
-- Cognizant - T05059 - Rel 235 From here - 12/06/2005

       Update tempdb.guest.FATemp
        Set FaxNbr = '+' + Right(FaxNbr,14 )
        where DATALENGTH(FaxNbr) > 15
           If @@error != 0
            Begin
              select  @ret = 'Error In Updating Update tempdb.guest.FATemp -1 ' 
              rollback
              Return (-1)
            End
        
       Update tempdb.guest.FATemp
        Set PhoneNbr = '+' + Right(PhoneNbr,14 )
        where DATALENGTH(PhoneNbr) > 15
           If @@error != 0
            Begin
              select  @ret = 'Error In Updating Update tempdb.guest.FATemp -2 ' 
              rollback
              Return (-1)
            End

-- Cognizant - T05059 - Rel 235 Till here - 12/06/2005

     Declare @s_EmployeeId char(30)  ,
             @s_BetaID     char(10) ,
             @s_Name       char(100) ,
             @s_PhoneNbr   char(10)  ,
             @s_FaxNbr     char(10)  ,
             @s_EmailId    char(45)  ,
             @s_BranchCode char(45)  ,
             @s_BranchName char(45)  ,
             @i_StateIdNum char(2),
             @rowcount int,
             @FinAdvIDNum int,
             @s_GrpID char(3)
    --Update existing FA
    --Replaced Phone number with substring(PhoneNbr,4,3)  + substring(PhoneNbr,8,3) +  substring(PhoneNbr,12,4)
    --Replaced Fax number with substring(FaxNbr,4,3)  + substring(FaxNbr,8,3) +  substring(FaxNbr,12,4)    
    -- 11/04/2005 -Cognizant , T05059
    --Changed a.EmployeeID to a.BetaID in the below UPDATE
    --Rel 235 -Cognizant ,1/18/2006
     Update FAInfo
     Set FAName =  a.Name,
        FAPhoneNbr = substring(a.PhoneNbr,4,3)  + substring(a.PhoneNbr,8,3) +  substring(a.PhoneNbr,12,4),
        FAFaxNbr = substring(a.FaxNbr,4,3)  + substring(a.FaxNbr,8,3) +  substring(a.FaxNbr,12,4),
        FAEmailID = a.EmailID,
        FAState  = a.State,
        BranchCd = a.BranchCode,
        BranchName = a.BranchName,
        SourceGrpCd = a.GrpID
     From tempdb.guest.FATemp a,FAInfo
     Where a.BetaID = FAInfo.FAEmployeeID
     If @@error != 0
       Begin
         select  @ret = 'Error In Updating FAInfo Table 1 ' 
         rollback
         Return (-1)
       End

     --10/19/2005 - Cognizant , included this from here  MR 225 T05059
 /*   Update FARole
    Set FAIDNum = b.FAIDNum,
        FARoleID = a.BetaID
    From FARole b ,tempdb.guest.FATemp a,FAInfo c
    Where a.EmployeeID = c.FAEmployeeID
    And   b.FAIDNum = c.FAIDNum */
    
--Changed A.BetaID to  A.EmployeeID in the below SQL
--T05059 - Cognizant , 1/18/2006
       Insert into FARole (FAIDNum,FARoleID)
       (Select B.FAIDNum,A.EmployeeID
        From FARole B ,tempdb.guest.FATemp A,FAInfo c
        Where A.BetaID = c.FAEmployeeID
        and  c.SourceGrpCd = A.GrpID
        And   B.FAIDNum = c.FAIDNum
        And  A.EmployeeID not in (Select FARoleID From FARole d Where d.FAIDNum = c.FAIDNum))
                   
       If @@error != 0
       Begin
         Select @ret = 'Error while Inserting FARole 1 ' 
         Return (-1)
       End

     --10/19/2005 - Cognizant , included this TILL here     
     
     --NEW FA
     -- 11/04/2005 - REl 225 T05059 REplaced PhoneBr and Faxnbr with 
     --  substring(a.PhoneNbr,4,3)  + substring(a.PhoneNbr,8,3) +  substring(a.PhoneNbr,12,4), substring(a.FaxNbr,4,3)  + substring(a.FaxNbr,8,3) +  substring(a.FaxNbr,12,4),
     Declare fin_adv Cursor For
     select a.EmployeeID, a.BetaID,     a.Name,      substring(a.PhoneNbr,4,3)  + substring(a.PhoneNbr,8,3) +  substring(a.PhoneNbr,12,4), substring(a.FaxNbr,4,3)  + substring(a.FaxNbr,8,3) +  substring(a.FaxNbr,12,4),
               a.EmailID,    a.BranchCode, a.BranchName,a.State ,a.GrpID
     From tempdb.guest.FATemp a
     Where a.BetaID not in (Select FAEmployeeID From FAInfo)

     open fin_adv

     Fetch fin_adv into @s_EmployeeId,  @s_BetaID,      @s_Name,      @s_PhoneNbr,@s_FaxNbr,
                    @s_EmailId,     @s_BranchCode, @s_BranchName,@i_StateIdNum ,@s_GrpID

     While (@@sqlstatus = 0)
     Begin   -- NEW FA
       IF @s_BetaID is not Null And @s_EmployeeId is not null And @s_Name is Not Null And @s_GrpID is Not Null
       Begin
     --     Print 'Loop ' + @s_EmployeeId + @s_BetaID
     -- 10/20/2005 T05059 MR 225 , Cognizant , Added Group Source id to eliminate duplicate entry 
     --01/18/2006 -Cognizant , T05059 Changed @s_EmployeeId to @s_BetaID -REL 235
               IF (Select count(*) From FAInfo 
                        where FAEmployeeID = @s_BetaID and 
                                SourceGrpCd = @s_GrpID ) = 0
              Begin                       
                exec  @FinAdvIDNum = dbo.get_next_uniqidnum 'FinAdv'
                IF @FinAdvIDNum is Null Or @@error != 0
                Begin
                        Select   @ret = 'FinAdv Uniq number is null'
                        rollback
                        Return (-1)
                END
                --Changed the @s_employeeID to @s_BetaID 
                -- T05059 - Cognizant , 1/18/2006 - Rel 235
                Insert Into FAInfo
                    (FAIDNum,  FAEmployeeID,  FAName,  FAPhoneNbr,  FAFaxNbr,
                    FAEmailID,    BranchCd,BranchName ,FAState ,SourceGrpCd)
                    Values 
                    (@FinAdvIDNum,@s_BetaID, @s_Name,@s_PhoneNbr,@s_FaxNbr,
                     @s_EmailId,@s_BranchCode,@s_BranchName,@i_StateIdNum,@s_GrpID)
               END

                IF @@error != 0
                    Begin
                      Select @ret = 'Error while Inserting FA 2' + @s_BetaID
                      Rollback
                      Return (-1)
                     End

                BEGIN
         --10/20/2005 -Cognizant - Added conditional logic to if record exists in FARole 
         -- table and then if no record exists , inserting into FARole table
         --Swapped the column @s_betaID to @s_EmployeeId -Cognizant 1/18/2006 -REL 235
         --in the both SQL below
                   IF (Select count(*) From FARole 
                        where FAIDNum = @FinAdvIDNum 
                        And   FARoleID = @s_EmployeeId) = 0
                   Begin
                       Insert into FARole (FAIDNum,FARoleID)
                        Values (@FinAdvIDNum,@s_EmployeeId)
                       If @@error != 0
                       Begin
                         Select @ret = 'Error while Inserting FARole 2 ' + @s_EmployeeId
                         Return (-1)
                       End
                    END
                END
             Print @s_EmployeeId 
        END --Null Value check
     Fetch fin_adv into @s_EmployeeId,  @s_BetaID,      @s_Name,      @s_PhoneNbr,@s_FaxNbr,
                        @s_EmailId,     @s_BranchCode,@s_BranchName, @i_StateIdNum ,@s_GrpID
     End    -- While Loop

 -- Added SELECT distinct to avoid duplicate inserts into ManagerDownload for UPDCCR
 -- 10/20/2005 - T05059 
      Insert Into ManagerDownload(PersIDNum,    UserCrtd,   DateCrtd, CASHUpdtInd,
       CASHUpdtTS,SysProcessTS, CCRUpdtInd, CCRUpdtTS,PHHORCEUpdtInd, PHHORCEUpdtTS )
      Select distinct b.FAIDNum,user_name(),  GETDATE(), 'N',         null,
             null,           'N',          null,      'N',       null
      From tempdb.guest.FATemp a,FAInfo b
      Where a.BetaID = b.FAEmployeeID
      And b.FAIDNum not in (Select c.PersIDNum From ManagerDownload c
                            Where c.PersIDNum = b.FAIDNum
                            And CASHUpdtInd = 'N'
                            And PHHORCEUpdtInd = 'N' )
END
  --End Proc 11

go
IF OBJECT_ID('dbo.SP_FA_Update') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE dbo.SP_FA_Update >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE dbo.SP_FA_Update >>>'
go
EXEC sp_procxmode 'dbo.SP_FA_Update','unchained'
go
GRANT EXECUTE ON dbo.SP_FA_Update TO CCRReadRole
go
GRANT EXECUTE ON dbo.SP_FA_Update TO CCRRole
go
