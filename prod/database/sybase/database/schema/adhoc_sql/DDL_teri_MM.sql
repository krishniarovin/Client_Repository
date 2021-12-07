CREATE TABLE dbo.TerritoryBusContact
(
    PersIDNum   int      NOT NULL,
    Territory   char(15)      NOT NULL,
    DateCrtd    T_ud_datetime    NOT NULL,
    UserCrtd    T_ud_user_id     NOT NULL,
    DateMdfd    T_ud_datetime    NOT NULL,
    UserMdfd    T_ud_user_id     NOT NULL,
    BgnEffDate  T_ud_datetime    NOT NULL,
    EndEffDate  T_ud_datetime    NOT NULL,
    Primary Key (PersIDNum,Territory,BgnEffDate)
   
)
grant select, insert, update, delete on TerritoryBusContact to CCRRole
go
grant select on TerritoryBusContact to CCRReadRole
go
IF EXISTS (SELECT * FROM sysindexes WHERE id=OBJECT_ID('dbo.TerritoryBusContact') AND name='NCL_TerritoryBusContact')
BEGIN
    DROP INDEX Client.NCL_TerritoryBusContact
    IF EXISTS (SELECT * FROM sysindexes WHERE id=OBJECT_ID('dbo.TerritoryBusContact') AND name='NCL_TerritoryBusContact')
        PRINT '<<< FAILED DROPPING INDEX Client.NCL_TerritoryBusContact >>>'
    ELSE
        PRINT '<<< DROPPED INDEX Client.NCL_TerritoryBusContact >>>'
END
go
CREATE NONCLUSTERED INDEX NCL_TerritoryBusContact
    ON dbo.TerritoryBusContact(Territory)
go
IF EXISTS (SELECT * FROM sysindexes WHERE id=OBJECT_ID('dbo.TerritoryBusContact') AND name='NCL_TerritoryBusContact')
    PRINT '<<< CREATED INDEX dbo.TerritoryBusContact.NCL_TerritoryBusContact >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX dbo.TerritoryBusContact.NCL_TerritoryBusContact >>>'
go
