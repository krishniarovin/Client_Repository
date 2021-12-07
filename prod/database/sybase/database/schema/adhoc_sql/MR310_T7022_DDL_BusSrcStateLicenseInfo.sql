CREATE TABLE BusSrcStateLicenseInfo 
(
    ClassNum  int        NOT NULL,
    LoanType       varchar(4) NOT NULL,
    StateCd      varchar(5) NOT NULL,
    LicenseEffDate datetime   NOT NULL,
    LicenseExpDate datetime   NOT NULL,
    UserCrtd       ud_user_id NOT NULL,
    DateCrtd       ud_date    NOT NULL,
    UserMdfd       ud_user_id NOT NULL,
    DateMdfd       ud_date    NOT NULL,
    CONSTRAINT XPKBusSrcStateLicInfo
    PRIMARY KEY CLUSTERED (ClassNum,LoanType,StateCd)
)

create trigger tI_BusSrcStateLicenseInfo on BusSrcStateLicenseInfo for Insert as
/* Vivek Barde Aug 07 2007  */
/* Insert trigger on BusSrcStateLicenseInfo */
begin
  declare  @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @errmsg  varchar(255)

  select @numrows = @@rowcount

if update(ClassNum)
    begin
       if (select count(*)
           from   Classification t1, inserted t2
           where  t1.ClassNum = t2.ClassNum) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "Classification". Cannot create child in "BusSrcXRef".'
             goto error
          end
    end
    
if update(StateCd)
    begin
       if (select count(*)
           from   dbo.Area t1, inserted t2
           where  t2.StateCd = t1.AreaCd And ClassIDNum=1003) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "Area". Cannot create child in "BusSrcXRef".'
             goto error
          end
    end

   update BusSrcStateLicenseInfo
   set UserMdfd = suser_name(),
       DateMdfd = getdate()
    from inserted, BusSrcStateLicenseInfo
       where BusSrcStateLicenseInfo.ClassNum = inserted.ClassNum
       and   BusSrcStateLicenseInfo.LoanType = inserted.LoanType
       and   BusSrcStateLicenseInfo.StateCd = inserted.StateCd
   return
error:
    raiserror @errno @errmsg
    rollback transaction
end
go

create trigger tU_BusSrcStateLicenseInfo on BusSrcStateLicenseInfo for Update as
/* Vivek Barde Aug 07 2007  */
/* Insert trigger on BusSrcStateLicenseInfo */
begin
  declare  @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno   int,
           @errmsg  varchar(255)

  select @numrows = @@rowcount

if update(ClassNum)
    begin
       if (select count(*)
           from   Classification t1, inserted t2
           where  t1.ClassNum = t2.ClassNum) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "Classification". Cannot create child in "BusSrcXRef".'
             goto error
          end
    end
    
if update(StateCd)
    begin
       if (select count(*)
           from   dbo.Area t1, inserted t2
           where  t2.StateCd = t1.AreaCd and ClassIDNum=1003 ) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "Area". Cannot create child in "BusSrcXRef".'
             goto error
          end
    end

   update BusSrcStateLicenseInfo
   set UserMdfd = suser_name(),
       DateMdfd = getdate()
    from inserted, BusSrcStateLicenseInfo
       where BusSrcStateLicenseInfo.ClassNum = inserted.ClassNum
       and   BusSrcStateLicenseInfo.LoanType = inserted.LoanType
       and   BusSrcStateLicenseInfo.StateCd = inserted.StateCd
   return
error:
    raiserror @errno @errmsg
    rollback transaction
end
go
IF OBJECT_ID('dbo.tU_BusSrcStateLicenseInfo') IS NOT NULL
    PRINT '<<< CREATED TRIGGER dbo.tU_BusSrcStateLicenseInfo >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER dbo.tU_BusSrcStateLicenseInfo >>>'
go



