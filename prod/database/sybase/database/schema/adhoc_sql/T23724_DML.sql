-- CCR Setup for T23724 QA Testing --

-- Fee Clients --

update Client
set NoFeeInd = 'N'
where ClntID in
(
'93647',
'18733',
'18413',
'15105',
'00001',
'70159'
);

-- No Fee Clients --

update Client
set NoFeeInd = 'Y'
where ClntID in
(
'17827',
'17826',
'13281',
'18419',
'99997',
'19006'
);

-- Opt Out Clients --

update Client
set NoFeeInd = 'O'
where ClntID in
(
'99998',
'15228',
'11111',
'19999',
'16010'
);

-- Touch the Clients --

insert into ClientDownload
select ClntID, 'N', null, 'N', null, null, 'N', null, null, null, null, null, user, getdate(), null, null
from Client
where ClntID in 
(
'93647',
'18733',
'18413',
'15105',
'00001',
'17827',
'17826',
'13281',
'18419',
'99997',
'99998',
'15228',
'11111',
'70159',
'19999',
'16010',
'19006'
);