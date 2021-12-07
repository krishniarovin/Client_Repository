$PBExportHeader$clientinq.sra
forward
global type clientinq from application
end type
global n_transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
n_cst_clientinq_appmanager gnv_app
nv_security g_nv_security
nv_components g_nv_components
string gs_logonid
end variables

global type clientinq from application
string appname = "clientinq"
end type
global clientinq clientinq

type prototypes
SUBROUTINE _capitalize(ref string s,ulong b) LIBRARY "FUNCky32.DLL"
end prototypes

type variables
str_user_logonid istr_user
end variables

on clientinq.create
appname="clientinq"
message=create message
sqlca=create n_transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on clientinq.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;gnv_app = CREATE n_cst_clientinq_appmanager

gnv_app.Event pfc_Open(Commandline)



end event

event systemerror;gnv_app.Event pfc_systemerror()
end event

event close;gnv_app.Event pfc_Close()

DESTROY gnv_app
end event

event idle;gnv_app.Event pfc_Idle()
end event

