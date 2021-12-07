--Insert SQLs to populate Company table--
    
INSERT INTO Company VALUES (
	30445,
	user,
	getdate(),
	user,
	getdate(),
	'8-13-2008 15:21:28.896',
	'12-31-2099 0:0:0.000',
	'RBC Wealth Management',
	'RBC Wealth Management',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'RBC Wealth Management');
    
INSERT INTO Company VALUES (
	30446,
	user,
	getdate(),
	user,
	getdate(),
	'8-13-2008 15:22:24.316',
	'12-31-2099 0:0:0.000',
	'RBC Wealth Management - Internet',
	'RBC Wealth Management - Intern',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'RBC Wealth Management - Internet');

Update UniqueNumber
Set UniqIDNum = 30446
where UniqTableID = 'COMPANY'