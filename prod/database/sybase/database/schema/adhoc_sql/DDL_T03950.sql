create table tempdb..AgentStatusHistory 
(   TollFreeNumber   char(10) NULL,
    VDNNumber         char(10) NULL,
    BusSource         int NULL,
    ClntID        char(7) NULl,
    ClassDesc  varchar(90)NULL, 
    DateCrtd    datetime  NULL,
    ExpDate     datetime  NULL,
    TPAgent     char(1)   NULL,
 )