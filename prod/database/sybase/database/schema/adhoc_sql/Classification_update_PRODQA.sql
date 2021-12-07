--Insert sqls to populate Classification table--

INSERT INTO Classification VALUES (
	5118,
	3,
	user,
	getdate(),
	user,
	getdate(),
	'4-2-2008 0:0:0.000',
	'12-31-2099 0:0:0.000',
	NULL,
	315,
	'Bank of the Sierra',
	'',
	222,
	0,
	NULL);

INSERT INTO Classification VALUES (
	5119,
	3,
	user,
	getdate(),
	user,
	getdate(),
	'4-2-2008 0:0:0.000',
	'12-31-2099 0:0:0.000',
	NULL,
	316,
	'Bank of the Sierra-Inves',
	NULL,
	222,
	0,
	NULL);

Update UniqueNumber
set UniqIDNum = 5119
where UniqTableID = 'CLASS'
