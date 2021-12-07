IF OBJECT_ID('dbo.tD_Code') IS NOT NULL
BEGIN
    DROP TRIGGER dbo.tD_Code
    IF OBJECT_ID('dbo.tD_Code') IS NOT NULL
        PRINT '<<< FAILED DROPPING TRIGGER dbo.tD_Code >>>'
    ELSE
        PRINT '<<< DROPPED TRIGGER dbo.tD_Code >>>'
END
go
/*  Delete trigger "tD_Code" for table "Code"  */
create trigger tD_Code on Code for delete as
begin
    declare
       @numrows  int,
       @errno    int,
       @errmsg   varchar(255)

    select  @numrows = @@rowcount
    if @numrows = 0
       return


    /*  Cannot delete parent "Code" if children still exist in "Client"  */
    if exists (select 1
               from   Client t2, deleted t1
               where  t1.CodeValue = t2.Territory
                    and t1.CodeType='TERRITORY')


       begin
          select @errno  = 30006,
                 @errmsg = 'Children still exist in "Client". Cannot delete parent "Code".'
          goto error
       end

    /*  Cannot delete parent "Code" if children still exist in "TerritoryBusContact"  */
    if exists (select 1
               from   TerritoryBusContact t2, deleted t1
               where  t2.Territory = t1.CodeValue
                        and t1.CodeType='TERRITORY')

       begin
          select @errno  = 30006,
                 @errmsg = 'Children still exist in "TerritoryBusContact". Cannot delete parent "Code".'
          goto error
       end


    return

/*  Errors handling  */
error:
    raiserror @errno @errmsg
    rollback  transaction
end
go
IF OBJECT_ID('dbo.tD_Code') IS NOT NULL
    PRINT '<<< CREATED TRIGGER dbo.tD_Code >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER dbo.tD_Code >>>'
go

