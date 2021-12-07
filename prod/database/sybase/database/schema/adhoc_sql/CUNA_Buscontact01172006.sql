IF OBJECT_ID('dbo.CUNA_BusContact01172006') IS NOT NULL
BEGIN
    DROP PROCEDURE CUNA_BusContact01172006
    IF OBJECT_ID('CUNA_BusContact01172006') IS NOT NULL
        PRINT '<<< FAILED DROPPING PROCEDURE KapoorN.CUNA_DataLoad01192006 >>>'
    ELSE
        PRINT '<<< DROPPED PROCEDURE KapoorN.CUNA_DataLoad01192006 >>>'
END
go
Create Procedure CUNA_BusContact01172006
/* Procedure to Update Business source Contact for the Person*/

As
Begin -- Main Proc 1

 Declare  C_Data Cursor for
 Select ClntID,BusContact,BusContactEffDate,BusContactPersIDNum
 From tempdb..CUNAClientUpload
 Where BusContactPersIDNum IS Not NULL
 
 Declare @s_BusContact Varchar(100) ,
         @d_BusContactEffDate Datetime ,
         @i_BusContactPersIDNum int,
         @UniqNum T_ud_id_num,
         @s_ClntID         char(7) 
      
Begin  --Proc 2
     open C_Data
     Fetch C_Data Into @s_ClntID, @s_BusContact,@d_BusContactEffDate, @i_BusContactPersIDNum
    
     While (@@sqlstatus = 0)
     Begin --Begin Loop1 3         
       IF  (select Count(1)
            From  ClientBusContact
            Where ClntID =@s_ClntID
            And ExpDate > Getdate() ) = 0 
        Begin  -- No Row
             If (Select count(1) 
                 From Person a,PHHManager b
                 Where  a.PersIDNum = b.PersIDNum
                 And a.EndEffDate > Getdate()
                 And b.EndEffDate > Getdate()
                 And b.PersIDNum = @i_BusContactPersIDNum) >= 1 
              Begin   --Pers found
                   exec @UniqNum = dbo.get_next_uniqidnum 'BUSCONT'
                   IF @UniqNum is Not Null
                   Begin
                       Insert into ClientBusContact
                                (ClientBusContactID ,ClntID,PersIDNum,EffDate, ExpDate )
                       Values (@UniqNum,@s_ClntID,@i_BusContactPersIDNum,@d_BusContactEffDate,'12/31/2099')
                   END
              END   --Person found      
        END --no Row
      Fetch C_Data Into @s_ClntID, @s_BusContact,@d_BusContactEffDate, @i_BusContactPersIDNum
     END      
  END
 END