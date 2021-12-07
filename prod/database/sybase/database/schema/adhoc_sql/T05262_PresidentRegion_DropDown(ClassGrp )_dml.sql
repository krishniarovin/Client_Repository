--T05262 President and Region DropDown
Declare @classgrpidnum int
exec @classgrpidnum = dbo.get_next_uniqidnum 'CLASSGRP'  
INSERT INTO ClassificationGroup(ClassGrpIDNum ,	UserCrtd ,
         	DateCrtd , ClassGrpDesc ,BgnEffDate ,	EndEffDate )
VALUES (@classgrpidnum,USER_name(),GetDate(),	'President',
	     getdate(),	'12-31-2099 0:0:0.000') 
Go
--Region
Declare @classgrpidnum int
exec @classgrpidnum = dbo.get_next_uniqidnum 'CLASS'  
INSERT INTO ClassificationGroup(ClassGrpIDNum ,	UserCrtd ,
	DateCrtd , ClassGrpDesc ,BgnEffDate ,	EndEffDate )
VALUES (@classgrpidnum,USER_name(),GetDate(),	'Region1',
	      getdate(),	'12-31-2099 0:0:0.000') 
  Go