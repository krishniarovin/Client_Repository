IF OBJECT_ID('dbo.t_Client_I') IS NOT NULL
BEGIN
    DROP TRIGGER dbo.t_Client_I
    IF OBJECT_ID('dbo.t_Client_I') IS NOT NULL
        PRINT '<<< FAILED DROPPING TRIGGER dbo.t_Client_I >>>'
    ELSE
        PRINT '<<< DROPPED TRIGGER dbo.t_Client_I >>>'
END
go
/*  Insert trigger "t_Client_I" for table "Client"  */
create trigger t_Client_I on Client for insert as
begin
    declare
       @numrows  int,
       @numnull  int,
       @errno    int,
       @errmsg   varchar(255)

    select  @numrows = @@rowcount
    if @numrows = 0
       return


    /*  Parent "Company" must exist when inserting a child in "Client"  */
    if update(CompIDNum)
    begin
       if (select count(*)
           from   Company t1, inserted t2
           where  t1.CompIDNum = t2.CompIDNum) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "Company". Cannot create child in "Client".'
             goto error
          end
    end

    /*  Parent "PHHMortgageName" must exist when inserting a child in "Client"  */
    if update(PHHNameIDNum)
    begin
       if (select count(*)
           from   PHHMortgageName t1, inserted t2
           where  t1.PHHNameIDNum = t2.PHHNameIDNum) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "PHHMortgageName". Cannot create child in "Client".'
             goto error
          end
    end

    /*  Parent "PHHManager" must exist when inserting a child in "Client"  */
    if update(CurrAcctMgrIDNum)
    begin
       select @numnull = (select count(*)
                          from   inserted
                          where  CurrAcctMgrIDNum is null)
       if @numnull != @numrows
          if (select count(*)
              from   PHHManager t1, inserted t2
              where  t1.PersIDNum = t2.CurrAcctMgrIDNum
                   and    getdate() between t1.BeginEffDate and t1.EndEffDate) != @numrows - @numnull
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "PHHManager". Cannot create child in "Client".'
             goto error
          end
    end

    /*  Parent "PHHManager" must exist when inserting a child in "Client"  */
    if update(PrevAcctMgrIDNum)
    begin
       select @numnull = (select count(*)
                          from   inserted
                          where  PrevAcctMgrIDNum is null)
       if @numnull != @numrows
          if (select count(*)
              from   PHHManager t1, inserted t2
              where  t1.PersIDNum = t2.PrevAcctMgrIDNum
              and    getdate() between t1.BeginEffDate and t1.EndEffDate) != @numrows - @numnull
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "PHHManager". Cannot create child in "Client".'
             goto error
          end
    end

        /*  Parent "Code (Territory)" must exist when inserting a child in "TerritoryBusContact"  */
    if update(Territory)
    begin
       if (select count(*)
           from   Code t1, inserted t2
           where  t1.CodeValue = t2.Territory
           and t1.CodeType='TERRITORY' ) != @numrows

          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "Code (Territory)". Cannot create child in "TerritoryBusContact".'
             goto error
          end
    end

        update Client
        set UserCrtd = suser_name(),
            DateCrtd = getdate(),
            UserMdfd = suser_name(),
            DateMdfd = getdate()
        from inserted, Client
        where
           Client.ClntID = inserted.ClntID








    return

/*  Errors handling  */
error:
    raiserror @errno @errmsg
    rollback  transaction
end
go
IF OBJECT_ID('dbo.t_Client_I') IS NOT NULL
    PRINT '<<< CREATED TRIGGER dbo.t_Client_I >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER dbo.t_Client_I >>>'
go

