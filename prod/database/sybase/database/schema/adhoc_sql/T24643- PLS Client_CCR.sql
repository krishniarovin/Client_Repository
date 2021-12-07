/*****************************T24643- PLS Client - CCR*****************************/

alter table Client
add Question23_ind   char(1) null 
go

IF OBJECT_ID('dbo.R_YES_NO_NULL') IS NOT NULL
BEGIN
    DROP RULE dbo.R_YES_NO_NULL
    IF OBJECT_ID('dbo.R_YES_NO_NULL') IS NOT NULL
        PRINT '<<< FAILED DROPPING RULE dbo.R_YES_NO_NULL >>>'
    ELSE
        PRINT '<<< DROPPED RULE dbo.R_YES_NO_NULL >>>'
END
go
CREATE RULE dbo.R_YES_NO_NULL AS @col IN ('N', 'Y', 'n', 'y',NULL)
go
IF OBJECT_ID('dbo.R_YES_NO_NULL') IS NOT NULL
    PRINT '<<< CREATED RULE dbo.R_YES_NO_NULL >>>'
ELSE
    PRINT '<<< FAILED CREATING RULE dbo.R_YES_NO_NULL >>>'
go

IF OBJECT_ID('Client') IS NOT NULL
EXEC sp_bindrule 'dbo.R_YES_NO_NULL','Client.Question23_ind'
Go
