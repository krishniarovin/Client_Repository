$PBExportHeader$w_client_search_direct.srw
forward
global type w_client_search_direct from w_response
end type
type st_1 from statictext within w_client_search_direct
end type
type em_clntid from editmask within w_client_search_direct
end type
type cb_cancel from commandbutton within w_client_search_direct
end type
type cb_ok from commandbutton within w_client_search_direct
end type
end forward

global type w_client_search_direct from w_response
int X=1134
int Y=980
int Width=1257
int Height=432
boolean TitleBar=true
string Title="Direct Client Lookup"
long BackColor=12632256
event ue_lookupcompany ( )
st_1 st_1
em_clntid em_clntid
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_client_search_direct w_client_search_direct

type variables
n_ds ids_client
end variables

event ue_lookupcompany;long  ll_rows
string  ls_clntid

SetPointer(Hourglass!)

ls_clntid = em_clntid.text

ids_client = Create n_ds
ids_client.DataObject = "d_client_lookup"
SQLCA.of_connect()
ids_client.of_SetTransObject(SQLCA)

ll_rows = ids_client.Retrieve(ls_clntid)

If (ll_rows = 1) Then
	w_clientinq_frame.SetMicroHelp("Opening Client #" + ls_clntid)
	OpenSheetWithParm(w_client_inquiry, ls_clntid, gnv_app.of_GetFrame(), 0, Layered!)
	Close(This)
Else
	
 	messagebox('Search Error','Client ' + ls_clntid + ' was not found',Exclamation!)

End If
end event

on w_client_search_direct.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_clntid=create em_clntid
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_clntid
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cb_ok
end on

on w_client_search_direct.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_clntid)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event close;Destroy ids_client
end event

type st_1 from statictext within w_client_search_direct
int X=206
int Y=60
int Width=311
int Height=76
boolean Enabled=false
string Text="Client ID:"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_clntid from editmask within w_client_search_direct
int X=530
int Y=44
int Width=398
int Height=92
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
string Mask="#######"
MaskDataType MaskDataType=StringMask!
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_cancel from commandbutton within w_client_search_direct
event clicked pbm_bnclicked
int X=343
int Y=204
int Width=288
int Height=108
int TabOrder=30
string Text="Cancel"
boolean Cancel=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_client_search_direct
int X=18
int Y=204
int Width=288
int Height=108
int TabOrder=20
string Text="&OK"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Parent.Event ue_lookupcompany()
end event

