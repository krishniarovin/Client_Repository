---HDS#2098366
---Expire ClientPhone records of Agents who are neither Top Agents nor Premier Agents to avoid error message.

Update ClientPhone 
set EndEffDate = getdate()
where PersIDNum in (136086,787930,787939,787976,803214,803220)
and ClntID ='86262'



