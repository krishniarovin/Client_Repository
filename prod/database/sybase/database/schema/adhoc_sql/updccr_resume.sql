update ManagerDownload 
set SysProcessTS = getdate ()
where SysProcessTS is Null 

go
