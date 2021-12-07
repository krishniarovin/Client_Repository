--Insert SQLs to populate Contract table--
  
INSERT INTO Contract VALUES (
	94198,
	30445,
	'70330',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'8-13-2008 15:22:3.096',
	'12-31-2099 0:0:0.000',
	'8-13-2008 15:22:3.096',
	'12-31-2099 0:0:0.000',
	'8-13-2008 15:22:4.760',
	'8-13-2008 15:22:4.760',
	NULL);
    
INSERT INTO Contract VALUES (
	94199,
	30446,
	'70331',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'8-13-2008 15:22:44.933',
	'12-31-2099 0:0:0.000',
	'8-13-2008 15:22:44.933',
	'12-31-2099 0:0:0.000',
	'8-13-2008 15:22:46.426',
	'8-13-2008 15:22:46.426',
	NULL);

Update UniqueNumber
Set UniqIDNum = 94199
where UniqTableID = 'CONTRACT';