--Insert SQLs to populate Contract table--

INSERT INTO Contract VALUES (
	94154,
	30402,
	'70232',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'7-14-2008 8:19:0.040',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:19:0.040',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:19:2.510',
	'7-14-2008 8:19:2.510',
	NULL);

INSERT INTO Contract VALUES (
	94155,
	30403,
	'70233',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'7-14-2008 8:23:33.773',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:23:33.773',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:23:38.460',
	'7-14-2008 8:23:38.460',
	NULL);

INSERT INTO Contract VALUES (
	94156,
	30404,
	'70234',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'7-14-2008 8:27:19.896',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:27:19.896',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:27:22.643',
	'7-14-2008 8:27:22.643',
	NULL);

INSERT INTO Contract VALUES (
	94157,
	30405,
	'70357',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'8-20-2008 14:42:30.196',
	'12-31-2099 0:0:0.000',
	'8-20-2008 14:42:30.196',
	'12-31-2099 0:0:0.000',
	'8-20-2008 14:42:31.813',
	'8-20-2008 14:42:31.813',
	NULL);

INSERT INTO Contract VALUES (
	94158,
	30405,
	'70357',
	2,
	user,
	getdate(),
	user,
	getdate(),
	'8-20-2008 14:42:33.410',
	'12-31-2099 0:0:0.000',
	'8-20-2008 14:42:33.410',
	'12-31-2099 0:0:0.000',
	'8-20-2008 14:42:34.893',
	'8-20-2008 14:42:34.893',
	NULL);




INSERT INTO Contract VALUES (
	94159,
	30406,
	'70235',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'7-14-2008 8:33:53.043',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:33:53.043',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:33:55.760',
	'7-14-2008 8:33:55.760',
	NULL);

INSERT INTO Contract VALUES (
	94160,
	30407,
	'70236',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'7-14-2008 8:35:20.990',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:35:20.990',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:35:23.496',
	'7-14-2008 8:35:23.496',
	NULL);

INSERT INTO Contract VALUES (
	94161,
	30408,
	'70237',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'7-14-2008 8:36:45.250',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:36:45.250',
	'12-31-2099 0:0:0.000',
	'7-14-2008 8:36:47.590',
	'7-14-2008 8:36:47.590',
	NULL);

INSERT INTO Contract VALUES (
	94162,
	30409,
	'70358',
	1,
	user,
	getdate(),
	user,
	getdate(),
	'8-20-2008 14:43:3.443',
	'12-31-2099 0:0:0.000',
	'8-20-2008 14:43:3.443',
	'12-31-2099 0:0:0.000',
	'8-20-2008 14:43:5.033',
	'8-20-2008 14:43:5.033',
	NULL);

INSERT INTO Contract VALUES (
	94163,
	30409,
	'70358',
	2,
	user,
	getdate(),
	user,
	getdate(),
	'8-20-2008 14:43:6.690',
	'12-31-2099 0:0:0.000',
	'8-20-2008 14:43:6.690',
	'12-31-2099 0:0:0.000',
	'8-20-2008 14:43:8.516',
	'8-20-2008 14:43:8.516',
	NULL);


Update UniqueNumber
Set UniqIDNum = 94163
where UniqTableID = 'CONTRACT'