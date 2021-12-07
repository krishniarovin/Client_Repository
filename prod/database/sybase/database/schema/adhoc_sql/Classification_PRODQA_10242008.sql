--Insert SQLs to populate Classification table--

INSERT INTO Classification VALUES (
	5135,
	3,
	user,
	getdate(),
	user,
	getdate(),
	'9-18-2008 0:0:0.000',
	'12-31-2099 0:0:0.000',
	NULL,
	334,
	'CB Home Loans (Mid-Atlan',
	NULL,
	111,
	0,
	'BRANDS');

Update UniqueNumber
Set UniqIDNum = 5135
where UniqTableID = 'CLASS';
