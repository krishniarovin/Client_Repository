---HDS#2058150
---Delete records from ClientBusContact table.

Delete From ClientBusContact where PersIDNum = 986172 and ClntID in ('17130','19110','88042','88187','88290','95468','95478','986172') and ExpDate < getdate()


---Update the expiry date.
Update ClientBusContact 
set ExpDate = '12/7/07'
where ClntID ='94636' and PersIDNum = 924330