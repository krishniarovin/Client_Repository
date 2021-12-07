--CREATE TABLE tempdb.guest.ManagerConversion205205(
--		PersIDNum int
--		);



DECLARE manager_cursor CURSOR FOR
			Select PersIDNum
			from tempdb.guest.ManagerConversion205
go        

BEGIN

Declare @PersIDNum int
	 	
			Open manager_cursor
			
			Fetch manager_cursor INTO  
				@PersIDNum 


			While (@@sqlstatus != 2)
			Begin
			
update PHHManager
set ClassIDNum = 1859
    FROM dbo.PHHManager,   
         dbo.Person c,   
         dbo.Person d  
   WHERE ( dbo.PHHManager.PersIDNumParent = c.PersIDNum ) and  
         ( dbo.PHHManager.PersIDNum = d.PersIDNum ) and  
         dbo.PHHManager.PersIDNum = @PersIDNum and
         (( dbo.PHHManager.ClassIDNum = 1587 AND  
         dbo.PHHManager.EndEffDate in ( select max(EndEffDate) from dbo.PHHManager b where dbo.PHHManager.PersIDNum = b.PersIDNum and     b.BeginEffDate <= getdate())))    
                
                
                
                Fetch manager_cursor INTO  
				@PersIDNum 


			End
		
close manager_cursor
Deallocate cursor manager_cursor

End        