----DML for data update in PRODQA (LogonID:oslick)--

Update PHHManager
set EndEffDate = '12/31/2099'
where PersIDNum in ( 858559, 858560 )

Insert into ClientBusContact
values( 1352138, '13312', 858559, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352139, '17878', 858559, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352140, '15964', 858559, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352141, '15968', 858559, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352142, '19812', 858559, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352143, '95324', 858559, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352144, '15002', 858559, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352145, '15950', 858559, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352146, '15952', 858559, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

----DML for data update in PRODQA (LogonID:osliketst)--

Insert into ClientBusContact
values( 1352147, '13312', 858560, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352148, '17878', 858560, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352149, '15964', 858560, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352150, '15968', 858560, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352151, '19812', 858560, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352152, '95324', 858560, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352153, '15002', 858560, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352154, '15950', 858560, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Insert into ClientBusContact
values( 1352155, '15952', 858560, getdate(), '12/31/2099', user, getdate(), user, getdate(), 'N' )

Update UniqueNumber
set UniqIDNum = 1352155
where UniqTableID = 'BUSCONT'