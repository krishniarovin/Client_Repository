---HDS#2065385
---Insert record for Susan Connolly with ClientID 19672.

Insert into ClientBusContact values(2030955,'19672',855640,getdate(),'12/31/2099',user,getdate(),user,getdate(),'N')

Update UniqueNumber
set UniqIDNum = 2030955
where UniqTableID ='BUSCONT'


---HDS#2064856
---Undelete the toll free number for Client 88721.


Update ClientPhone 
set EndEffDate = '12/31/2099'
where ClntID ='88721' and VDNNbr ='64591' and PhoneNbr ='8778005334'