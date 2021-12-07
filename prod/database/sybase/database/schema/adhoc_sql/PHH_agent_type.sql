insert into TollFreeType 
(TollFreeTypeNum, TollFreeTypeDesc, BeginDate , EndDate,  UserCrtd , DateCrtd , UserMdfd ,DateMdfd ) 
values 
(100,"PHH Agent" ,convert(datetime , '8/13/2004') , 
convert(datetime , '12/21/2099') ,  'ADMIN' , getdate() , 'ADMIN',getdate()) 
go 