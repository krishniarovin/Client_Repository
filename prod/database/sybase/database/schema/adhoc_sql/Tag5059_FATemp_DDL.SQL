CREATE TABLE guest.FATemp 
(
    EmployeeID varchar(30)  NOT NULL,
    BetaID     char(10)     NULL,
    Name       varchar(100) NOT NULL,
    PhoneNbr   varchar(15)  NULL,
    FaxNbr     varchar(15)  NULL,
    EmailID    varchar(60)  NULL,
    BranchCode varchar(15)  NULL,
    BranchName varchar(60)  NULL,
    State      char(2)      NULL,
    GrpID      char(3)      NULL
)
LOCK ALLPAGES
go
GRANT DELETE ON guest.FATemp TO CCRRole
go
GRANT INSERT ON guest.FATemp TO CCRRole
go
GRANT REFERENCES ON guest.FATemp TO CCRRole
go
GRANT SELECT ON guest.FATemp TO CCRRole
go
GRANT UPDATE ON guest.FATemp TO CCRRole
go
GRANT DELETE ON guest.FATemp TO KapoorN
go
GRANT INSERT ON guest.FATemp TO KapoorN
go
GRANT REFERENCES ON guest.FATemp TO KapoorN
go
GRANT SELECT ON guest.FATemp TO KapoorN
go
GRANT UPDATE ON guest.FATemp TO KapoorN
go
GRANT DELETE ON guest.FATemp TO SarkarS
go
GRANT INSERT ON guest.FATemp TO SarkarS
go
GRANT REFERENCES ON guest.FATemp TO SarkarS
go
GRANT SELECT ON guest.FATemp TO SarkarS
go
GRANT UPDATE ON guest.FATemp TO SarkarS
go
IF OBJECT_ID('guest.FATemp') IS NOT NULL
    PRINT '<<< CREATED TABLE guest.FATemp >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE guest.FATemp >>>'
go
