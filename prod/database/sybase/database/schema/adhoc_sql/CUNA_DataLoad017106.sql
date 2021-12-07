IF OBJECT_ID('dbo.CUNA_DataLoad01172006') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.CUNA_DataLoad011720066
    IF OBJECT_ID('dbo.CUNA_DataLoad011720066') IS NOT NULL
        PRINT '<<< FAILED DROPPING PROCEDURE dbo.CUNA_DataLoad011720066 >>>'
    ELSE
        PRINT '<<< DROPPED PROCEDURE dbo.CUNA_DataLoad011720066 >>>'
END
go
create Procedure dbo.CUNA_DataLoad01172006
As
Begin -- Main Proc 1

Declare  C_Data Cursor for
Select ClntID,AddrStreetName,AddrZipCd,AddrCityName,State,
        PhoneNumber,FaxNumber,PersFirstName,PersLastName,
        EmailUserName,EmailHostAddress,BusContact,BusContactEffDate,
        BusContactPersIDNum,Column1,Column2
From tempdb..CUNAClientUpload
 
 Declare @s_FranchiseNum   Char(10),
         @i_OfficeIDNum    int,
         @s_AddrStreetNum  char(5),
         @s_AddrStreetName varchar(80),
         @s_AddrZipCd      char(9) ,
         @s_State          varchar(10),
         @i_AddrStateIDNum T_ud_id_num ,
         @s_AddrCityName   varchar(30),
         @s_PhoneNumber    varchar(20) ,
         @s_FaxNumber      varchar(20),
         @s_PersFirstName  varchar(30)  ,
         @s_PersLastName     varchar(30) ,
         @s_PersFullName     varchar(120),
         @s_ClntID         char(7) ,
         @i_OfficeTypeCd   int,
         @s_AddrSuiteAptNum char(5),
         @UniqNum T_ud_id_num,
         @i_CompIDNum T_ud_id_num,
         @i_PhoneIDNum T_ud_id_num,
         @i_1009 char(1),
         @i_1010 Char(1),
         @i_1018 Char(1),
         @pos1 int,@pos2 int,
         @StreetNum char(5),@StreetName char(80),@SuitNum Char(5),@str2 char(90),
         @i_PersIDNum T_ud_id_num,
         @s_EmailUserName varchar(30) ,
         @s_EmailHostAddress Varchar(45) , 
         @s_BusContact Varchar(100) ,
         @d_BusContactEffDate Datetime ,
         @i_BusContactPersIDNum int ,
         @i_AddrIDNum T_ud_id_num,
         @i_ClassIDNum int,
         @i_EmailIDNum T_ud_id_num,
         @s_LegalName Varchar(100),
         @i_County T_ud_id_num,
         @s_AddrPOBoxNum Char(5),
         @s_error Varchar(150),
         @il_cntridnum T_ud_id_num,
         @i_BusSrc1 Varchar(2)
