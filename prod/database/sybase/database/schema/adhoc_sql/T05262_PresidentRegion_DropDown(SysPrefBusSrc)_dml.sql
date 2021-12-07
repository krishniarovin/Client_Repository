--T05262_President and Region DropDown
--Insert CalssID Num of NRT Cliets into SysPrefBusSrc table

Insert Into SysPrefBusSrc (PreferenceType,Preference,Description,ClassIDNum)
 Select 'NRTCLIENTS','NRTCLIENTS','NRT Clients' ,ClassIDNum from Classification Where ClassNum in(87,97,98,109,500)
--SElect * from Classification Where ClassNum in(87,97,98,109,500)