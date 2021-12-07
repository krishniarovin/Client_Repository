$PBExportHeader$n_cst_clientinq_appmanager.sru
$PBExportComments$//??  References an instance variable on the application object.  Needs work.
forward
global type n_cst_clientinq_appmanager from n_cst_appmanager
end type
end forward

global type n_cst_clientinq_appmanager from n_cst_appmanager
end type
global n_cst_clientinq_appmanager n_cst_clientinq_appmanager

type prototypes
function boolean GetComputerNameA(ref string  lpBuffer, ref ulong nSize) library "KERNEL32.DLL"
 
end prototypes

type variables
n_ds ids_work
end variables

on n_cst_clientinq_appmanager.create
call super::create
end on

on n_cst_clientinq_appmanager.destroy
call super::destroy
end on

event constructor;call super::constructor;// 10/26/02 AMCP Start. LANelson.  Make the current directory dynamic. 
// This step is needed so that the user can have multiple versions on 
// the same PC.
n_cst_filesrvwin32 lnv_filesrv
string ls_current_directory

lnv_filesrv = Create n_cst_filesrvwin32
ls_current_directory = lnv_filesrv.of_getcurrentdirectory ()
Destroy ( lnv_filesrv )

// The file name of the application INI file
of_SetAppIniFile ( ls_current_directory + "\ccr.ini")

// The file name of the application's online help file
of_SetHelpFile ( ls_current_directory + "\clntinqu.hlp")

// Now create the work datastore.  Using this datastore
// avoids a whole bunch of create/destroy for local use.
This.ids_work = Create n_ds
// 10/26/02 AMCP End.// The file name of the application INI file

this.of_SetLogo("client.bmp")
this.of_SetCopyright('Copyright © 1998 Cendant Mortgage, Inc. and its subsidiaries. ~nAll rights reserved ~n~nBuilt on Jan 05, 2003 at 12:50 AM' )
this.of_SetVersion('Version 2.0.000')

iapp_object.DisplayName = 'Client Repository Inquiry'


end event

event pfc_open;call super::pfc_open;String ls_clientinq

ls_clientinq = "clientinq"

choose case this.Event pfc_logon(ls_clientinq,"w11090" ) // Modified 07/06/1999
//choose case this.Event pfc_logon ('shahs','v11495' ) // Modified 07/06/1999
//choose case this.Event pfc_logon ('pintoa','123456' ) // Modified 12/14/98.
	case 1 

		Open (w_clientinq_frame)

	case 0

		HALT CLOSE
		
	case else
			
		Open (w_clientinq_frame)

END choose



end event

event pfc_logon;call super::pfc_logon;integer li_retval

//String ls_dbparm
//String ls_ComputerName = Space(255)
//ulong l_ulvalue = 255
//Boolean lb_result
//
//
///////////////////////////////////Adding Retrieval of Host Name  ---PoulopM 2/12/04
//
//lb_result = GetComputerNameA(ls_ComputerName , l_ulvalue)
//
//IF lb_result <> true THEN	
//	gnv_app.inv_error.of_message("Getting computer name failed", "Please inform the system administrator!")
//End if
//
//	If Isnull(ls_ComputerName) Then   //Couldn't get the computer name
//	Else
//		ls_dbparm=ProfileString (gnv_app.of_getappinifile(), "database", 'DbParm', '')
////User already has the Host Name in it. May be doing special testing..
//		If Pos(ls_dbparm,'Host') = 0 and Len(trim(ls_ComputerName)) > 0 Then
//			If Len(trim(ls_dbparm)) = 0 Then
//			//If there is no DBParm 
//				ls_dbparm="Host = '"+ls_ComputerName+"'"
//			Else
//				ls_dbparm=ls_dbparm + ", Host = '"+ls_ComputerName+"'"
//			End if
//				SQLCA.DBParm =ls_dbparm
//		Else
//				SQLCA.DBParm =ls_dbparm
//		End if
//	
//	End if
/////////////////////////////////////////End of adding host name.  PoulopM 

SQLCA.of_Init(this.of_GetAppIniFile(),"database")

SQLCA.of_SetUser(as_userid, as_password)

If (SQLCA.of_Connect() = 0) Then	
//?? FIX THIS LATER.  Use GetApplication()
	clientinq.istr_user.userid = as_userid
	li_retval = 1
Else
	MessageBox("Error",SQLCA.SQLErrText)
	li_retval = -1	
End If

return li_retval
end event

event pfc_idle;SQLCA.of_disconnect()

end event

event pfc_close;call super::pfc_close;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  If the datastore is still valid, then destroy it.
//		
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////


IF	IsValid ( This.ids_work ) THEN
	Destroy ( This.ids_work )
END IF
end event