Declare c_Address Cursor For
    Select a.AddrIDNum,ClassIDNum 
    From Address a ,AddressXRef b 
    Where ClntID = @s_ClntID
    And  a.AddrIDNum = b.AddrIDNum 
    And ClassIDNum in (1009,1010,1018)
 
  Begin  --Proc 2
     open C_Data
     --Fetch Statement is Modified By CTS on 01/18/2005
     Fetch C_Data Into @s_ClntID,@s_AddrStreetName,@s_AddrZipCd,@s_AddrCityName,@s_State,
                       @s_PhoneNumber,@s_FaxNumber,@s_PersFirstName,@s_PersLastName,
                       @s_EmailUserName,@s_EmailHostAddress, @s_BusContact,
                       @d_BusContactEffDate, @i_BusContactPersIDNum, @s_LegalName,@i_BusSrc1
    
     While (@@sqlstatus = 0)
     Begin --Begin Loop1 3
	 Print @s_ClntID
      --Modified on 01/17/2005 For New Clients Begin
      IF  ( Select Count(1) 
                  From Client
                  Where ClntID = @s_ClntID)  > 0
       BEGIN
         Select 'Old client'
           Select @i_CompIDNum = CompIDNum
           From Client
           where ClntID = @s_ClntID
		   Select @i_CompIDNum
       END
       ELSE
       BEGIN --New Client
          Select 'New Client ' + @s_ClntID
		  exec @i_CompIDNum = dbo.get_next_uniqidnum 'COMPANY'
		  Select @i_CompIDNum
          IF @i_CompIDNum IS NULL
          Begin 
              Select @s_error = 'NullCompID(L90) At ' + @s_ClntID
              Print @s_error
              Return
          END
          Insert Into Company 
             (CompIDNum,UserCrtd,DateCrtd,UserMdfd,DateMdfd,BgnEffDate,EndEffDate,
             CompLegalName,CompShortName,CompIncorporated)
          Values (@i_CompIDNum,User,Getdate(),User,GetDate(),GetDate(),'12/31/2099',
          @s_LegalName,SubString(@s_LegalName,1,30),'I')
          
		  IF ( @@error <> 0 )
          BEGIN
            Select @s_error = "Error Inserting Company(L95) " + @s_ClntID + ISNULL(Convert(Varchar(10),@i_CompIDNum),'') 
	     	Raiserror 90001 @s_error
		    Return
	      END
         --PHHNAMeInd = 1 For Mortgage Name = "PHH Mortgage" Hard Coded
         Insert Into Client
         (ClntID,       CompIDNum,   UserCrtd,   DateCrtd,   UserMdfd,   DateMdfd,    BgnEffDate,    EndEffDate,
         PHHNameIDNum, ClntConventionalInd ,   ClntFHAInd,  ClntVAInd,    ClntTrustInd,Hmda_Flag)
         Values 
         (@s_ClntID,    @i_CompIDNum, User,     Getdate(),   User,      GetDate(),   GetDate(),      '12/31/2099',
           1,             'Y',                   'N',         'N'        ,'N',           'N')
          IF ( @@error <> 0 )
          BEGIN
          Select @s_error = "Error Inserting New Client(L108) " + @s_ClntID
	     	Raiserror 90001 @s_error 
		    Return
	      END 
          --Modified on 01/18/2005 By CTS Begin For New Contract
         
          exec @il_cntridnum = dbo.get_next_uniqidnum 'CONTRACT'
          
          INSERT INTO Contract 
          (CntrIDNum ,  CompIDNum ,       ClntID ,  TierIDNum ,   BgnEffDate ,    EndEffDate ,
          CntrEffDate ,    CntrExpDate , UserCrtd , DateCrtd ,    UserMdfd ,        DateMdfd )
          Values 
          (@il_cntridnum,@i_CompIDNum ,   @s_ClntID,  1 ,        '01/13/2005',   '12/31/2099',
          '01/13/2005',   '12/31/2099',  User,        Getdate(),   User,             GetDate())
           
          --NEw Business source
           Insert Into BusSrcXRef 
                  (ClassIDNum, ClntID,   UserCrtd, DateCrtd,  BusSrcXClientDesc)
           Values (Convert(Int,@i_BusSrc1), @s_ClntID,USER,     Getdate(),  ' ')
          --  End     
      END       ---New Client Updation End
      Select @i_AddrStateIDNum = AreaIDNum 
      From Area  
      Where AreaCd = @s_State
      
      Select Distinct @i_County = ZipAreaIDNumCounty
	  From AreaZipcodeXRef 
      Where ZipCode = @s_AddrZipCd                            
               --Print '4500 HUGH HOWELL RD, SUITE 240'
               Select @s_AddrStreetNum =  SubString(@s_AddrStreetName,1,Charindex('',@s_AddrStreetName))
               Select @pos1 = Charindex('',@s_AddrStreetName)
               Select @str2 = SubString(@s_AddrStreetName,@pos1+1,Len(@s_AddrStreetName))
               --Select ltrim(@str2) As str2
                --Select @pos2 = Charindex('SUITE',ltrim(@str2))
               --Select @s_AddrStreetName = SubString(@str2,1,@pos2-1) 
               --Select @s_AddrSuiteAptNum = SubString(@str2,@pos2+5,Len(@str2))                           
               Select @i_1009 = 'N'
               Select @i_1010 = 'N'
               Select @i_1018 = 'N' 
               --Address Updation
               Open c_Address
               Fetch c_Address  Into @i_AddrIDNum,@i_ClassIDNum                      
               While (@@sqlstatus = 0)
               Begin --Address Loop
                   IF @i_ClassIDNum = 1009 Or @i_ClassIDNum = 1010 Or @i_ClassIDNum = 1018
                   Begin
                         Update Address
                         Set AddrStreetName = @str2,
                             AddrStreetNum = @s_AddrStreetNum,
                             --AddrSuiteAptNum = @s_AddrSuiteAptNum,
                             AddrCityName = @s_AddrCityName,
                             AddrZipCd = @s_AddrZipCd,
                             AddrStateIDNum = @i_AddrStateIDNum,
                             AddrCountyIDNum = @i_County,
                             AddrCountryIDNum = 65   
                         From Address a ,AddressXRef b
                         Where ClntID = @s_ClntID
                         And a.AddrIDNum =  b.AddrIDNum  
                         And b.ClassIDNum =@i_ClassIDNum
                         And a.AddrIDNum = @i_AddrIDNum
                         IF ( @@error <> 0 )
                          BEGIN
                           Select @s_error  =  "Error Updating Client Address(L156) " + @s_ClntID
                	     	Raiserror 90001 @s_error 
		                    Return
	                      END 
                         IF @i_ClassIDNum = 1009
                         Select @i_1009 = 'Y'
                         IF @i_ClassIDNum = 1010
                         Select @i_1010 = 'Y'
                         IF @i_ClassIDNum = 1018
                         Select @i_1018 = 'Y'
                   END 
                   Fetch c_Address  Into @i_AddrIDNum,@i_ClassIDNum                      
               END --Address Loop     
		close c_Address
               IF @i_1018 = 'N' And @i_1009 = 'N' And @i_1010 = 'N'
               Begin --No row for Billing,Corporate,Mailing Addr
                  exec @UniqNum = dbo.get_next_uniqidnum 'ADDRESS'
				  select @i_AddrIDNum = @UniqNum 
                  IF @UniqNum is Not Null And @i_CompIDNum IS NOT NULL And @s_ClntID IS NOT NULL 
                  Begin  
                  ----Insert Stat Modified
                        Insert Into Address (AddrIDNum ,ClntID ,CompIDNum,AddrStreetNum ,AddrCountryIDNum,AddrCountyIDNum,
                                    AddrStreetName,AddrSuiteAptNum,AddrCityName,AddrZipCd,AddrStateIDNum,UserCrtd,DateCrtd,AddrPOBoxNum,EndEffDate)
                        Values (@i_AddrIDNum,@s_ClntID,@i_CompIDNum,@s_AddrStreetNum,65,@i_County,
                                @s_AddrStreetName,@s_AddrSuiteAptNum,@s_AddrCityName,@s_AddrZipCd,@i_AddrStateIDNum ,user,Getdate(),@s_AddrPOBoxNum, '12/31/2099')                                   
                        IF ( @@error <> 0 )
                        BEGIN
                        Select @s_error =  "Error Inserting New Address for(L183) " + @s_ClntID
	     	                Raiserror 90001 @s_error 
		                    Return
	                    END      
                        -- Corporate 1009                         
                        Insert Into AddressXRef (AddrIDNum,ClassIDNum ,UserCrtd,DateCrtd)
                        Values (@i_AddrIDNum,1009,user,Getdate())   
                        -- 1010 Mailing                
                        Insert Into AddressXRef (AddrIDNum,ClassIDNum ,UserCrtd,DateCrtd)
                        Values (@i_AddrIDNum,1010,user,Getdate())  
                        --1018 Billing                 
                        Insert Into AddressXRef (AddrIDNum,ClassIDNum ,UserCrtd,DateCrtd)
                        Values (@i_AddrIDNum,1018,user,Getdate())                   
                        END
               END --New Addr
               ELSE -- check for individual address
               BEGIN
                    IF @i_1018 = 'N'
                    Begin
                       --1018 Billing                 
                       Insert Into AddressXRef (AddrIDNum,ClassIDNum ,UserCrtd,DateCrtd)
                       Values (@i_AddrIDNum,1018,user,Getdate()) 
                    END      
                         
                    IF @i_1010 = 'N'
                    Begin
                       --1010 Milling                 
                       Insert Into AddressXRef (AddrIDNum,ClassIDNum ,UserCrtd,DateCrtd)
                       Values (@i_AddrIDNum,1010,user,Getdate()) 
                    END   
                    IF @i_1009 = 'N'
                    Begin
                        --1009 Corporate                 
                        Insert Into AddressXRef (AddrIDNum,ClassIDNum ,UserCrtd,DateCrtd)
                        Values (@i_AddrIDNum,1009,user,Getdate()) 
                    END  
             END    --Add Upd Completed
                  Set RowCount 1
               
                   Select @i_PersIDNum = PersIDNum
                   From Person,Client        
                   Where Person.CompIDNum = Client.CompIDNum 
                   And Client.ClntID = @s_ClntID
                   -- IF Person Record is There Update First Record
                   IF (@@rowcount = 1 And @s_PersFirstName IS Not Null And @s_PersLastName IS Not Null)
                   Begin
                           Set Rowcount 0
                        -- Person             
                        Update Person
                        Set PersFirstName = @s_PersFirstName,
                        PersLastName = @s_PersLastName,
                        PersFullName = @s_PersFirstName + ' ' + @s_PersLastName
                        From Person,Client
                        Where Person.CompIDNum = Client.CompIDNum 
                        And Client.ClntID = @s_ClntID
                        And Person.PersIDNum = @i_PersIDNum
                        IF ( @@error <> 0 )
                           BEGIN
                           select @s_error = "Error Updating Person for Client(L241) " + @s_ClntID
	     	                Raiserror 90001 @s_error
		                    Return
	                       END 
                        --1009 corporate Address on Contact Tab
                        IF (Select Count(1)
                            From Contact
                            Where PersIDNum =@i_PersIDNum
                            And ClassIDNum = 1009) = 0
                            Begin
                                Insert Into Contact 
                                    (PersIDNum,AddrIDNum,ClassIDNum)
                                Values (@i_PersIDNum,@i_AddrIDNum,1009)
                            END
                        --1018 Billing address on Contact Tab
                        IF (Select Count(1)
                            From Contact
                            Where PersIDNum =@i_PersIDNum
                            And ClassIDNum = 1018) = 0
                            Begin
                                Insert Into Contact 
                                    (PersIDNum,AddrIDNum,ClassIDNum)
                                Values (@i_PersIDNum,@i_AddrIDNum,1018)
                            END
                       --1039 FYI Address on  Contact Tab
                        IF (Select Count(1)
                            From Contact
                            Where PersIDNum =@i_PersIDNum
                            And ClassIDNum = 1039) = 0
                            Begin
                               Insert Into Contact 
                                    (PersIDNum,AddrIDNum,ClassIDNum)
                                Values (@i_PersIDNum,@i_AddrIDNum,1039)
                            END
                        -- Phone
                        IF Len(@s_PhoneNumber) > 4
                        Begin
                            Update Phone
                            Set    PhoneNumber =  @s_PhoneNumber
                            From Phone, PersonPhoneXRef b  ,
                                 Person p , Client c   
                            WHERE b.PhoneIDNum = Phone.PhoneIDNum  
                            And b.PersIDNum  = p.PersIDNum
                            And c.CompIDNum  = p.CompIDNum 
                            And ClntID = @s_ClntID
                            And ClassIDNum = 1035
                            And p.PersIDNum = @i_PersIDNum 
                           IF ( @@error <> 0 )
                           BEGIN
                            Select @s_error =  "Error Updating Person Phone for Client(L290) " + @s_ClntID
	     	                Raiserror 90001 @s_error 
		                    Return
	                       END 
                            
                           IF (@@rowcount = 0)
                           Begin
                            exec @i_PhoneIDNum = dbo.get_next_uniqidnum 'PHONE'
                            Insert Into Phone 
                                   (PhoneIDNum ,ClassIDNum ,PhoneNumber, PhoneUSFormatInd , EndEffDate)
                            Values( @i_PhoneIDNum,1035,@s_PhoneNumber , '1' , '12/31/2099') 
                            IF ( @@error <> 0 )
                           BEGIN
                           Select @s_error  = "Error Inserting Phone for Client(L302) " + @s_ClntID
	     	                Raiserror 90001 @s_error 
		                    Return
	                       END 
                            
                            Insert Into PersonPhoneXRef
                                   (PersIDNum ,PhoneIDNum)
                            Values (@i_PersIDNum,@i_PhoneIDNum)         
                           END
                       END 
                        -- FAX
                       IF Len(@s_FaxNumber) > 4
                       BEGIN 
                        Update Phone
                        Set    PhoneNumber =  @s_FaxNumber
                        From   Phone, PersonPhoneXRef b  ,
                               Person p , Client c   
                        WHERE b.PhoneIDNum = Phone.PhoneIDNum  
                        And b.PersIDNum  = p.PersIDNum
                        And c.CompIDNum  = p.CompIDNum 
                        And ClntID = @s_ClntID
                        And ClassIDNum = 1036 
                        And p.PersIDNum = @i_PersIDNum
                        IF ( @@error <> 0 )
                        BEGIN
                            Select @s_error =  "Error Updating FAX for Client(L328) " + @s_ClntID
	     	                Raiserror 90001 @s_error 
		                    Return
	                    END 
                        
                        IF (@@rowcount = 0)
                        Begin
                           exec @i_PhoneIDNum = dbo.get_next_uniqidnum 'PHONE'
                           
                           Insert Into Phone 
                                (PhoneIDNum ,ClassIDNum ,PhoneNumber ,PhoneUSFormatInd , EndEffDate)
                           Values( @i_PhoneIDNum,1036,@s_FaxNumber , '1' , '12/31/2099') 
                         IF ( @@error <> 0 )
                         BEGIN
                         Select @s_error =  "Error Insert into Phone for Client(L342) " + @s_ClntID
	     	                Raiserror 90001 @s_error 
		                    Return
	                     END 
                            Insert Into PersonPhoneXRef
                                   (PersIDNum ,PhoneIDNum)
                           Values (@i_PersIDNum,@i_PhoneIDNum)                      
                        END 
                     END --Length 
                     END
                  ELSE  --New Person Hence New Phone and New FAx
                  IF (@@rowcount = 0)
                  Begin
                       Set Rowcount 0 
                
                   exec @i_PersIDNum = dbo.get_next_uniqidnum 'PERSON'
                   IF @UniqNum is Not Null And @s_PersFirstName IS Not Null And @s_PersLastName IS Not Null
                   Begin  
                        Insert Into Person (PersIDNum ,UserCrtd ,DateCrtd,PersFirstName ,PersLastName ,
                              PersFullName , CompIDNum  )
                        Values  (@i_PersIDNum ,user,Getdate(), @s_PersFirstName, @s_PersLastName, 
                                @s_PersFirstName + '' + @s_PersFirstName ,@i_CompIDNum)
                        IF ( @@error <> 0 )
                        BEGIN
                           Select @s_error  = "Error Inserting New Person for Client (L365) " + @s_ClntID
	     	                Raiserror 90001 @s_error
		                    Return
	                    END 
     
                        --PHONE
                        exec @i_PhoneIDNum = dbo.get_next_uniqidnum 'PHONE'
                        IF Len(@s_PhoneNumber) > 4
                        BEGIN
                           Insert Into Phone 
                              (PhoneIDNum ,ClassIDNum ,PhoneNumber , PhoneUSFormatInd , EndEffDate)
                           Values( @i_PhoneIDNum,1035,@s_PhoneNumber , '1' , '12/31/2099') 
                        
                           Insert Into PersonPhoneXRef
                                   (PersIDNum ,PhoneIDNum)
                           Values (@i_PersIDNum,@i_PhoneIDNum)
                        END
                        --FAX
                        exec @i_PhoneIDNum = dbo.get_next_uniqidnum 'PHONE'
                      
                        IF Len(@s_FaxNumber) > 4
                        BEGIN
                          Insert Into Phone 
                              (PhoneIDNum ,ClassIDNum ,PhoneNumber , PhoneUSFormatInd , EndEffDate)
                          Values( @i_PhoneIDNum,1036,@s_FaxNumber , '1' , '12/31/2099') 
                          Insert Into PersonPhoneXRef
                                   (PersIDNum ,PhoneIDNum)
                        Values (@i_PersIDNum,@i_PhoneIDNum)                      
                        END
                        --1009 corporate Contact Tab
                          Insert Into Contact 
                                    (PersIDNum,AddrIDNum,ClassIDNum)
                          Values (@i_PersIDNum,@i_AddrIDNum,1009)
                        --1018 Billing Contact Tab
                          Insert Into Contact 
                                    (PersIDNum,AddrIDNum,ClassIDNum)
                          Values (@i_PersIDNum,@i_AddrIDNum,1018)
                        --1039 FYI Contact Tab
                          Insert Into Contact 
                                    (PersIDNum,AddrIDNum,ClassIDNum)
                         Values (@i_PersIDNum,@i_AddrIDNum,1039)
                   END
                END -- New Person, New Phone, New Fax
                
               Select @i_EmailIDNum = Email.EmailIDNum
               From Email,PersonEmailXRef
               Where Email.EmailIDNum = PersonEmailXRef.EmailIDNum
               And PersIDNum = @i_PersIDNum
               And EndEffDate > GetDate()
               
               If (@@rowcount = 1) And @s_EmailHostAddress IS Not Null
               Begin --Update Email
                   Update Email
                   Set EmailHostAddress = @s_EmailHostAddress  ,
                       EmailUserName = @s_EmailUserName
                   Where EmailIDNum = @i_EmailIDNum
               END
               ELSE
               BEGIN
                 If (@@rowcount = 0) And @s_EmailHostAddress Is Not Null
                  Begin  --New Email
                  exec @i_EmailIDNum = dbo.get_next_uniqidnum 'EMAIL'
                  Insert into Email
                          (EmailIDNum,EmailHostAddress,EmailUserName ,UserCrtd , DateCrtd , UserMdfd , DateMdfd , BgnEffDate , EndEffDate) 
                  Values ( @i_EmailIDNum,@s_EmailHostAddress,@s_EmailUserName , 'DBA' ,getdate() , 'DBA' , getdate(), getdate() , '12/31/2099'  )
                  IF ( @@error <> 0 )
                  BEGIN
                  Select @s_error = "Error Inserting Email for Client(L432) " + @s_ClntID
	     	        Raiserror 90001 @s_error 
		            Return
	              END 
                  
                  Insert Into PersonEmailXRef
                          (PersIDNum,EmailIDNum)
                  Values  (@i_PersIDNum,@i_EmailIDNum)          
               END        
             END           
      Fetch C_Data Into @s_ClntID,@s_AddrStreetName,@s_AddrZipCd,@s_AddrCityName,@s_State,
                   @s_PhoneNumber,@s_FaxNumber,@s_PersFirstName,@s_PersLastName,
                   @s_EmailUserName,@s_EmailHostAddress, @s_BusContact,
                   @d_BusContactEffDate, @i_BusContactPersIDNum, @s_LegalName,@i_BusSrc1
    END -- Loop 1    
  END --Proc 2
 END


 -- Main Proc      1

go
IF OBJECT_ID('dbo.CUNA_DataLoad01172006') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE KapoorN.CUNA_DataLoad01192006 >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE KapoorN.CUNA_DataLoad01192006 >>>'
go
EXEC sp_procxmode 'dbo.CUNA_DataLoad01172006','unchained'
go
