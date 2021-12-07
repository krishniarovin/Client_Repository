create table #temp_manager(
ColNum numeric,
PersFirstName varchar(30),
PersLastName varchar(30),
PHHLogonID char(10),
ClntID char(7)
)

Create Proc proc_add_manager_client  as
Begin
/*
This procedure is created to Upload Pipeline FSR record in CCR database. This is requried for Loan Span.
Procedure is not called from front End.This is one time procedure
*/
declare  
      @PersIDNum numeric,
      @ClntID char(7),
      @PHHLogonID char(10),
      @ClientBusContactID numeric,
      @count1 numeric,
      @cnt numeric,
      @errormsg char(255)

select @count1= count(*) from #temp_manager
select @cnt=1


while (@cnt<=@count1)
Begin
    if not exists (Select p.PersIDNum from PHHManager p , #temp_manager t
       where p.PHHLogonID = t.PHHLogonID
       and ColNum = @cnt)
        Begin
              exec @PersIDNum = get_next_uniqidnum "PERSON"
              
              insert into Person(PersIDNum,UserCrtd,DateCrtd,UserMdfd,DateMdfd,BgnEffDate,EndEffDate,PersFirstName,PersLastName,PersFullName,SelfSerPin)
              select @PersIDNum,User,getdate(),User,getdate(),getdate(),'12/31/2099',t.PersFirstName,t.PersLastName,t.PersFirstName||t.PersLastName,'2222' 
              from #temp_manager t
              where t.ColNum=@cnt
              
              if @@error !=0
                          Begin
                         select @errormsg = "Insert failed in Person for PersIDNum " + Convert(char,@PersIDNum) 
                          end
                    
                  Select @ClntID = ClntID,@PHHLogonID = PHHLogonID from #temp_manager where ColNum = @cnt
            
                  insert into PHHManager(PersIDNum,ClassIDNum,PersIDNumParent,PHHLogonID,BeginEffDate,EndEffDate,UserCrtd,DateCrtd,UserMdfd,DateMdfd,AMCPRptExcluded)
                  values(@PersIDNum,1587,@PersIDNum,@PHHLogonID,getdate(),'12/31/2099',User,getdate(),User,getdate(),0)
                  
                  if @@error !=0
                              Begin
                           select @errormsg = "Insert failed in PHHManager for PersIDNum " + Convert(char,@PersIDNum) 
                        end
                  exec @ClientBusContactID =  get_next_uniqidnum "BUSCONT"
                    
                insert into ClientBusContact(ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,DateMdfd,TempFlag)
                  values(@ClientBusContactID,@ClntID,@PersIDNum,getdate(),'12/31/2099',User,getdate(),User,getdate(),'N')
                  
                  if @@error !=0
                              Begin
                         select @errormsg = "Insert failed in ClientBusContact for PersIDNum " + Convert(char,@PersIDNum) + " Client ID " + @ClntID
                        end
            End
      Else
            Begin
                   Select @ClntID = ClntID from #temp_manager where ColNum = @cnt
                   
                   select @PersIDNum = p.PersIDNum 
                   from PHHManager p , #temp_manager t
                   where p.PHHLogonID = t.PHHLogonID
                   and ColNum = @cnt
                   
                   exec @ClientBusContactID =  get_next_uniqidnum "BUSCONT"
                   
                   insert into ClientBusContact(ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,DateMdfd,TempFlag)
                   values(@ClientBusContactID,@ClntID,@PersIDNum,getdate(),'12/31/2099',User,getdate(),User,getdate(),'N')
                  
                   if @@error !=0
                              Begin
                              select @errormsg = "Insert failed in ClientBusContact for PersIDNum " + Convert(char,@PersIDNum) +" Client ID " + @ClntID
                        end
            End
    select @cnt=@cnt+1
End
End
go
Grant all privileges to Public
Go

