Alter table Agent
  Add PHHAgent T_ud_yesno default 'N' Null
go 

 
 Create table SystemPreference
      ( PreferenceType T_ud_comments NOT NULL,
      Preference T_ud_comments NOT NULL,
      Description T_ud_comments NOT NULL, 
      UserDefinable T_ud_yesno NOT NULL,
      DefaultValue T_ud_comments NOT NULL,
      CreateUser T_ud_user_id NOT NULL,
      CreateDate T_ud_datetime NOT NULL,
      ModifyUser T_ud_user_id NULL,
      ModifyDate T_ud_datetime NULL )

GO

