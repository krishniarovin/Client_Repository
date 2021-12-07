declare @return_num int
exec get_next_uniqidnum 'ADDRESS' , @return_num
go 

declare @return_num int
select @return_num = UniqIDNum
  from UniqueNumber where upper(UniqTableID) = 'ADDRESS'

insert into Address (AddrIDNum , ClntID , CompIDNum , UserCrtd , DateCrtd , UserMdfd ,DateMdfd , BgnEffDate , EndEffDate) 
values 
(@return_num , '16600' , 23537 , 'ADMIN' , getdate() , 'ADMIN', 
getdate() ,convert(datetime , '3/16/2004')  , convert(datetime , '12/31/2099')) 
go 

commit