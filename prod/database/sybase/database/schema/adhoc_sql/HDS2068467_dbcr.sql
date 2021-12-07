---HDS#2068467
---Delete the Account Manager Profile for the listed users.

Update Person
Set EndEffDate = getdate()
where PersIDNum in (839973,577126,388265)

