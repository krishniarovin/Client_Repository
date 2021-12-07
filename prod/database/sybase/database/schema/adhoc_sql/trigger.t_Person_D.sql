IF OBJECT_ID('dbo.t_Person_D') IS NOT NULL
BEGIN
    DROP TRIGGER dbo.t_Person_D
    IF OBJECT_ID('dbo.t_Person_D') IS NOT NULL
        PRINT '<<< FAILED DROPPING TRIGGER dbo.t_Person_D >>>'
    ELSE
        PRINT '<<< DROPPED TRIGGER dbo.t_Person_D >>>'
END
go
/*  Delete trigger "t_Person_D" for table "Person"  */
create trigger t_Person_D on Person for delete as
begin
    declare
       @numrows  int,
       @errno    int,
       @errmsg   varchar(255)

    select  @numrows = @@rowcount
    if @numrows = 0
       return


    /*  Cannot delete parent "Person" if children still exist in "Contact"  */
    if exists (select 1
               from   Contact t2, deleted t1
               where  t2.PersIDNum = t1.PersIDNum)
       begin
          select @errno  = 30006,
                 @errmsg = 'Children still exist in "Contact". Cannot delete parent "Person".'
          goto error
       end

    /*  Cannot delete parent "Person" if children still exist in "PersonEmailXRef"  */
    if exists (select 1
               from   PersonEmailXRef t2, deleted t1
               where  t2.PersIDNum = t1.PersIDNum)
       begin
          select @errno  = 30006,
                 @errmsg = 'Children still exist in "PersonEmailXRef". Cannot delete parent "Person".'
          goto error
       end

    /*  Cannot delete parent "Person" if children still exist in "PersonPhoneXRef"  */
    if exists (select 1
               from   PersonPhoneXRef t2, deleted t1
               where  t2.PersIDNum = t1.PersIDNum)
       begin
          select @errno  = 30006,
                 @errmsg = 'Children still exist in "PersonPhoneXRef". Cannot delete parent "Person".'
          goto error
       end

    /*  Cannot delete parent "Person" if children still exist in "PHHManager"  */
    if exists (select 1
               from   PHHManager t2, deleted t1
               where  t2.PersIDNum = t1.PersIDNum)
       begin
          select @errno  = 30006,
                 @errmsg = 'Children still exist in "PHHManager". Cannot delete parent "Person".'
          goto error
       end

    /*  Cannot delete parent "Person" if children still exist in "ClientBusContact"  */
    if exists (select 1
               from   ClientBusContact t2, deleted t1
               where  t2.PersIDNum = t1.PersIDNum)
       begin
          select @errno  = 30006,
                 @errmsg = 'Children still exist in "ClientBusContact". Cannot delete parent "Person".'
          goto error
       end

    /*  Cannot delete parent "Person" if children still exist in "TerritoryBusContact"  */
    -- Add 10-17-05 Lloyd Sargeant
    if exists (select 1
               from   TerritoryBusContact t2, deleted t1
               where  t2.PersIDNum = t1.PersIDNum)
       begin
          select @errno  = 30006,
                 @errmsg = 'Children still exist in "TerritoryBusContact". Cannot delete parent "Person".'
          goto error
       end

    return

/*  Errors handling  */
error:
    raiserror @errno @errmsg
    rollback  transaction
end
go
IF OBJECT_ID('dbo.t_Person_D') IS NOT NULL
    PRINT '<<< CREATED TRIGGER dbo.t_Person_D >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER dbo.t_Person_D >>>'
go

