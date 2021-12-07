---Insert into Classification table.

INSERT INTO Classification VALUES (
	5143,
	3,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	NULL,
	337,
	'Amalgamated Bank',
	NULL,
	222,
	0,
	'PLS');
INSERT INTO Classification VALUES (
	5144,
	3,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099 0:0:0.000',
	NULL,
	338,
	'Amalgamated Bank - Inv',
	'',
	222,
	0,
	'PLS');

Update UniqueNumber
Set UniqIDNum =5144
where UniqTableID = 'CLASS';


---Insert into Company table.

INSERT INTO Company VALUES (
	30444,
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
	30445,
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
	30446,
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
	30447,
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
	30448,
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
	30449,
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
	30450,
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
	30451,
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
	30452,
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
	30453,
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
Set UniqIDNum =30453
where UniqTableID = 'COMPANY'



---Insert into the Client table

INSERT INTO Client VALUES (
	'70615',
	30444,
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
	30445,
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
	30446,
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
	'70619',
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
	'70620',
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
	'70621',
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
	'70622',
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
	'70644',
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
	'70645',
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


--Insert into BusSrcXRef table

INSERT INTO BusSrcXRef VALUES (
	5143,
	'70615',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5143,
	'70616',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5143,
	'70617',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5143,
	'70618',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5143,
	'70644',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5144,
	'70619',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5144,
	'70620',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5144,
	'70621',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5144,
	'70622',
	user,
	getdate(),
	'');
INSERT INTO BusSrcXRef VALUES (
	5144,
	'70645',
	user,
	getdate(),
	'');



--Insert into Contract table

INSERT INTO Contract VALUES (
	94211,
	30444,
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
	94212,
	30445,
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
	94213,
	30445,
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
	94214,
	30446,
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
	94215,
	30447,
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
	94216,
	30448,
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
	94217,
	30449,
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
	94218,
	30450,
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
	94219,
	30450,
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
	94220,
	30451,
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
	94221,
	30452,
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
	94222,
	30452,
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
	94223,
	30446,
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
	94224,
	30453,
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
	94225,
	30453,
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
Set UniqIDNum = 94225
where UniqTableID = 'CONTRACT'
