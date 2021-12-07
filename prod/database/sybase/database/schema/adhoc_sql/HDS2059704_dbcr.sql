---HDS#2059704 
---Delete from ClientBusContact for Tina Fredo. 

Delete From ClientBusContact where PersIDNum = 986172 and ClntID in ('95479') and ExpDate < getdate()
