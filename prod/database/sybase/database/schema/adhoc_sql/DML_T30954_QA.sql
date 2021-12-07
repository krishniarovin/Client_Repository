--- Tag T30954
---Insert records to various tables in RetailQA CCR for the new BS 337,338.

INSERT INTO Classification VALUES (
	5125,
	3,
	'C9918787',
	'2-20-2009 10:39:36.800',
	'C9918787',
	'2-20-2009 10:39:41.456',
	'2-20-2009 0:0:0.000',
	'12-31-2099 0:0:0.000',
	NULL,
	337,
	'Amalgamated Bank',
	NULL,
	222,
	0,
	'PLS');
INSERT INTO Classification VALUES (
	5126,
	3,
	'C9918787',
	'2-20-2009 10:39:53.193',
	'C9918787',
	'2-20-2009 10:39:56.110',
	'2-20-2009 0:0:0.000',
	'12-31-2099 0:0:0.000',
	NULL,
	338,
	'Amalgamated Bank - Inv',
	'',
	222,
	0,
	'PLS');

Update UniqueNumber
Set UniqIDNum =5126
where UniqTableID = 'CLASS';


---Insert into Company

INSERT INTO Company VALUES (
	30447,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - Tier 1',
	'Amalgamated Bank - Tier 1',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - Tier 1');
INSERT INTO Company VALUES (
	30448,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - B2C',
	'Amalgamated Bank - B2C',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - B2C');
INSERT INTO Company VALUES (
	30449,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - B2B Referral',
	'Amalgamated Bank - B2B Referra',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - B2B Referral');
INSERT INTO Company VALUES (
	30450,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - Servicing Portfolio Retent',
	'Amalgamated Bank - Servicing P',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - Servicing Portfolio Retent');
INSERT INTO Company VALUES (
	30451,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - Tier 1 - Invested',
	'Amalgamated Bank - Tier 1 - In',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - Tier 1 - Invested');
INSERT INTO Company VALUES (
	30452,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - B2C - Invested',
	'Amalgamated Bank - B2C - Inves',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - B2C - Invested');
INSERT INTO Company VALUES (
	30453,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - B2B - Invested',
	'Amalgamated Bank - B2B - Inves',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - B2B - Invested');
INSERT INTO Company VALUES (
	30454,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - Servicing Portfolio Retent',
	'Amalgamated Bank - Servicing P',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - Servicing Portfolio Retent');
INSERT INTO Company VALUES (
	30455,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - Tier 2',
	'Amalgamated Bank - Tier 2',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - Tier 2');
INSERT INTO Company VALUES (
	30456,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	'Amalgamated Bank - Tier 2',
	'Amalgamated Bank - Tier 2',
	NULL,
	'I',
	NULL,
	NULL,
	'N',
	'N',
	'Amalgamated Bank - Tier 2');


Update UniqueNumber
Set UniqIDNum =30456
where UniqTableID = 'COMPANY'


--Insert into Client

INSERT INTO Client VALUES (
	'70615',
	30447,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);
INSERT INTO Client VALUES (
	'70616',
	30448,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);
INSERT INTO Client VALUES (
	'70617',
	30449,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);
INSERT INTO Client VALUES (
	'70618',
	30450,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);
INSERT INTO Client VALUES (
	'70619',
	30451,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);
INSERT INTO Client VALUES (
	'70620',
	30452,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);
INSERT INTO Client VALUES (
	'70621',
	30453,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);
INSERT INTO Client VALUES (
	'70622',
	30454,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);
INSERT INTO Client VALUES (
	'70644',
	30455,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);
INSERT INTO Client VALUES (
	'70645',
	30456,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	0,
	0,
	getdate(),
	NULL,
	getdate(),
	NULL,
	1577,
	NULL,
	'Y',
	'N',
	'N',
	'N',
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	'N',
	NULL,
	'O',
	NULL,
	NULL);


---Insert into BusSrcXRef
INSERT INTO BusSrcXRef VALUES (
	5125,
	'70615',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5125,
	'70616',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5125,
	'70617',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5125,
	'70618',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5125,
	'70644',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5126,
	'70619',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5126,
	'70620',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5126,
	'70621',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5126,
	'70622',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5126,
	'70645',
	user,
	getdate(),
	'');


---Insert into Contract

INSERT INTO Contract VALUES (
	94200,
	30447,
	'70615',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94201,
	30448,
	'70616',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94202,
	30448,
	'70616',
	2,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94203,
	30449,
	'70617',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94204,
	30450,
	'70618',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94205,
	30451,
	'70619',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94206,
	30452,
	'70620',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94207,
	30453,
	'70621',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94208,
	30453,
	'70621',
	2,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94209,
	30454,
	'70622',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94210,
	30455,
	'70644',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94211,
	30455,
	'70644',
	2,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94212,
	30449,
	'70617',
	2,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94213,
	30456,
	'70645',
	1,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);
INSERT INTO Contract VALUES (
	94214,
	30456,
	'70645',
	2,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	'12-31-2099 0:0:0.000',
	getdate(),
	getdate(),
	NULL);

Update UniqueNumber
Set UniqIDNum =94214
where UniqTableID = 'CONTRACT'