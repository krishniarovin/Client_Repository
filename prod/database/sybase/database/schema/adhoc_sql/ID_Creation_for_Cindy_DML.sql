Begin
     Begin Transaction  T1
--     Select  748438 = 0
--     exec 748438 = dbo.get_next_uniqidnum 'PERSON'
--       Select 748438

        INSERT INTO dbo.Person ( PersIDNum, BgnEffDate, EndEffDate, PersFirstName, 
        PersLastName, PersFullName, UserCrtd, DateCrtd, UserMdfd, DateMdfd ) 
        VALUES ( 748438, GetDate(), '12-31-2099 16:10:2.507', 'Cindy',
        'Cheng', 'Cheng, Cindy', User, GetDate(), User, GetDate() )
        
        IF @@Error <> 0
           GoTo Error

        Insert Into PHHManager
        (PersIDNum,ClassIDNum,PersIDNumParent,PHHLogonID,BeginEffDate,EndEffDate)
        Values
        (748438,1587,0,'ChengC',GetDate(),'12-31-2099 16:10:2.507')
        
        IF @@Error <> 0
           GoTo Error

        Insert Into ClientBusContact
        (ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,TempFlag)
        Values
        (1033754,'82663',748438,GetDate(), '12-31-2099 16:10:2.507',User, GetDate(), User, GetDate())
        
        
         Insert Into ClientBusContact
         (ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,TempFlag)
         Values
         (1033755,'13579',748438,GetDate(), '12-31-2099 16:10:2.507',User, GetDate(), User, GetDate())
         
        
         Insert Into ClientBusContact
         (ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,TempFlag)
         Values
         (1033756,'80465',748438,GetDate(), '12-31-2099 16:10:2.507',User, GetDate(), User, GetDate())        
         
          IF @@Error <> 0
              GoTo Error
        
         Commit T1
          Return
        
        Error:
  --           raiserror @@errno @@errmsg
            Rollback T1
End