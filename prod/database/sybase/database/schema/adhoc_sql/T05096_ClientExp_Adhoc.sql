-- T05096 06/09/2005 BY COGNIZANT to create a temp table
drop table tempdb.guest.updclient

CREATE TABLE tempdb.guest.updclient
(
    ClientId   char(7)     NOT NULL,
    Legal_Name varchar(70) NOT NULL,
    CONSTRAINT pk_clntid
    PRIMARY KEY NONCLUSTERED (ClientId)
)         

--T05096 06/09/2005 to populate the given list of Clients in temp table
INSERT INTO tempdb.guest.updclient VALUES (
	'93091',
	'CB Success - Sun City')
INSERT INTO tempdb.guest.updclient VALUES (
	'93046',
	'CB Success - Bear Canyon')
INSERT INTO tempdb.guest.updclient VALUES (
	'86312',
	'CB Success - Foothills')
INSERT INTO tempdb.guest.updclient VALUES (
	'82802',
	'CB Success - Green Valley')
INSERT INTO tempdb.guest.updclient VALUES (
	'86357',
	'CB Success - Mesa Office')
INSERT INTO tempdb.guest.updclient VALUES (
	'82800',
	'CB Success - Relocation') 
      
INSERT INTO tempdb.guest.updclient VALUES (
	'82870',
	'CB Success - Relocation')
INSERT INTO tempdb.guest.updclient VALUES (
	'82903',
	'CB Success - Relocation')
INSERT INTO tempdb.guest.updclient VALUES (
	'82904',
	'CB Success - Relocation')
      
INSERT INTO tempdb.guest.updclient VALUES (
	'88135',
	'CB Success - Scottsdale')
INSERT INTO tempdb.guest.updclient VALUES (
	'92335',
	'CB Success - Southwest')
INSERT INTO tempdb.guest.updclient VALUES (
	'86905',
	'CB Success - (Apache Juntion)')
INSERT INTO tempdb.guest.updclient VALUES (
	'93257',
	'CB Success - (Sign Rider)')
INSERT INTO tempdb.guest.updclient VALUES (
	'92545',
	'CB Success - Exito Realty - Banco')
INSERT INTO tempdb.guest.updclient VALUES (
	'93198',
	'CB Success - Mesa Gilbert')
INSERT INTO tempdb.guest.updclient VALUES (
	'93196',
	'CB Success - Mesa Greenfield')
INSERT INTO tempdb.guest.updclient VALUES (
	'93262',
	'CB Success - Oro Valley')
INSERT INTO tempdb.guest.updclient VALUES (
	'93199',
	'CB Success - Palisades')
INSERT INTO tempdb.guest.updclient VALUES (
	'93261',
	'CB Success - Phoenix Internet')
INSERT INTO tempdb.guest.updclient VALUES (
	'81908',
	'CB Success Realty - Phoenix Metro')
INSERT INTO tempdb.guest.updclient VALUES (
	'81906',
	'CB Success Realty - South Valley')
INSERT INTO tempdb.guest.updclient VALUES (
	'81907',
	'CB Success Realty - Superstition')
INSERT INTO tempdb.guest.updclient VALUES (
	'93193',
	'CB Success Realty Camelback')
INSERT INTO tempdb.guest.updclient VALUES (
	'93201',
	'CB Success Realty Chandler')
INSERT INTO tempdb.guest.updclient VALUES (
	'93194',
	'CB Success Realty Scottsdale NE')
INSERT INTO tempdb.guest.updclient VALUES (
	'93192',
	'CB Success Realty Southwest')
INSERT INTO tempdb.guest.updclient VALUES (
	'82495',
	'CB Success Realty - Camelback 4040')
INSERT INTO tempdb.guest.updclient VALUES (
	'82494',
	'CB Success Realty - Fiesta')
INSERT INTO tempdb.guest.updclient VALUES (
	'82654',
	'CB Success Realty - N. Scottsdale')
INSERT INTO tempdb.guest.updclient VALUES (
	'95139',
	'CB Success Realty - N. Scottsdale')
INSERT INTO tempdb.guest.updclient VALUES (
	'82430',
	'CB Success Realty - Relocation')
INSERT INTO tempdb.guest.updclient VALUES (
	'88171',
	'CB Success Scottsdale/Kierland')
INSERT INTO tempdb.guest.updclient VALUES (
	'93195',
	'CB Success Sun City Promenade')
INSERT INTO tempdb.guest.updclient VALUES (
	'93197',
	'CB Success Sun City West')
