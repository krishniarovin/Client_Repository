CREATE TABLE dbo.FARole 
(
    FAIDNum  int        NOT NULL,
    FARoleID char(10)   NOT NULL,
    DateCrtd ud_date    NOT NULL,
    UserCrtd ud_user_id NOT NULL,
    DateMdfd ud_date    NOT NULL,
    UserMdfd ud_user_id NOT NULL,
    CONSTRAINT XPK_FARoleXRef
    PRIMARY KEY NONCLUSTERED (FAIDNum,FARoleID)
)
LOCK ALLPAGES
go
GRANT DELETE ON dbo.FARole TO CCRRole
go
GRANT INSERT ON dbo.FARole TO CCRRole
go
GRANT SELECT ON dbo.FARole TO CCRRole
go
GRANT UPDATE ON dbo.FARole TO CCRRole
go
GRANT SELECT ON dbo.FARole TO CCRReadRole
go
IF OBJECT_ID('dbo.FARole') IS NOT NULL
    PRINT '<<< CREATED TABLE dbo.FARole >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dbo.FARole >>>'
go
