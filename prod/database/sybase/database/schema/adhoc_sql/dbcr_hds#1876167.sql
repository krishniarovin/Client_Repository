-- DML for HDS#1876167 --

Update Person
Set EndEffDate = '12/31/2099'
where PersIDNum = 986172

Update ClientBusContact
Set ExpDate = '12/31/2099'
where ClntID = '88187' and PersIDNum = 986172

Update ClientBusContact
Set ExpDate = '12/31/2099'
where ClntID = '88042' and PersIDNum = 986172

Update ClientBusContact
Set ExpDate = '12/31/2099'
where ClntID = '88290' and PersIDNum = 986172

Insert into ClientBusContact
values( 1939772, '17130', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1939773, '95478', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1939774, '95479', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1939775, '19110', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1939776, '95468', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Update UniqueNumber
set UniqIDNum = 1939776
where UniqTableID = 'BUSCONT'