---HDS#2048595
---Updating the Date Modified to stop recieving the primary key violation error.

Update MarketAccessAgreementHistory
set DateMdfd ='04/01/2009 12:00:00.000 PM'
where ClntID ='94044' and DateMdfd ='04/01/2009 12:03:11.253 PM'