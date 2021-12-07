---HDS#2060528
--Insert Email Address for the given MA.

Update PHHManager
Set EmailAddress ='Doug.Hinchee@mortgagefamily.com'
Where PersIDNum = 997947 and EndEffDate > getdate()



---HDS#2060613
--Insert Email Address for the given MA.

Update PHHManager
Set EmailAddress ='Andrea.Karraker@mortgagefamily.com'
Where PersIDNum = 916693 and EndEffDate > getdate()

Update PHHManager
Set EmailAddress ='Douglas.Buchanan@mortgagefamily.com'
Where PersIDNum = 929057 and EndEffDate > getdate()

Update PHHManager
Set EmailAddress ='Mary.Bracken@mortgagefamily.com'
Where PersIDNum = 142395 and EndEffDate > getdate()

Update PHHManager
Set EmailAddress ='Colleen.Hoppe@mortgagefamily.com'
Where PersIDNum = 941452 and EndEffDate > getdate()



---HDS#2060190
---Expire the record for Cary Greer.

Update Person
Set EndEffDate = getdate()
Where PersIDNum = 584506 and EndEffDate > getdate()
