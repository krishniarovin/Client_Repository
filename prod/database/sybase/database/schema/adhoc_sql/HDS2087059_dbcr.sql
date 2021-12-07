---HDS#2087059
---Update the DateMdfd field of MAAHistory table to avoid the primary key violation error.

Update MarketAccessAgreementHistory
set DateMdfd ='05/19/2009 5:15:51.000 PM'
where ClntID ='70586'


