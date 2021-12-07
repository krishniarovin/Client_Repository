CREATE TABLE dbo.FAInfo 
(
    FAIDNum      int          NOT NULL,
    FAEmployeeID varchar(30)  NOT NULL,
    SourceGrpCd  varchar(5)   NOT NULL,
    FAName       varchar(100) NOT NULL,
    FAPhoneNbr   varchar(10)  NULL,
    FAFaxNbr     varchar(10)  NULL,
    FAEmailID    varchar(60)  NULL,
    FAState      char(2)      NULL,
    BranchCd     varchar(15)  NULL,
    BranchName   varchar(60)  NULL,
    DateCrtd     ud_date      NOT NULL,
    UserCrtd     ud_user_id   NOT NULL,
    DateMdfd     ud_date      NOT NULL,
    UserMdfd     ud_user_id   NOT NULL,
    CONSTRAINT XPK_FAInfo
    PRIMARY KEY NONCLUSTERED (FAEmployeeID,SourceGrpCd)
)
LOCK ALLPAGES
go
GRANT SELECT ON dbo.FAInfo TO CCRReadRole
go
GRANT DELETE ON dbo.FAInfo TO CCRRole
go
GRANT INSERT ON dbo.FAInfo TO CCRRole
go
GRANT SELECT ON dbo.FAInfo TO CCRRole
go
GRANT UPDATE ON dbo.FAInfo TO CCRRole
go
IF OBJECT_ID('dbo.FAInfo') IS NOT NULL
    PRINT '<<< CREATED TABLE dbo.FAInfo >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dbo.FAInfo >>>'
go
