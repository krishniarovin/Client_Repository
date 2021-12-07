IF OBJECT_ID('dbo.tI_TerritoryBusContact') IS NOT NULL
BEGIN
    DROP TRIGGER dbo.tI_TerritoryBusContact
    IF OBJECT_ID('dbo.tI_TerritoryBusContact') IS NOT NULL
        PRINT '<<< FAILED DROPPING TRIGGER dbo.tI_TerritoryBusContact >>>'
    ELSE
        PRINT '<<< DROPPED TRIGGER dbo.tI_TerritoryBusContact >>>'
END
go
create trigger tI_TerritoryBusContact on TerritoryBusContact for insert as
begin
    declare
       @numrows  int,
       @numnull  int,
       @errno    int,
       @errmsg   varchar(255)

    select  @numrows = @@rowcount
    if @numrows = 0
       return


    /*  Parent "Person" must exist when inserting a child in "TerritoryBusContact"  */
    if update(PersIDNum)
    begin
       if (select count(*)
           from   Person t1, inserted t2
           where  t1.PersIDNum = t2.PersIDNum) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "Person". Cannot create child in "TerritoryBusContact".'
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


    update TerritoryBusContact
    set UserCrtd = suser_name(),
        DateCrtd = getdate()
    from inserted, TerritoryBusContact
    where      TerritoryBusContact.PersIDNum = inserted.PersIDNum
    and        TerritoryBusContact.Territory = inserted.Territory
    and        TerritoryBusContact.BgnEffDate = inserted.BgnEffDate


    return

/*  Errors handling  */
error:
    raiserror @errno @errmsg
    rollback  transaction
end
go
IF OBJECT_ID('dbo.tI_TerritoryBusContact') IS NOT NULL
    PRINT '<<< CREATED TRIGGER dbo.tI_TerritoryBusContact >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER dbo.tI_TerritoryBusContact >>>'
go

