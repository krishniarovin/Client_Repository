Declare @i_PersIDNum T_ud_id_num,
        @i_BusContact T_ud_id_num   
Begin
     Begin Transaction  T1
     Select  @i_PersIDNum = 0
       exec @i_PersIDNum = dbo.get_next_uniqidnum 'PERSON'
      -- Select @i_PersIDNum

        INSERT INTO dbo.Person ( PersIDNum, BgnEffDate, EndEffDate, PersFirstName, 
        PersLastName, PersFullName, UserCrtd, DateCrtd, UserMdfd, DateMdfd ) 
        VALUES ( @i_PersIDNum, GetDate(), '12-31-2099 16:10:2.507', 'Surekha',
        'Reddy', 'Surekha Reddy', User, GetDate(), User, GetDate() )
        
        IF @@Error <> 0
           GoTo Error

        Insert Into PHHManager
        (PersIDNum,ClassIDNum,PersIDNumParent,PHHLogonID,BeginEffDate)
        Values
        (@i_PersIDNum,1587,0,'ReddyS',GetDate())
        
        IF @@Error <> 0
           GoTo Error

        exec @i_BusContact = dbo.get_next_uniqidnum 'BUSCONT'

        Insert Into ClientBusContact
        (ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,TempFlag)
        Values
        (@i_BusContact,'0000529',@i_PersIDNum,GetDate(), '12-31-2099 16:10:2.507',User, GetDate(), User, GetDate())
        
         exec @i_BusContact = dbo.get_next_uniqidnum 'BUSCONT'
        
         Insert Into ClientBusContact
         (ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,TempFlag)
         Values
         (@i_BusContact,'0007672',@i_PersIDNum,GetDate(), '12-31-2099 16:10:2.507',User, GetDate(), User, GetDate())
         
         exec @i_BusContact = dbo.get_next_uniqidnum 'BUSCONT'
        
         Insert Into ClientBusContact
         (ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,TempFlag)
         Values
         (@i_BusContact,'0007680',@i_PersIDNum,GetDate(), '12-31-2099 16:10:2.507',User, GetDate(), User, GetDate())        
         
          IF @@Error <> 0
              GoTo Error
        
         Commit T1
          Return
        
        Error:
  --           raiserror @@errno @@errmsg
            Rollback T1
End