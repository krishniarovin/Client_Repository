$PBExportHeader$w_clientinq_frame.srw
forward
global type w_clientinq_frame from w_frame
end type
end forward

global type w_clientinq_frame from w_frame
int X=5
int Y=12
int Width=3657
int Height=2384
string MenuName="m_clientinq"
WindowState WindowState=maximized!
event pfe_printscreen ( )
end type
global w_clientinq_frame w_clientinq_frame

event pfe_printscreen;long Job

SetPointer(Hourglass!)

SetMicroHelp(this,'Printing Screen')

job = PrintOpen()

PrintScreen(job,0,0)

SetMicroHelp(This,'Complete')

PrintClose(job)
end event

on w_clientinq_frame.create
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_clientinq" then this.MenuID = create m_clientinq
end on

on w_clientinq_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event pfc_postopen;call super::pfc_postopen;any cache_arg[]
integer li_rc
integer li_x
string  ls_email_user[]

SetPointer(HourGlass!)

// Enable MicroHelp service

gnv_app.of_SetMicroHelp(True)

// Enable Data Caching
gnv_app.of_SetDWCache(TRUE)

// Enable Error Services

gnv_app.of_SetError(TRUE)

gnv_app.inv_error.of_SetPredefinedSource(SQLCA)
gnv_app.inv_error.of_SetLogFile("ccrerr.log")
gnv_app.inv_error.of_SetLogSeverity(20)
gnv_app.inv_error.of_SetStyle(1)

// set frame window services

this.of_SetSheetManager(True)
this.of_SetStatusBar(True)
this.inv_statusbar.of_SetTimer(True)

SetMicroHelp('')





end event

event pfc_preopen;// Show splash window
gnv_app.of_Splash (2)
end event

