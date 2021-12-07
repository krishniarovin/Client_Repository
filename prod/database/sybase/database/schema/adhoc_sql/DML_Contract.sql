INSERT INTO Contract VALUES (
	94163,
	30410,
	'19048',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'12-7-2006 16:42:59.700',
	'12-31-2099 0:0:0.000',
	'12-7-2006 16:43:1.426',
	'12-7-2006 16:43:1.426',
	NULL);


INSERT INTO Contract VALUES (
	94164,
	30410,
	'19048',
	2,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'12-7-2006 16:43:3.116',
	'12-31-2099 0:0:0.000',
	'12-7-2006 16:43:4.720',
	'12-7-2006 16:43:4.720',
	NULL);


INSERT INTO Contract VALUES (
	94165,
	30411,
	'19049',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'12-7-2006 16:44:5.223',
	'12-31-2099 0:0:0.000',
	'12-7-2006 16:44:7.016',
	'12-7-2006 16:44:7.016',
	NULL);


INSERT INTO Contract VALUES (
	94166,
	30411,
	'19049',
	2,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'12-7-2006 16:44:18.513',
	'12-31-2099 0:0:0.000',
	'12-7-2006 16:44:29.320',
	'12-7-2006 16:44:29.320',
	NULL);

update UniqueNumber
set UniqIDNum = 94166
where UniqTableID = 'CONTRACT';
