Create Proc AgentStatus  as
Begin 
   Declare TFN Cursor For
  Select TollFreeNumber,VDNNumber,ClntID,DateCrtd ,ExpDate,TPAgent 
  From tempdb..AgentStatusHistory
  
  Declare @TFN  char(10),
          @VDNNumber char(10),        
          @ClntID   char(7),        
          @DateCrtd datetime,
          @ExpDate datetime,
          @TPAgent  char(1),
          @Agentcount Numeric
  
 
  Open TFN
  Select 'Procedure AgentStatus Start'
  Fetch TFN into @TFN,@VDNNumber,@ClntID,@DateCrtd,@ExpDate,@TPAgent
  Select @TFN,@VDNNumber,@ClntID,@DateCrtd,@ExpDate,@TPAgent
  While (@@sqlstatus = 0) 
  Begin  --Cursor  1
 
 
       IF @ExpDate is Not Null
       begin  -- 2
          --To check whether record already exist in  dbo.AgentStatusHistory

         Select @Agentcount = count(1) 
         From  dbo.AgentStatusHistory a,ClientPhone b
         Where a.PersIDNum =  b.PersIDNum And
               PhoneNbr = @TFN And 
               VDNNbr =  @VDNNumber and ClntID = @ClntID and b.PersIDNum is Not Null And   
               TPAgent =@TPAgent And YNFlag = 'Y'

          IF @Agentcount = 0 
          Begin 
                Insert dbo.AgentStatusHistory 
                    ( 	PersIDNum,
                      	UserCrtd,
            		     TPAgent,
            		     YNFlag,
            		     DateCrtd )
          	   select PersIDNum,
          		     UserCrtd,
                        TPAgent =@TPAgent,
          		     'Y',
                        DateCrtd = @DateCrtd
                 From ClientPhone where PhoneNbr = @TFN and VDNNbr =  @VDNNumber and ClntID = @ClntID and PersIDNum is Not Null
          IF @@sqlstatus = 0 
          Begin
              --To check whether record already exist in  dbo.AgentStatusHistory
          Select '1. Record Inserted for Y  ' + @TFN
          Select @Agentcount = count(1) 
          From  dbo.AgentStatusHistory a,ClientPhone b
          Where a.PersIDNum =  b.PersIDNum And
               PhoneNbr = @TFN And 
               VDNNbr =  @VDNNumber and ClntID = @ClntID and b.PersIDNum is Not Null And   
               TPAgent =@TPAgent And YNFlag = 'N'

          IF @Agentcount = 0 
           Begin 
        
          	insert dbo.AgentStatusHistory 
                       ( PersIDNum,
                         UserCrtd,
                         TPAgent,
                         YNFlag,
                         DateCrtd )
                       select PersIDNum,
                              UserCrtd,
                              TPAgent =@TPAgent,
                                 'N',
                              DateCrtd = @ExpDate
                        From ClientPhone 
						where PhoneNbr = @TFN and VDNNbr =  @VDNNumber and ClntID = @ClntID and PersIDNum is Not Null
						
			Select '2. Record Inserted for N  '  + @TFN			
		   End  -- Second Insert
		 END  -- First Insert Succ
		END  -- First Insert 				
        end  --  2 IF @ExpDate is Not Null
 
  ELSE

    BEGIN
	      Select @Agentcount = count(1) 
          From  dbo.AgentStatusHistory a,ClientPhone b
          Where a.PersIDNum =  b.PersIDNum And
               PhoneNbr = @TFN And 
               VDNNbr =  @VDNNumber and ClntID = @ClntID and b.PersIDNum is Not Null And   
               TPAgent =@TPAgent And YNFlag = 'Y'
           IF @Agentcount = 0 
		   Begin
               Insert dbo.AgentStatusHistory 
        	   ( PersIDNum,
                 UserCrtd,
                 TPAgent,
                 YNFlag,
                 DateCrtd )
                 select PersIDNum,
                        UserCrtd,
                        TPAgent = @TPAgent,
                        'Y',
                       DateCrtd = @DateCrtd
                    from ClientPhone where PhoneNbr = @TFN and VDNNbr =  @VDNNumber and ClntID = @ClntID and PersIDNum is Not Null
             Select '3. Record Inserted for Y with Exp Date Null  '  + @TFN   					
           END
      END   
       Fetch TFN into @TFN,@VDNNumber,@ClntID,@DateCrtd,@ExpDate,@TPAgent
 end   --While (@@sqlstatus = 0) 
Close TFN
end
  