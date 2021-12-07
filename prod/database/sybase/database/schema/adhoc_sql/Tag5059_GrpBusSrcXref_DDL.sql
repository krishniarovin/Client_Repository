CREATE TABLE dbo.BusSrcGrpXRef 
(
    ClassNum    int        NOT NULL,
    ClntID      char(7)    NOT NULL,
    SourceGrpCd varchar(5) NOT NULL,
    DateCrtd    ud_date    NOT NULL,
    UserCrtd    ud_user_id NOT NULL,
    DateMdfd    ud_date    NOT NULL,
    UserMdfd    ud_user_id NOT NULL,
    CONSTRAINT XPK_BusSrcGrpXRef
    PRIMARY KEY NONCLUSTERED (ClassNum,ClntID,SourceGrpCd)
)
LOCK ALLPAGES
go
GRANT DELETE ON dbo.BusSrcGrpXRef TO CCRRole
go
GRANT INSERT ON dbo.BusSrcGrpXRef TO CCRRole
go
GRANT SELECT ON dbo.BusSrcGrpXRef TO CCRRole
go
GRANT UPDATE ON dbo.BusSrcGrpXRef TO CCRRole
go
GRANT UPDATE ON dbo.BusSrcGrpXRef TO CCRReadRole
go
IF OBJECT_ID('dbo.BusSrcGrpXRef') IS NOT NULL
    PRINT '<<< CREATED TABLE dbo.BusSrcGrpXRef >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dbo.BusSrcGrpXRef >>>'
go
