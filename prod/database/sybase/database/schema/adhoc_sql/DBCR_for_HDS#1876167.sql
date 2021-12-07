--DML for HDS#1876167--

Insert into ClientBusContact
values( 1938662, '88042', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' );

Insert into ClientBusContact
values( 1938663, '88290', 986172, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' );

Update UniqueNumber
set UniqIDNum = 1938663
where UniqTableID = 'BUSCONT';