INSERT INTO Company VALUES (
	30410,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Carter Mortgage Company, LLC - Internet',
	'Carter Mortgage Company, LLC -',
	NULL,
	'I',
	NULL,
	'C21 Advanced All Service Realty',
	'N',
	'N',
	'Carter Mortgage Company, LLC');


INSERT INTO Company VALUES (
	30411,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Carter Mortgage Company, LLC - Nicole Larsen',
	'Carter Mtg Co - Nicole Larsen',
	NULL,
	'I',
	NULL,
	'C21 Advanced All Service Realty',
	'N',
	'N',
	'Carter Mortgage Company, LLC');

update UniqueNumber
set UniqIDNum = 30411
where UniqTableID = 'COMPANY';