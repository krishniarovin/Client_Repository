--DML for data update in QA (LogonID:oslick)--

Update PHHManager
set EndEffDate = '12/31/2099'
where PersIDNum in ( 909472, 909473 ) 

Insert into ClientBusContact
values( 1932962, '13312', 909472, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932963, '17878', 909472, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932964, '15964', 909472, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932965, '15968', 909472, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932966, '19812', 909472, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932967, '95324', 909472, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932968, '15002', 909472, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932969, '15950', 909472, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932970, '15952', 909472, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

--DML for data update in QA (LogonID:osliketst)--

Insert into ClientBusContact
values( 1932971, '13312', 909473, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932972, '17878', 909473, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932973, '15964', 909473, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932974, '15968', 909473, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932975, '19812', 909473, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932976, '95324', 909473, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932977, '15002', 909473, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932978, '15950', 909473, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1932979, '15952', 909473, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Update UniqueNumber
set UniqIDNum = 1932979
where UniqTableID = 'BUSCONT'