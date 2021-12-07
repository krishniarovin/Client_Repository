
--Data conversion Nickname to Team Name

  UPDATE dbo.Agent  
     SET AgencyTeam = AgentNickName  
   WHERE dbo.Agent.TopAgentInd = 1              ;

  UPDATE dbo.Agent  
     SET AgentNickName = null  
   WHERE dbo.Agent.TopAgentInd = 1              ;



