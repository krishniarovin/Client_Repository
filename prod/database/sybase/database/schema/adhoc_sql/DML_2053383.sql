delete Classification
where ClassIDNum = 1850;

INSERT INTO Classification 
select UniqIDNum + 1,3,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'4-13-2005 0:0:0.000',
	NULL,
	241,
	'Refinance-Outbound Portf',
	NULL,
	222,
	0,
	'BRANDS' from UniqueNumber where UniqTableID = 'CLASS';