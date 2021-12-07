IF OBJECT_ID('dbo.t_Client_U') IS NOT NULL
BEGIN
    DROP TRIGGER dbo.t_Client_U
    IF OBJECT_ID('dbo.t_Client_U') IS NOT NULL
        PRINT '<<< FAILED DROPPING TRIGGER dbo.t_Client_U >>>'
    ELSE
        PRINT '<<< DROPPED TRIGGER dbo.t_Client_U >>>'
END
go
/*  Update trigger "t_Client_U" for table "Client"  */
create trigger t_Client_U on Client for update as
begin
   declare
      @numrows  int,
      @numnull  int,
      @errno    int,
      @errmsg   varchar(255)

      select  @numrows = @@rowcount
      if @numrows = 0
         return


      /*  Parent "Company" must exist when updating a child in "Client"  */
      if update(CompIDNum)
      begin
         if (select count(*)
             from   Company t1, inserted t2
             where  t1.CompIDNum = t2.CompIDNum) != @numrows
            begin
               select @errno  = 30003,
                      @errmsg = '"Company" does not exist. Cannot modify child in "Client".'
               goto error
            end
      end

      /*  Parent "PHHMortgageName" must exist when updating a child in "Client"  */
      if update(PHHNameIDNum)
      begin
         if (select count(*)
             from   PHHMortgageName t1, inserted t2
             where  t1.PHHNameIDNum = t2.PHHNameIDNum) != @numrows
            begin
               select @errno  = 30003,
                      @errmsg = '"PHHMortgageName" does not exist. Cannot modify child in "Client".'
               goto error
            end
      end

      /*  Parent "PHHManager" must exist when updating a child in "Client"  */
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
               select @errno  = 30003,
                      @errmsg = '"PHHManager" does not exist. Cannot modify child in "Client".'
               goto error
            end
      end

      /*  Parent "PHHManager" must exist when updating a child in "Client"  */
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
               select @errno  = 30003,
                      @errmsg = '"PHHManager" does not exist. Cannot modify child in "Client".'
               goto error
            end
      end

      /*  Cannot modify parent code in "Client" if children still exist in "WireTransfer"  */
      if update(ClntID)
      begin
         if exists (select 1
                    from   WireTransfer t2, inserted i1, deleted d1
                    where  t2.ClntID = d1.ClntID
                     and  (i1.ClntID != d1.ClntID))
            begin
               select @errno  = 30005,
                      @errmsg = 'Children still exist in "WireTransfer". Cannot modify parent code in "Client".'
               goto error
            end
      end

      /*  Modify parent code of "Client" for all children in "BusSrcXRef"  */
      if update(ClntID)
      begin
         update BusSrcXRef
          set   ClntID = i1.ClntID
         from   BusSrcXRef t2, inserted i1, deleted d1
         where  t2.ClntID = d1.ClntID
          and  (i1.ClntID != d1.ClntID)
      end

      /*  Modify parent code of "Client" for all children in "MarketAccessAgreement"  */
      if update(ClntID)
      begin
         update MarketAccessAgreement
          set   ClntID = i1.ClntID
         from   MarketAccessAgreement t2, inserted i1, deleted d1
         where  t2.ClntID = d1.ClntID
          and  (i1.ClntID != d1.ClntID)
      end

      /*  Modify parent code of "Client" for all children in "Address"  */
      if update(ClntID)
      begin
         update Address
          set   ClntID = i1.ClntID
         from   Address t2, inserted i1, deleted d1
         where  t2.ClntID = d1.ClntID
          and  (i1.ClntID != d1.ClntID)
      end

      /*  Modify parent code of "Client" for all children in "Contract"  */
      if update(ClntID)
      begin
         update Contract
          set   ClntID = i1.ClntID
         from   Contract t2, inserted i1, deleted d1
         where  t2.ClntID = d1.ClntID
          and  (i1.ClntID != d1.ClntID)
      end

      /*  Modify parent code of "Client" for all children in "ClientPhone"  */
      if update(ClntID)
      begin
         update ClientPhone
          set   ClntID = i1.ClntID
         from   ClientPhone t2, inserted i1, deleted d1
         where  t2.ClntID = d1.ClntID
          and  (i1.ClntID != d1.ClntID)
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
    set UserMdfd = suser_name(),
        DateMdfd = getdate()
    from inserted, Client
    where Client.ClntID = inserted.ClntID

      return

/*  Errors handling  */
error:
    raiserror @errno @errmsg
    rollback  transaction
end
go
IF OBJECT_ID('dbo.t_Client_U') IS NOT NULL
    PRINT '<<< CREATED TRIGGER dbo.t_Client_U >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER dbo.t_Client_U >>>'
go

