---HDS#2055490
---CCR changes for new presidents.


---Step 1: Insert records for the new presidents in the Classification table.

INSERT INTO Classification VALUES (
	5096,
	124,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099',
	'DC',
	NULL,
	'Dean Cottrill',
	NULL,
	NULL,
	0,
	NULL);

INSERT INTO Classification VALUES (
	5097,
	124,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099',
	'FBN',
	NULL,
	'Fran Broude-North',
	NULL,
	NULL,
	0,
	NULL);

INSERT INTO Classification VALUES (
	5098,
	124,
	user,
	getdate(),
	user,
	getdate(),
	getdate(),
	'12-31-2099',
	'FBS',
	NULL,
	'Fran Broude-South',
	NULL,
	NULL,
	0,
	NULL);


---Step 2:Update the Unique Number table with the latest ClassIDNum.


Update UniqueNumber 
set UniqIDNum = 5098
where UniqTableID ='CLASS'




---Step 3: Update all the clients with the new presidents.


Update Client 
set President ='Dean Cottrill'
where ClntID in ('95559','95008','95381','88793',
'95387','95201','95393','95033','95026','95395','95396',
'95399','82995','95034','95397','82913','95403','95035',
'95204','95407','95203','95409','95014','95568','95914',
'82989','95212','95417','88977','95419','95070','95213',
'88978','95423','95421','95071','95427','95072','95209',
'95431','95430','95377','95012','93534','95296','95437',
'95436','95031','95379','95015','95451','82993','82997',
'95383','95032','95389','82999','82991','95564','95601',
'82986','88875','95405','95404','82988','95413','95907',
'95534','95535','95029','95539','82979','19037','95003',
'95039','95429','82998','95435','82990','95441','82984',
'93040','95297','95380','96096','95382','88873','95206',
'95386','95392','96092','82994','95298','95394','95205',
'95897','95906','95374','95388','95202','95560','70481',
'70451','95295','95402','88767','95408','82996','95406',
'70482','70452','96095','70483','70453','95557','95740',
'95831','88878','95412','95562','95832','95908','95538',
'95416','95069','95224','95422','95223','95418','95214',
'95426','95573','95829','19036','95898','95428','95561',
'95909','96087','95376','70484','70454','88864','95636',
'95910','95434','95911','95912','95378','95602','95450',
'70485','70455','88876','96093','95440','95558','95830',
'96079','19034','19035','80656','80658','80664','80667',
'80670','80672','80673','80677','80678','80679','80680',
'80681','80682','80686','80687','80690','80693','80694',
'80695','80697','80698','80699','80700','82976','82977',
'82978','82980','82992','88404','88416','88417','88425',
'88426','88427','88429','88430','88431','88432','88433',
'88436','88541','88705','88874','95000','95001','95010',
'95011','95013','95016','95028','95030','95036','95037',
'95208','95384','95400','95401','95410','95411','95420',
'95424','95425','95432','95563','95565','95739','95913')


Update Client 
set President ='Fran Broude-North'
where ClntID in ('95593','82579','95241','95240','81104','88020',
'95246','88021','86545','95238','95239','86546','86542','95243',
'95245','81108','81531','88036','82582','81995','81102','81106',
'82591','95645','95644','81994','82597','81109','95546','81012',
'82585','81015','81111','88247','81103','81107','88037','95594',
'88302','81398','81016','81008','81392','81389','88139','95242',
'82581','81013','95655','81394','81011','82583','81223','81222',
'81396','82586','81017','95877','82592','95244','86544','82593')


Update Client 
set President ='Fran Broude-South'
where ClntID in ('88016','88024',
'81225','96075','88164','86012','88640','82236','88166','95646',
'88030','81319','86015','88162','88163','81231','88817','81482',
'88022','88018','88023','88027','88029','88031','88028','81009')



---Step 4: Expire the records for the old presidents.

Update Classification 
set EndEffDate = getdate()
where ClassGrpIDNum = 124 and ClassDesc in ('Fran Broude','Sarah Sinnickson')




---Step 5: Insert records into the ClientDownload table.

Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95559','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95008','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95381','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88793','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95387','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95201','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95393','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95033','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95026','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95395','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95396','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95399','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82995','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95034','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95397','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82913','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95403','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95035','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95204','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95407','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95203','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95409','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95014','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95568','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95914','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82989','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95212','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95417','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88977','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95419','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95070','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95213','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88978','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95423','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95421','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95071','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95427','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95072','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95209','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95431','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95430','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95377','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95012','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('93534','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95296','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95437','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95436','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95031','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95379','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95015','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95451','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82993','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82997','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95383','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95032','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95389','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82999','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82991','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95564','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95601','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82986','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88875','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95405','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95404','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82988','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95413','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95907','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95534','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95535','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95029','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95539','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82979','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('19037','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95003','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95039','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95429','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82998','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95435','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82990','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95441','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82984','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('93040','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95297','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95380','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('96096','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95382','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88873','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95206','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95386','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95392','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('96092','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82994','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95298','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95394','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95205','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95897','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95906','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95374','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95388','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95202','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95560','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70481','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70451','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95295','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95402','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88767','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95408','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82996','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95406','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70482','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70452','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('96095','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70483','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70453','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95557','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95740','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95831','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88878','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95412','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95562','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95832','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95908','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95538','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95416','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95069','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95224','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95422','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95223','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95418','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95214','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95426','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95573','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95829','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('19036','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95898','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95428','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95561','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95909','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('96087','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95376','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70484','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70454','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88864','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95636','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95910','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95434','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95911','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95912','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95378','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95602','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95450','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70485','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('70455','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88876','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('96093','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95440','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95558','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95830','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('96079','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('19034','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('19035','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80656','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80658','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80664','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80667','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80670','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80672','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80673','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80677','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80678','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80679','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80680','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80681','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80682','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80686','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80687','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80690','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80693','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80694','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80695','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80697','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80698','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80699','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('80700','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82976','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82977','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82978','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82980','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82992','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88404','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88416','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88417','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88425','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88426','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88427','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88429','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88430','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88431','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88432','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88433','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88436','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88541','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88705','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88874','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95000','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95001','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95010','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95011','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95013','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95016','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95028','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95030','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95036','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95037','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95208','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95384','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95400','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95401','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95410','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95411','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95420','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95424','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95425','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95432','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95563','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95565','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95739','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95913','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95593','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82579','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95241','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95240','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81104','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88020','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95246','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88021','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('86545','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95238','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95239','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('86546','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('86542','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95243','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95245','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81108','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81531','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88036','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82582','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81995','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81102','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81106','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82591','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95645','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95644','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81994','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82597','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81109','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95546','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81012','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82585','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81015','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81111','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88247','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81103','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81107','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88037','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95594','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88302','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81398','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81016','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81008','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81392','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81389','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88139','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95242','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82581','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81013','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95655','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81394','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81011','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82583','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81223','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81222','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81396','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82586','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81017','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95877','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82592','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95244','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('86544','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82593','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88016','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88024','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81225','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('96075','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88164','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('86012','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88640','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('82236','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88166','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('95646','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88030','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81319','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('86015','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88162','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88163','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81231','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88817','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81482','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88022','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88018','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88023','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88027','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88029','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88031','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('88028','N','N','N','N','N',user,getdate(),'N')
Insert into ClientDownload (ClntID,PHHORCEUpdtInd,MLCSUpdtInd,CASHUpdtInd,IntranetUpdtInd,MobilityUpdtInd,UserCrtd,DateCrtd,FDRUpdtInd) values('81009','N','N','N','N','N',user,getdate(),'N')



