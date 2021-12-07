--delete sql to remove extra records from agent status history table--

delete from AgentStatusHistory
where PersIDNum in (484030,532339,541459,546282)
and YNFlag='Y'
and TPAgent='T'

--insert sql for inserting data into agent status history for old agents--

insert into AgentStatusHistory values (809176,User,'05/13/2008','N','T')

--insert sql for inserting data into agent status history for new agents--

insert into AgentStatusHistory values (775956,User,'05/13/2008','Y','T')
insert into AgentStatusHistory values (777264,User,'05/13/2008','Y','T')
insert into AgentStatusHistory values (785535,User,'05/13/2008','Y','T')
insert into AgentStatusHistory values (779063,User,'05/13/2008','Y','T')
insert into AgentStatusHistory values (876066,User,'05/13/2008','Y','T')