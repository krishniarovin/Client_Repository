-- DML for HDS#1876167 --

Insert into ClientBusContact
values( 1939787, '17130', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1939788, '95478', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1939789, '95479', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1939790, '19110', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1939791, '95468', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Update UniqueNumber
set UniqIDNum = 1939791
where UniqTableID = 'BUSCONT'