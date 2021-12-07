			DECLARE person_cursor CURSOR FOR
			
			Select a.PersIDNum, 
				 	a.PersFax, 
	 				a.PersPager,
	 				a.PersCellPhone,
	 				a.PersHomePhone,
	 				a.PersPrefPhone
			from dbo.Person a, dbo.Agent b
            where  a.PersIDNum = b.PersIDNum
            and b.TopAgentInd = 1

        
go        

BEGIN
   


Declare @PersIDNum int,
		@PersFax varchar(21), 
	 	@PersPager varchar(21),
	 	@PersCellPhone varchar(21),
	 	@PersHomePhone varchar(21),
	 	@PersPrefPhone varchar(21)


			

			Open person_cursor
			
			Fetch person_cursor INTO  
				@PersIDNum ,
				@PersFax , 
	 			@PersPager ,
	 			@PersCellPhone ,
	 			@PersHomePhone ,
	 			@PersPrefPhone 


			While (@@sqlstatus != 2)
			Begin
			
			  if (@PersPrefPhone is null OR @PersPrefPhone ="") 

					begin 
						Update dbo.Agent set PMOCTypeCd = Null where PersIDNum = @PersIDNum
					end
            
            else if (@PersPrefPhone = @PersFax ) AND (@PersFax != "")
					begin 
						Update dbo.Agent set PMOCTypeCd = '6FX' where PersIDNum = @PersIDNum
					end

				else if (@PersPrefPhone = @PersPager ) AND (@PersPager != "")

					begin 
						Update dbo.Agent set PMOCTypeCd = '4PP' where PersIDNum = @PersIDNum
					end

				else if (@PersPrefPhone = @PersCellPhone ) AND (@PersCellPhone != "")

					begin 
						Update dbo.Agent set PMOCTypeCd = '3CP' where PersIDNum = @PersIDNum
					end
				else if (@PersPrefPhone = @PersHomePhone ) AND (@PersHomePhone != "")

					begin 
						Update dbo.Agent set PMOCTypeCd = '2HO' where PersIDNum = @PersIDNum
					end
                
               
                else
                
			        begin 
						Update dbo.Agent set PMOCTypeCd = '7OT' where PersIDNum = @PersIDNum
					end
                
    /*            
                --Insert into ManagerDownload to trigger UPDCCR process
                  INSERT INTO dbo.ManagerDownload  
                 ( PersIDNum,   
                   UserCrtd,   
                   DateCrtd,   
                   CASHUpdtInd,   
                   CASHUpdtTS,   
                   SysProcessTS,   
                   CCRUpdtInd,   
                   CCRUpdtTS,   
                   PHHORCEUpdtInd,   
                    PHHORCEUpdtTS )  
                  VALUES (@PersIDNum,   
                      'updccr',   
                       getdate(),   
                       'N',   
                       null,   
                       getdate(),   
                       'N',   
                       null,   
                       'N',   
                       null ) 
      */          
                
                
                Fetch person_cursor INTO  
				    @PersIDNum ,
				    @PersFax , 
	 			    @PersPager ,
	 			    @PersCellPhone ,
	 			    @PersHomePhone ,
	 			    @PersPrefPhone 

			End
		
close person_cursor
Deallocate cursor person_cursor

End


