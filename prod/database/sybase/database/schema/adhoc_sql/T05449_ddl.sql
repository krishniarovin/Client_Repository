Alter table Agent
  Add PHHAgent char(1) default 'N' Null

go


CREATE TABLE dbo.SysPrefBusSrc 
(
    PreferenceType varchar(15) NOT NULL,
    Preference     varchar(15) NOT NULL,
    Description    T_ud_comments NOT NULL,
    ClassIDNum     T_ud_id_num   NOT NULL,
    UserCrtd       T_ud_user_id  NOT NULL,
    DateCrtd       T_ud_datetime NOT NULL,
    UserMdfd       T_ud_user_id  NULL,
    DateMdfd       T_ud_datetime NULL,
    CONSTRAINT PK_SysPrefBusSrc
    PRIMARY KEY CLUSTERED (PreferenceType,Preference,ClassIDNum)
)
LOCK ALLPAGES
go
create nonclustered index NCL_SysPrefBusSrc  on SysPrefBusSrc(ClassIDNum)
go
GRANT DELETE ON dbo.SysPrefBusSrc TO CCRRole
go
GRANT INSERT ON dbo.SysPrefBusSrc TO CCRRole
go
GRANT SELECT ON dbo.SysPrefBusSrc TO CCRRole
go
GRANT UPDATE ON dbo.SysPrefBusSrc TO CCRRole
go
GRANT SELECT ON dbo.SysPrefBusSrc TO CCRReadRole
go

IF OBJECT_ID('dbo.SysPrefBusSrc') IS NOT NULL
    PRINT '<<< CREATED TABLE dbo.SysPrefBusSrc >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE dbo.SysPrefBusSrc >>>'
go