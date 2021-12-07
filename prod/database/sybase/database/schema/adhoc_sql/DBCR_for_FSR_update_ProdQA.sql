--DML for client update in prodQA--

Insert into ClientBusContact
values( 1933058, '19837', 858576, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1933059, '19838', 858576, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1933060, '19839', 858576, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1933061, '19840', 858576, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1933062, '19841', 858576, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1933063, '19842', 858576, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1933064, '19843', 858576, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1933065, '19844', 858576, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Update UniqueNumber
set UniqIDNum = 1933065
where UniqTableID = 'BUSCONT'