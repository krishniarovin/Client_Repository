declare @return_num int
exec get_next_uniqidnum 'TFN      ' , @return_num
go 

declare @return_num int
select @return_num = UniqIDNum
  from UniqueNumber where upper(UniqTableID) = 'TFN     '

insert into  TollFreeNumber
(TollFreeSequenceNum, TollFreeNum , VDNNum , RespOrgID ,Vector , Skill,  RespOrgStartDate, AdvanceFeatures ,
 TransferConnect , LanguageInd, DomesticInt , RoutingUniqNum , AssignableId , TollFreeTypeNum , BusSrcTypeNum, ShellType,
 BeginEffDate , EndEffDate ,UserCrtd , State ,  DateCrtd , UserMdfd ,DateMdfd) 
values 
(@return_num , '8001234567' , '00001' ,'ATT' , '21323' , '9999' , convert(datetime , '5/01/2001') ,'N' ,
 'N' , 1 , 'D' , 1, 'Y', 100 , 111, 1, 
 getdate()  ,  convert(datetime , '12/31/2099') , 'ADMIN' ,'NJ' ,  getdate() , 'ADMIN',getdate()) 

go 



declare @return_num int
exec get_next_uniqidnum 'TFN      ' , @return_num
go 

declare @return_num int
select @return_num = UniqIDNum
  from UniqueNumber where upper(UniqTableID) = 'TFN     '

insert into  TollFreeNumber
(TollFreeSequenceNum, TollFreeNum , VDNNum , RespOrgID ,Vector , Skill,  RespOrgStartDate, AdvanceFeatures ,
 TransferConnect , LanguageInd, DomesticInt , RoutingUniqNum , AssignableId , TollFreeTypeNum , BusSrcTypeNum, ShellType,
 BeginEffDate , EndEffDate ,UserCrtd , State ,  DateCrtd , UserMdfd ,DateMdfd) 
values 
(@return_num , '8005213654' , '00001' ,'ATT' , '21323' , '9999' , convert(datetime , '5/01/2001') ,'N' ,
 'N' , 1 , 'D' , 1, 'Y', 100 , 111, 1, 
 getdate()  ,  convert(datetime , '12/31/2099') , 'ADMIN' ,'NJ' ,  getdate() , 'ADMIN',getdate()) 

go 

declare @return_num int
exec get_next_uniqidnum 'TFN      ' , @return_num
go 

declare @return_num int
select @return_num = UniqIDNum
  from UniqueNumber where upper(UniqTableID) = 'TFN     '

insert into  TollFreeNumber
(TollFreeSequenceNum, TollFreeNum , VDNNum , RespOrgID ,Vector , Skill,  RespOrgStartDate, AdvanceFeatures ,
 TransferConnect , LanguageInd, DomesticInt , RoutingUniqNum , AssignableId , TollFreeTypeNum , BusSrcTypeNum, ShellType,
 BeginEffDate , EndEffDate ,UserCrtd , State ,  DateCrtd , UserMdfd ,DateMdfd) 
values 
(@return_num , '8009876543' , '00001' ,'ATT' , '21323' , '9999' , convert(datetime , '5/01/2001') ,'N' ,
 'N' , 1 , 'D' , 1, 'Y', 100 , 111, 1, 
 getdate()  ,  convert(datetime , '12/31/2099') , 'ADMIN' ,'NJ' ,  getdate() , 'ADMIN',getdate()) 

go 


declare @return_num int
exec get_next_uniqidnum 'TFN      ' , @return_num
go 

declare @return_num int
select @return_num = UniqIDNum
  from UniqueNumber where upper(UniqTableID) = 'TFN     '

insert into  TollFreeNumber
(TollFreeSequenceNum, TollFreeNum , VDNNum , RespOrgID ,Vector , Skill,  RespOrgStartDate, AdvanceFeatures ,
 TransferConnect , LanguageInd, DomesticInt , RoutingUniqNum , AssignableId , TollFreeTypeNum , BusSrcTypeNum, ShellType,
 BeginEffDate , EndEffDate ,UserCrtd , State ,  DateCrtd , UserMdfd ,DateMdfd) 
values 
(@return_num , '8009171111' , '00001' ,'ATT' , '21323' , '9999' , convert(datetime , '5/01/2001') ,'N' ,
 'N' , 1 , 'D' , 1, 'Y', 100 , 111, 1, 
 getdate()  ,  convert(datetime , '12/31/2099') , 'ADMIN' ,'NJ' ,  getdate() , 'ADMIN',getdate()) 

go 


