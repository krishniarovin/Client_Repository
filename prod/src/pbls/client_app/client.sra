$PBExportHeader$client.sra
$PBExportComments$Generated Application Object
forward
global n_transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
n_cst_client_appmanager gnv_app
nv_security g_nv_security
nv_components g_nv_components
string gs_logonid
end variables

global type client from application
 end type
global client client

type prototypes
SUBROUTINE _capitalize(ref string s,ulong b) LIBRARY "FUNCky32.DLL"
end prototypes

type variables
str_logon_user istr_user
end variables

on client.create
appname = "client"
message = create message
sqlca = create n_transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on client.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

event open;gnv_app = CREATE n_cst_client_appmanager

gnv_app.Event pfc_Open(Commandline)



end event

event systemerror;gnv_app.Event pfc_systemerror()
end event

event close;gnv_app.Event pfc_Close()

DESTROY gnv_app
end event

event idle;gnv_app.Event pfc_Idle()
end event

