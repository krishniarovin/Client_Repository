--Declare @i_PersIDNum T_ud_id_num,
--        @i_BusContact T_ud_id_num   
Begin
     Begin Transaction  T1
--     Select  @i_PersIDNum = 0
--       exec @i_PersIDNum = dbo.get_next_uniqidnum 'PERSON'
--       Select @i_PersIDNum

        INSERT INTO dbo.Person ( PersIDNum, BgnEffDate, EndEffDate, PersFirstName, 
        PersLastName, PersFullName, UserCrtd, DateCrtd, UserMdfd, DateMdfd ) 
        VALUES ( 748439, GetDate(), '12-31-2099 16:10:2.507', 'Soni',
        'Harmeet', 'Soni Harmeet', User, GetDate(), User, GetDate() )
        
        IF @@Error <> 0
           GoTo Error

        Insert Into PHHManager
        (PersIDNum,ClassIDNum,PersIDNumParent,PHHLogonID,BeginEffDate,EndEffDate)
        Values
        (748439,1587,0,'sonih',GetDate(),'12-31-2099 16:10:2.507')
        
        IF @@Error <> 0
           GoTo Error

--        exec @i_BusContact = dbo.get_next_uniqidnum 'BUSCONT'

        Insert Into ClientBusContact
        (ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,TempFlag)
        Values
        (1033760,'82663',748439,GetDate(), '12-31-2099 16:10:2.507',User, GetDate(), User, GetDate())
        
--         exec @i_BusContact = dbo.get_next_uniqidnum 'BUSCONT'
        
         Insert Into ClientBusContact
         (ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,TempFlag)
         Values
         (1033761,'13579',748439,GetDate(), '12-31-2099 16:10:2.507',User, GetDate(), User, GetDate())
         
--         exec @i_BusContact = dbo.get_next_uniqidnum 'BUSCONT'
        
         Insert Into ClientBusContact
         (ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,TempFlag)
         Values
         (1033762,'80465',748439,GetDate(), '12-31-2099 16:10:2.507',User, GetDate(), User, GetDate())        
         
          IF @@Error <> 0
              GoTo Error
        
         Commit T1
          Return
        
        Error:
  --           raiserror @@errno @@errmsg
            Rollback T1
End