INSERT INTO tempdb.guest.updclient VALUES (
	'93200',
	'CB Success Surprise')
INSERT INTO tempdb.guest.updclient VALUES (
	'93260',
	'CB Success Tucson - INTERNET')
INSERT INTO tempdb.guest.updclient VALUES (
	'86305',
	'CB Success - Biltmore Office')
INSERT INTO tempdb.guest.updclient VALUES (
	'88134',
	'CB Success - Camelback NRT')
INSERT INTO tempdb.guest.updclient VALUES (
	'86364',
	'CB Success - Fountain Hills')
INSERT INTO tempdb.guest.updclient VALUES (
	'86307',
	'CB Success - Metro West')
INSERT INTO tempdb.guest.updclient VALUES (
	'86306',
	'CB Success - Northwest')
INSERT INTO tempdb.guest.updclient VALUES (
	'93258',
	'CB Success - Relo (Tucson)')
INSERT INTO tempdb.guest.updclient VALUES (
	'86308',
	'CB Success - Scottsdale/Lincoln')
INSERT INTO tempdb.guest.updclient VALUES (
	'86309',
	'CB Success - Tempe-Ahwatukee Branch')
INSERT INTO tempdb.guest.updclient VALUES (
	'86310',
	'CB Success - Williams Office')
INSERT INTO tempdb.guest.updclient VALUES (
	'93099',
	'CB Pinnacle Peak - Pima')
INSERT INTO tempdb.guest.updclient VALUES (
	'86304',
	'CB Pinnacle Peak Realty')
INSERT INTO tempdb.guest.updclient VALUES (
	'93096',
	'CB Pinnacle Peak Realty - McDowell Mtn.')
INSERT INTO tempdb.guest.updclient VALUES (
	'93098',
	'CB Pinnacle Peak Realty - Tatum Ranch')
INSERT INTO tempdb.guest.updclient VALUES (
	'93097',
	'CB Pinnacle Peak Realty - Troon Mountain')
INSERT INTO tempdb.guest.updclient VALUES (
	'93095',
	'CB Pinnacle Peak Realty - Carefree')
INSERT INTO tempdb.guest.updclient VALUES (
	'86997',
	'CB The Judd Group - Kingman')
INSERT INTO tempdb.guest.updclient VALUES (
	'82228',
	'CB The Judd Group - Lake Havasu City')
INSERT INTO tempdb.guest.updclient VALUES (
	'95007',
	'CB The Judd Group - Prescott')
INSERT INTO tempdb.guest.updclient VALUES (
	'92197',
	'CB The Judd Group - Banco')

-- T05096 06/09/2005 BY COGNIZANT to deactivate the list of clients given by Kim Murphy for bus src 93
update Client
set    ClntStrategyCode = 1579,
       EndEffDate = dateadd(yy,-1,GetDate())
where  ClntID in (select ClientId from tempdb.guest.updclient)

-- T05096 06/09/2005 BY COGNIZANT to expire linkage between listed clients and phone numbers
update ClientPhone
set    EndEffDate = GetDate()
where  ClntID in (select ClientId from tempdb.guest.updclient)


-- T05096 06/09/2005 BY COGNIZANT to expire relation of listed clients with Agents and Acc Mgrs
update ClientBusContact 
set    ExpDate = GetDate()  
where  ExpDate > GetDate()
and    ClntID in (select ClientId from tempdb.guest.updclient)


-- T05096 06/09/2005 BY COGNIZANT to insert into data into Client Download table so that UPDCCR can update info to Phhorce
DECLARE clnt_dwnld CURSOR FOR  
			Select ClientId
			from tempdb.guest.updclient
go      
BEGIN
    Declare @ClntId  char(7)
	Open clnt_dwnld
			
	Fetch clnt_dwnld  INTO  @ClntId 
	While (@@sqlstatus != 2)
		Begin
            INSERT INTO ClientDownload VALUES (
                    	@ClntId,
                    	'N',
        	            GetDate(),
        	            'N',
        	            GetDate(),
        	            NULL,
        	            'N',
        	            NULL,
        	            NULL,
        	            NULL,
        	            NULL,
        	            NULL,
        	            suser_name(),
        	            GetDate())

                 INSERT INTO TierDownload VALUES (
                    	@ClntId,
                    	'N',
        	         GetDate(),
        	         suser_name(),
        	         GetDate())
	                     
            Fetch clnt_dwnld  INTO  @ClntId 
		End
    Close clnt_dwnld
    Deallocate cursor clnt_dwnld
End

