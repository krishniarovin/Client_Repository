create table #AgentList (
ColNum numeric,
PersIDNum1 numeric,
PersIDNum2 numeric,
ClntID char(7)
)

create proc proc_agent_info_update as
Begin
/*This proc is created to correct Premier Agent information coming from NRT through Fortress process.*/
Declare
        @PersIDNum1 numeric,
        @PersIDNum2 numeric,
        @ClntID char(7),
        @count1 numeric,
        @cnt numeric,
        @errormsg char(255),
        @PersPrefPhone varchar(21),
        @PersFax varchar(21),
        @PersPager varchar(21),
        @PersCellPhone varchar(21),
        @PersHomePhone varchar(21), 
        @PersEmailAddr varchar(255),
        @PersHomePage varchar(255),
        @AgentTimeZone varchar(5),
        @AgentBirthDate datetime ,
        @PMOCTypeCd varchar(15),
        @AgentNickName varchar(30),
        @TopAgentInd bit,
        @PHHAgent varchar(15),
        @TopAgentIndNew bit,
        @PHHAgentNew varchar(15),
	@ClientBusContactID int

    Begin
    /*Expiration of current PHH Agent */
    
            Update Person
            set EndEffDate = getdate()
            where PersIDNum in (select PersIDNum1 from #AgentList) 
        
             if @@error !=0
             begin
              select @errormsg = "Update failed for Person for current PHH Agent" 
             end
	    
	    Update ClientBusContact
            set ExpDate=getdate()
            where ClntID in (select ClntID from #AgentList)
            and PersIDNum in (select PersIDNum1 from #AgentList)
        
              if @@error !=0
              begin
                select @errormsg = "Update failed for ClientBusContact for current PHH Agent" 
              end
   
     End
    
    select @count1 = count(*) from #AgentList
    select @cnt = 1

        while (@cnt <= @count1)
        Begin
		/*Update of information for New PHH Agent Unique Nums# */
    
	        select @PersPrefPhone=PersPrefPhone, 
	               @PersFax=PersFax,
	               @PersPager=PersPager, 
	               @PersCellPhone=PersCellPhone,
	               @PersHomePhone=PersHomePhone, 
	               @PersEmailAddr=PersEmailAddr, 
	               @PersHomePage=PersHomePage from Person where PersIDNum=(select PersIDNum1
	               from #AgentList where ColNum=@cnt)
	    
	        update Person
	        set 
	        PersPrefPhone=@PersPrefPhone,PersFax=@PersFax,PersPager=@PersPager,
	        PersCellPhone=@PersCellPhone,PersHomePhone=@PersHomePhone,
	        PersEmailAddr=@PersEmailAddr,PersHomePage=@PersHomePage
	        where PersIDNum=(select PersIDNum2 from #AgentList  where ColNum=@cnt)
	    
	        if @@error !=0
	              begin
	                select @errormsg = "Update failed for Person for New PHH Agent" 
	              end
	    
	        select @AgentTimeZone=AgentTimeZone,
	               @AgentBirthDate=AgentBirthDate,
	               @PMOCTypeCd=PMOCTypeCd,
	               @AgentNickName=AgentNickName,
	               @TopAgentInd=TopAgentInd,
	               @PHHAgent=PHHAgent from Agent where PersIDNum=(select PersIDNum1
	               from #AgentList where ColNum=@cnt)
	               
	        update Agent
	        set 
	        AgentTimeZone=@AgentTimeZone,
	        AgentBirthDate=@AgentBirthDate,
	        PMOCTypeCd=@PMOCTypeCd,
		AgentNickName=@AgentNickName,
	        TopAgentInd=@TopAgentInd,
	        PHHAgent=@PHHAgent
	        where PersIDNum=(select PersIDNum2 from #AgentList  where ColNum=@cnt)
	    
	        if @@error !=0
	              begin
	                select @errormsg = "Update failed for Agent for New PHH Agent" 
	              end
	        
	        select @PersIDNum1=PersIDNum1,
	               @PersIDNum2=PersIDNum2,
		       @ClntID=ClntID
	        from #AgentList where ColNum=@cnt
	             
	        Update Agent
	        set TopAgentInd =0,PHHAgent=null
	        where PersIDNum in (select PersIDNum1 from #AgentList where ColNum=@cnt)
	            
	              if @@error !=0
	              begin
	                select @errormsg = "Update failed for Agent for current PHH Agent" 
	              end
	              
	    
	        update PHHManager
	        set EndEffDate='12/31/2099'
	        where PersIDNum=(select PersIDNum2 from #AgentList  where ColNum=@cnt)
	    
	        if @@error !=0
	              begin
	                select @errormsg = "Update failed for PHHManager for New PHH Agent" 
	              end
	    
	        /*update client-agent info*/

        	update ClientBusContact
        	set ExpDate='12/31/2099'
        	where PersIDNum=(select PersIDNum2 from #AgentList  where ColNum=@cnt)
        
        	if not exists 
        	(select cb.PersIDNum from ClientBusContact cb,#AgentList a 
        	where cb.PersIDNum = a.PersIDNum2
        	and cb.ClntID = a.ClntID
        	and ColNum=@cnt)
        
        	Begin
        		exec @ClientBusContactID =  get_next_uniqidnum "BUSCONT"
        
        		insert into ClientBusContact(ClientBusContactID,ClntID,PersIDNum,EffDate,ExpDate,UserCrtd,DateCrtd,UserMdfd,DateMdfd,TempFlag) 
        		select @ClientBusContactID,@ClntID,@PersIDNum2,getdate(),'12/31/2099',User,getdate(),User,getdate(),'N'
        		from #AgentList
        		where ColNum=@cnt 
        
        		if @@error !=0
              		begin
                	select @errormsg = "Update/Insert failed for ClientBusContact for New PHH Agent" 
              		end
        
        	End
	    
	        select @PersIDNum1=PersIDNum1,
	               @PersIDNum2=PersIDNum2 from #AgentList where ColNum=@cnt
	    
	        update ClientPhone
	        set PersIDNum=@PersIDNum2
	        where PersIDNum =@PersIDNum1
	    
	        if @@error !=0
	              begin
	                select @errormsg = "Update failed for ClientPhone for New PHH Agent" 
	              end
	              
	        /* Insert into ClientDownload table*/
	        
	        select @ClntID=ClntID from #AgentList where ColNum=@cnt 
	        
	        insert into ClientDownload
	        values(@ClntID,'N',null,'N',null,null,'N',null,null,null,null,null,User,getdate(),null,null)
	            
	            if @@error !=0
	              begin
	                select @errormsg = "Insert failed for ClientDownload table" 
	              end
	        
	        /* Insert into ManagerDownload table*/
	        
	        select @PersIDNum1=PersIDNum1,
	               @PersIDNum2=PersIDNum2 from #AgentList where ColNum=@cnt
	        
	        insert into ManagerDownload values (@PersIDNum1,User,getdate(),'N',null,null,'N',null,'N',null)
	        
	        if @@error !=0
	              begin
	                select @errormsg = "Insert failed for ManagerDownload table for current PHH Agent" 
	              end
	              
	        insert into ManagerDownload values (@PersIDNum2,User,getdate(),'N',null,null,'N',null,'N',null) 
	        
	        if @@error !=0
	              begin
	                select @errormsg = "Insert failed for ManagerDownload table for New PHH Agent" 
	              end
              
        select @cnt=@cnt+1
    
        End
        
End
Go