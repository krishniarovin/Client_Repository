--Insert SQLs to populate Classification table--
    
INSERT INTO Classification VALUES (
	5124,
	3,
	user,
	getdate(),
	user,
	getdate(),
	'8-13-2008 0:0:0.000',
	'12-31-2099 0:0:0.000',
	NULL,
	332,
	'RBC Wealth Management',
	NULL,
	222,
	0,
	NULL);

Update UniqueNumber
Set UniqIDNum = 5124
where UniqTableID = 'CLASS';