--DML for data update in PRODQA (LogonID:MouleW)--

Insert into ClientBusContact
values( 1933051, '19839', 858575, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' );

Insert into ClientBusContact
values( 1933052, '19840', 858575, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' );

Insert into ClientBusContact
values( 1933053, '70108', 858575, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' );

Insert into ClientBusContact
values( 1933054, '19837', 858575, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' );

Insert into ClientBusContact
values( 1933055, '19843', 858575, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' );

Insert into ClientBusContact
values( 1933056, '19844', 858575, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' );

Insert into ClientBusContact
values( 1933057, '19841', 858575, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' );

Update UniqueNumber
set UniqIDNum = 1933057
where UniqTableID = 'BUSCONT';