$PBExportHeader$w_update_businessconsultant.srw
forward
global type w_update_businessconsultant from w_client_sheet
end type
type dw_phhmanagers from u_dw within w_update_businessconsultant
end type
type dw_update_manager_download from datawindow within w_update_businessconsultant
end type
type tv_pfc_managers from u_tv within w_update_businessconsultant
end type
type dw_managers from u_dw within w_update_businessconsultant
end type
end forward

global type w_update_businessconsultant from w_client_sheet
integer x = 5
integer y = 188
integer width = 3643
integer height = 2044
string title = "Business Consultant Maintenance"
string menuname = "m_update_manager"
dw_phhmanagers dw_phhmanagers
dw_update_manager_download dw_update_manager_download
tv_pfc_managers tv_pfc_managers
dw_managers dw_managers
end type
global w_update_businessconsultant w_update_businessconsultant

type prototypes

end prototypes

type variables
long il_currenthandle, il_parentid, il_childid , il_roothandle

boolean ibo_manager_added, ibo_saveoff, ibo_firstexpand
boolean ib_dirty
String is_desc

n_ds ids_manager_class
n_ds ids_root_managers, ids_sub_managers

n_ds ids_data

DataWindowChild idwc_managers, idwc_regions, idwc_mgr_type


end variables

forward prototypes
public function boolean wf_data_modified (datawindow arg_datawindow)
end prototypes

public function boolean wf_data_modified (datawindow arg_datawindow);long p
boolean lbo_data_modified
lbo_data_modified = FALSE

arg_datawindow.AcceptText()

FOR p = 1 TO RowCount(arg_datawindow)

	If (NOT lbo_data_modified) Then
		choose case GetItemStatus(arg_datawindow,p,0,Primary!)

			case NewModified!, New!	
				lbo_data_modified = TRUE
			Case DataModified!
				lbo_data_modified = TRUE
		End Choose
	End If
NEXT

Return lbo_data_modified
end function

on w_update_businessconsultant.create
int iCurrent
call super::create
if this.MenuName = "m_update_manager" then this.MenuID = create m_update_manager
this.dw_phhmanagers=create dw_phhmanagers
this.dw_update_manager_download=create dw_update_manager_download
this.tv_pfc_managers=create tv_pfc_managers
this.dw_managers=create dw_managers
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_phhmanagers
this.Control[iCurrent+2]=this.dw_update_manager_download
this.Control[iCurrent+3]=this.tv_pfc_managers
this.Control[iCurrent+4]=this.dw_managers
end on

on w_update_businessconsultant.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_phhmanagers)
destroy(this.dw_update_manager_download)
destroy(this.tv_pfc_managers)
destroy(this.dw_managers)
end on

event pfc_postopen;long ll_Root
TreeViewItem ltvi_Root
PowerObject lpo_objects[]

ids_data = Create n_ds

ids_root_managers = Create n_ds
// 10/26/02 AMCP Start. LANelson.  Change dataobject.
ids_root_managers.DataObject = "d_businessconsultant_top_level"
//ids_root_managers.DataObject = "d_managers_top_level"
// 10/26/02 AMCP End.
ids_root_managers.of_SetTransObject(SQLCA)

ids_sub_managers = Create n_ds
ids_sub_managers.DataObject = "d_managers_next_level"
ids_sub_managers.of_SetTransObject(SQLCA)

// Setup linkage service...
//dw_managers.of_SetLinkage(TRUE)
//dw_phhmanagers.of_SetLinkage(TRUE)
//dw_phhmanagers.inv_linkage.of_SetMaster(dw_managers)
//dw_phhmanagers.inv_linkage.of_Register("persidnum","persidnum")
//dw_phhmanagers.inv_linkage.of_SetStyle(2)
dw_phhmanagers.of_setupdateable(FALSE)
dw_phhmanagers.of_SetTransObject(SQLCA)
dw_managers.of_SetTransObject(SQLCA)

//lpo_Objects[1]= dw_managers
//lpo_Objects[2]= dw_phhmanagers
//
//this.Of_SetUpdateObjects(lpo_objects)
//
ids_manager_class = Create n_ds
ids_manager_class.DataObject = "d_class_row_bykey"
ids_manager_class.of_SetTransObject(SQLCA)

SetNULL(il_currenthandle)
SetNULL(il_parentid)	
SetNULL(il_childid)	

ibo_manager_added = FALSE
// 10/26/02 AMCP Start. LANelson.  Changed dataobject.
tv_pfc_managers.of_SetDataSource(2,"d_businessconsultant_top_level",SQLCA,"classdesc","",False,2,2)
//tv_pfc_managers.of_SetDataSource(2,"d_managers_top_level",SQLCA,"classdesc","",False,2,2)
// 10/26/02 AMCP End.
tv_pfc_managers.of_SetDataSource(3,"d_managers_next_level",SQLCA,"classdesc",":parent.1.classidnum,:parent.1.classcoldbcolname",True,2,2)

// 10/26/02 AMCP Start. LANelson.  Retitled.
ltvi_Root.Label = "Cendant Corporate Real Estate"
//ltvi_Root.Label = "Manager Types"
// 10/26/02 AMCP End.
ltvi_Root.Children = True
ltvi_Root.PictureIndex = 1
ltvi_Root.SelectedPictureIndex = 1

il_roothandle = tv_pfc_managers.InsertItemLast(0, ltvi_Root)

ibo_firstexpand = True

tv_pfc_managers. Function ExpandItem(il_roothandle)
//?? tv_pfc_managers.Post Function ExpandItem(il_roothandle)
end event

event pfe_add;dw_managers.Event Trigger pfc_addrow()

end event

event pfe_delete;
dw_managers.Event pfc_deleterow()

this.Event pfc_save() 

end event

event close;call super::close;Destroy ids_root_managers
Destroy ids_sub_managers
Destroy ids_manager_class



end event

event pfe_postsave;long ll_curr_row

choose case ai_save_rc
		
	case 0
// 10/26/02 AMCP Start. LANelson.  Rephrased message.
		this.ParentWindow().SetMicroHelp('No Business Consultant updates pending.')
// 10/26/02 AMCP End.

	case 1
		
// 10/26/02 AMCP Start. LANelson.  Rephrased message.  Skipped refresh.
		this.ParentWindow().SetMicroHelp('Update of Business Consultant successful.')
//		this.ParentWindow().SetMicroHelp('Update of manager successful')
//		gnv_app.inv_dwcache.of_Refresh("client_mgr_list")
// 10/26/02 AMCP End.
			
//		ll_curr_row = dw_managers.GetRow()
//		dw_managers.Event pfc_retrieve()
//		if ll_curr_row  > 0  THEN
//			dw_managers.ScrollToRow(ll_curr_row)	
//		end if
	case else	
		
// 10/26/02 AMCP Start. LANelson.  Rephrased message.  Skipped refresh.
		this.ParentWindow().SetMicroHelp('Update of Business Consultant unsuccessful.' )
//		this.ParentWindow().SetMicroHelp('Update of manager  unsuccessful' )
//		gnv_app.inv_dwcache.of_Refresh("client_mgr_list")	
// 10/26/02 AMCP End.
//		ll_curr_row = dw_managers.GetRow()
//		dw_managers.Event pfc_retrieve()
//		if ll_curr_row  > 0  THEN
//			dw_managers.ScrollToRow(ll_curr_row)	
//		end if
end choose

Return ai_save_rc
end event

type dw_phhmanagers from u_dw within w_update_businessconsultant
boolean visible = false
integer x = 78
integer y = 1188
integer width = 933
integer height = 436
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_update_phhmanager"
end type

type dw_update_manager_download from datawindow within w_update_businessconsultant
boolean visible = false
integer x = 1637
integer y = 1228
integer width = 494
integer height = 364
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_update_manager_download"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
end event

type tv_pfc_managers from u_tv within w_update_businessconsultant
integer y = 28
integer width = 1115
integer height = 1804
integer taborder = 30
fontcharset fontcharset = ansi!
long backcolor = 1090519039
string picturename[] = {"Structure!","Structure5!"}
long picturemaskcolor = 12632256
string statepicturename[] = {"Structure!","Structure5!"}
long statepicturemaskcolor = 12632256
end type

event selectionchanging;long ll_retval

boolean lbo_ok_to_switch

// Get the data in the tree
dw_managers.of_AcceptText(True)
If (dw_managers.of_UpdatesPending() = 1) Then
	ll_retval = MessageBox("Save Changes","Do you want to save your work?",Question!,YesNo!)
	If (ll_retval = 1) Then
		ll_retval = 0
		ll_retval = w_update_manager.Event pfc_save()
	   If (ll_retval = 0) Then
			Return 0
		Else
			Return 0
		End If
	Else
		Return 0	
	End If
End If
end event

event selectionchanged;integer li_retval
long ll_tviparent, ll_rows, ll_Row

treeviewitem     l_tvicurrent, l_tviparent

// Get the data in the tree

il_currenthandle = newhandle
tv_pfc_managers.GetItem(newhandle , l_tvicurrent)

If (l_tvicurrent.Level <> 1) Then	
	
	ll_tviparent = tv_pfc_managers.FindItem(ParentTreeItem! , il_currenthandle)	
	tv_pfc_managers.GetItem(ll_tviparent, l_tviparent)

	li_retval = tv_pfc_managers.of_GetDataRow(il_currenthandle, ids_data, ll_Row)
	il_childid = ids_data.object.classidnum[ll_Row]
	is_desc = ids_data.object.classdesc[ll_Row]

	If (l_tvicurrent.Level <> 2) Then
		li_retval = tv_pfc_managers.of_GetDataRow(ll_tviparent, ids_data, ll_Row)
		il_parentid = ids_data.object.classidnum[ll_Row]
	Else
		il_parentid = il_childid		
	End If
	
	ibo_saveoff = true
	
	dw_managers.Event pfc_retrieve()
	
	ibo_saveoff = false
	
Else
	
	SetNULL(il_currenthandle)
	SetNULL(il_parentid)	
	SetNULL(il_childid)	
	
End If
end event

event itemexpanded;long ll_tvi

If (ibo_firstexpand) Then
	ibo_firstexpand = False
	ll_tvi = tv_pfc_managers.FindItem(ChildTreeItem! , il_roothandle)
	tv_pfc_managers.SelectItem(ll_tvi)
End If
end event

type dw_managers from u_dw within w_update_businessconsultant
integer x = 1134
integer y = 28
integer width = 2482
integer height = 1804
integer taborder = 10
string dataobject = "d_update_businessconsultant"
end type

event constructor;call super::constructor;/////////////////////////////////////////////////////////////////
//
//	Description:		Initialize the following servies
//								1) DropDown Calendar
//								2) Row Select
//								3) Required Columns
//
/////////////////////////////////////////////////////////////////
// Revised:
//	Date			By						Description
// 11/20/97		Chris Fioravanti	Initial Coding
//
////////////////////////////////////////////////////////////////


integer ii_retval

// Start the Drop-down Calendar and associate with the 
// Begin and End Effective Dates

ii_retval = this.of_SetDropDownCalendar(true)

if IsValid(iuo_calendar) then
	ii_retval = this.iuo_calendar.of_Register('bgneffdate', iuo_calendar.DDLB_WITHARROW)
	ii_retval = this.iuo_calendar.of_Register('endeffdate', iuo_calendar.DDLB_WITHARROW)
end if

this.SetRowFocusIndicator(Hand!) 

// Start the Services for required columns.
this.of_SetReqColumn(True)





end event

event pfc_addrow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  OVERRIDE then trigger pfc_addrow 
//
//	Arguments:  none
//
//	Returns:  long
//	number of the new row that was inserted
//	 0 = No row was added.
//	-1 = error
//
//	Description:
//	Adds a new row to the end of the DW
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//////////////////////////////////////////////////////////////////////////////

integer li_rc

string ls_name

if ib_dirty then
	if parent.Event pfc_save() < 0 then
			return 1
		end if
end if
	

ibo_saveoff = false

// Hardcode the dbname.
// This is a fudge.  We are reusing the PHHManager table
// for Business Consultants.  But we can't use the same
// Classification tables entries.
ls_name = 'PHHManagerBC.ClassIDNum'
this.GetChild ( 'classidnum', idwc_mgr_type )
IF	Parent.idwc_mgr_type.RowCount () > 0 THEN
ELSE
	Parent.idwc_mgr_type.SetTransObject ( SQLCA )
	Parent.idwc_mgr_type.Retrieve ( ls_name )
END IF


li_rc = Super::Event pfc_addrow()

if  li_rc > 0 then

	this.object.bgneffdate[li_rc] = DateTime(Today(),Now())	
	this.object.endeffdate[li_rc] = DateTime(Date("12/31/2099"),Now())	
	this.object.classidnum[li_rc] = il_childid
//	this.SetColumn('persfirstname')
	ib_dirty = TRUE ;
end if

return li_rc

end event

event pfe_undelete;/*
Override The pfe_undelete..
This window does not use the Row Selection Manager  so GetSelectedRow will not work.

*/

this.object.endeffdate[GetRow()] = DateTime(Date("12/31/2099"),Now())	
end event

event pfc_deleterow;/////////////////////////////////////////////////////////////////////////////
//
//	Event:  OVERRIDE pfc_deleterow
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//  0 = Row not deleted
//	-1 = error
//
//	Description:
//	Deletes the current or selected row(s)
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//////////////////////////////////////////////////////////////////////////////

integer li_r

ibo_saveoff = true

li_r = this.GetRow()

choose case this.GetItemStatus(li_r,0,Primary!)

	case New!, NewModified!

		DeleteRow(this,li_r)

	case else
		//?? End effective date is what time?  Don't we need end of day?
		this.object.endeffdate[li_r] = Datetime(Today())
		
		this.SetColumn('endeffdate')

end choose

ibo_saveoff = true

return 1








end event

event pfc_update;//////////////////////////////////////////////////////////////////////////////////
// Revisions :   
// Modified by       Date           Purpose
// HPS Team				05/03/2001     For assigning AmTypeNum value
// for WP-77
//
//////////////////////////////////////////////////////////////////////////////////

long ll_r, ll_persidnum, ll_phhmanager_rownum, ll_rows, ll_ins
long ll_persidnumarray[], j
long li_ret

String ls_FirstName, ls_MidInit, ls_LastName, ls_FullName
string ls_find 

ll_rows = RowCount(this)
Reset(dw_update_manager_download)


FOR ll_r = 1 TO ll_rows

	choose case GetItemStatus(This,ll_r,0,Primary!)

		case NewModified!, New!
			
			ll_persidnum = SQLCA.get_next_uniqidnum('PERSON')

			If (ll_persidnum = 0) Then
				// 10/26/02 AMCP Start. LANelson.  Retitled.
				SetMicroHelp("Assignment of Consultant ID has failed... Please try again")
//				SetMicroHelp("Assignment of Manager ID has failed... Please try again")
				// 10/26/02 AMCP End.
				return -1
			End If
			
			This.object.persidnum[ll_r] = ll_persidnum
			ls_FirstName = This.object.persfirstname[ll_r]
			ls_MidInit = This.object.persmidinit[ll_r]
			ls_LastName	= This.object.perslastname[ll_r]			 
			If (NOT IsNULL(ls_MidInit))	Then		
				ls_FullName = Trim(ls_FirstName) + " " + Trim(ls_MidInit) + ". " + Trim(ls_LastName)
			Else
				ls_FullName = Trim(ls_FirstName) + " " + Trim(ls_LastName)
			End If
			This.object.persfullname[ll_r] = Trim(ls_FullName)
			This.object.UserCrtd[ll_r] = client.istr_user.userid
			This.object.DateCrtd[ll_r] = DateTime(Today(),Now())
			This.object.UserMdfd[ll_r] = client.istr_user.userid
			This.object.DateMdfd[ll_r] = DateTime(Today(),Now())
			
						
// Set up data to insert into the PHHManager Table
			
			dw_phhmanagers.Reset()
			ll_phhmanager_rownum = dw_phhmanagers.InsertRow(0)
			dw_phhmanagers.object.persidnum[ll_phhmanager_rownum] = ll_persidnum
			dw_phhmanagers.object.classidnum[ll_phhmanager_rownum] = This.object.classidnum[ll_r]
			dw_phhmanagers.object.UserCrtd[ll_phhmanager_rownum] = client.istr_user.userid
			dw_phhmanagers.object.DateCrtd[ll_phhmanager_rownum] = This.object.DateCrtd[ll_r]
			dw_phhmanagers.object.persidnumparent[ll_phhmanager_rownum] = This.object.persidnumparent[ll_r]
			dw_phhmanagers.object.areaidnum[ll_phhmanager_rownum] = This.object.areaidnum[ll_r]
			dw_phhmanagers.object.phhlogonid[ll_phhmanager_rownum] = this.object.phhlogonid[ll_r]
			dw_phhmanagers.object.phonenbr[ll_phhmanager_rownum] = this.object.phonenbr[ll_r]
			dw_phhmanagers.object.faxnbr[ll_phhmanager_rownum] = this.object.faxnbr[ll_r]
			dw_phhmanagers.object.salespersonid[ll_phhmanager_rownum] = this.object.salespersonid[ll_r]
			// Modified by HPS Team On 05/03/2001 WP-77 Starts
			// Purpose : To Add AMType column for updating
			dw_phhmanagers.Object.amtypenum[ll_phhmanager_rownum] = THIS.Object.amtypenum[ll_r]
			// Modified by HPS Team On 05/03/2001 WP-77 Ends
			

//  Commented by Eugene Potakh 1/22/99. The following code is no longer valid.
//	 Trigger performs this functionality.
//			if retrieve(dw_update_manager_download,ll_persidnum) > 0 then continue
//
//			ll_ins = InsertRow(dw_update_manager_download,0)
//				
//			dw_update_manager_download.object.persidnum[ll_ins] = ll_persidnum
//					
//			dw_update_manager_download.object.datecrtd[ll_ins] = DateTime(Today(),Now())
//					
//			dw_update_manager_download.object.usercrtd[ll_ins] = client.istr_user.userid
//  End of comments 1/22/99.

		Case DataModified!
			
			ls_FirstName = This.object.persfirstname[ll_r]
			ls_MidInit = This.object.persmidinit[ll_r]
			ls_LastName	= This.object.perslastname[ll_r]			 
			If (NOT IsNULL(ls_MidInit))	Then		
				ls_FullName = Trim(ls_FirstName) + " " + Trim(ls_MidInit) + ". " + Trim(ls_LastName)
			Else
				ls_FullName = Trim(ls_FirstName) + " " + Trim(ls_LastName)
			End If
			This.object.persfullname[ll_r] = Trim(ls_FullName)
			This.object.UserMdfd[ll_r] = client.istr_user.userid
			This.object.DateMdfd[ll_r] = DateTime(Today(),Now())	

//  Commented by Eugene Potakh 1/22/99. The following code is no longer valid.
//	 Trigger performs this functionality.
//			if retrieve(dw_update_manager_download,ll_persidnum) > 0 then continue
//
//			ll_ins = InsertRow(dw_update_manager_download,0)
//				
//			dw_update_manager_download.object.persidnum[ll_ins] = ll_persidnum
//					
//			dw_update_manager_download.object.datecrtd[ll_ins] = DateTime(Today(),Now())
//					
//			dw_update_manager_download.object.usercrtd[ll_ins] = client.istr_user.userid
//  End of comments 1/22/99.

//			
// Set up data to update into the PHHManager Table
//
			ll_persidnum = This.object.persidnum[ll_r]
			ll_phhmanager_rownum = dw_phhmanagers.Retrieve(ll_persidnum)
		//	ll_phhmanager_rownum = dw_phhmanagers.Find(ls_find,1,dw_phhmanagers.RowCount())  

			If (dw_phhmanagers.RowCount() > 0) Then
				ll_phhmanager_rownum = 1				
				dw_phhmanagers.object.classidnum[ll_phhmanager_rownum] = this.object.classidnum[ll_r]
				dw_phhmanagers.object.persidnumparent[ll_phhmanager_rownum] = This.object.persidnumparent[ll_r]			
				dw_phhmanagers.object.areaidnum[ll_phhmanager_rownum] = This.object.areaidnum[ll_r]			
				dw_phhmanagers.object.phhlogonid[ll_phhmanager_rownum] = this.object.phhlogonid[ll_r]
				dw_phhmanagers.object.phonenbr[ll_phhmanager_rownum] = this.object.phonenbr[ll_r]
				dw_phhmanagers.object.faxnbr[ll_phhmanager_rownum] = this.object.faxnbr[ll_r]
				dw_phhmanagers.object.salespersonid[ll_phhmanager_rownum] = this.object.salespersonid[ll_r]
				// Modified by HPS Team On 05/03/2001 WP-77 Starts
				// Purpose : To Add AMType column for updating
				dw_phhmanagers.Object.amtypenum[ll_phhmanager_rownum] = THIS.Object.amtypenum[ll_r]
				// Modified by HPS Team On 05/03/2001 WP-77 Ends		
			Else
				Return -1
			End If
			
	End Choose
	
NEXT


li_ret = Super::Event pfc_update(ab_accepttext, ab_resetflag) 

if li_ret = 1 then
	li_ret = dw_phhmanagers.Update(TRUE,TRUE) 
	if li_ret = 1 then
		ib_dirty = FALSE
	end if
end if

Return li_ret 
end event

event pfc_postupdate;call super::pfc_postupdate;// 10/26/02 AMCP Start. LANelson.  Skip manager cache.
//gnv_app.inv_dwcache.of_Refresh("d_update_manager")
//gnv_app.inv_dwcache.of_refresh('client_mgr_list')
// 10/26/02 AMCP End.

return 1
end event

event pfc_retrieve;call super::pfc_retrieve;integer li_rc

//li_rc = this.Retrieve(il_childid, il_parentid)

li_rc = this.Retrieve(il_childid)

if li_rc > 0 then
	
	this.Event rowfocuschanged(1)
	
	SetRow(1)

	this.SetColumn('persfirstname')

end if

return li_rc
end event

event rowfocuschanged;call super::rowfocuschanged;if currentrow < 1 then return

If ( date(dw_managers.object.endeffdate[currentrow]) <= Today()) Then 
	Enable(m_update_manager.m_edit.m_undelete)
	Disable(m_update_manager.m_edit.m_delete)
Else
	Disable(m_update_manager.m_edit.m_undelete)
	Enable(m_update_manager.m_edit.m_delete)	
End If


end event

event rowfocuschanging;if ibo_saveoff = true then return
if Not ib_dirty then return

if parent.Event pfc_save() < 0 then
	
	return 1
	
else
	
	Return Super::Event rowfocuschanging(currentrow, newrow)
	
end if
			
	
	
end event

event retrievestart;call super::retrievestart;integer li_r
Long ll_r
string ls_name

li_r = this.GetChild('classidnum',idwc_mgr_type)
SetTransObject(idwc_mgr_type,SQLCA)

// 10/26/02 AMCP Start. LANelson.  Hardcode the dbname.
// This is a fudge.  We are reusing the PHHManager table
// for Business Consultants.  But we can't use the same
// Classification tables entries.
ls_name = 'PHHManagerBC.ClassIDNum'
//ls_name = this.object.classidnum.dbname
// 10/26/02 AMCP End.

//li_r = Retrieve(idwc_mgr_type,this.object.classidnum.dbname)
ll_r = Retrieve(idwc_mgr_type,ls_name)

// 10/26/02 AMCP Start. LANelson.  Eliminate Area.
//this.GetChild("areaidnum", idwc_regions)
//idwc_regions.SetTransObject(SQLCA)
//idwc_regions.Retrieve()
// 10/26/02 AMCP End.
	
//this.GetChild("persidnumparent", idwc_managers)
//idwc_managers.SetTransObject(SQLCA)
//idwc_managers.Retrieve(il_parentid)
//
//li_r = idwc_managers.InsertRow(0)
//
//idwc_managers.SetItem(li_r,'person_persfullname',' ')
//idwc_managers.SetItem(li_r,'person_persidnum',0)
//
end event

event pfc_validation;call super::pfc_validation;String	ls_phone,ls_fax,ls_msg
Long		ll_len, i
long		ll_rowcount, ll_areaidnum,ll_saleslength
string	ls_firstname 
string	ls_lastname
String 	ls_salesid, ls_sales, ls_name
Long		ll_persid
Long 		ll_persIDNum

IF AncestorReturnValue < 1 THEN Return AncestorReturnValue


ls_phone			= this.GetItemString ( this.GetRow(),'phonenbr' )
ls_fax				= this.GetItemString ( this.GetRow(),'faxnbr' )
ls_firstname		= this.getItemString(this.getRow(), 'persfirstname')
ls_lastname 		= this.getItemString(this.getRow(), 'perslastname')
ls_salesid		= this.getItemString(this.getRow(), 'salespersonid')
ll_persidnum 	= this.Object.PersIDNum[this.getRow()]
ll_areaidnum 	= this.Object.areaidnum[this.GetRow()]

if Trim(ls_firstname) = "" then
		gnv_app.inv_error.of_Message ( gnv_app.iapp_object.Displayname, 'Please enter a valid first name.', &
											 + Exclamation!,Ok!)
	Return -1											 
	
end if 


if trim(ls_lastname) = "" then
		gnv_app.inv_error.of_Message ( gnv_app.iapp_object.Displayname, 'Please enter a valid  last name', &
											 + Exclamation!,Ok!)
	Return -1											 
	
end if

//?? Require EMail address?

// 10/26/02 AMCP Start. LANelson.  Sales ID, Region, Fax, Phone are not required for Business Consultants.

//	SELECT DISTINCT PersIDNum, SalesPersonID
//	INTO 	:ll_persid,:ls_sales
//	FROM 	PHHManager
//	WHERE SalesPersonID = :ls_salesid  and
//	PersIDNum not in (:ll_persidnum);
//	
//	IF SQLCA.SqlCode = 0 THEN
//		
//		SELECT PersFullName 
//		INTO :ls_name
//		FROM Person
//		WHERE PersIDNum = :ll_persid;
//		
//		
//		gnv_app.inv_error.of_Message ( gnv_app.iapp_object.Displayname, 'This Sales ID is assigned to' +' '+ ls_name+".", &
//												 + Exclamation!,Ok!)
//		This.SetColumn("salespersonid")
//		RETURN -1
//		
//	END IF
//
//IF Not ISNULL(ls_salesid) THEN
//	ll_saleslength = len(TRIM(ls_salesid))
//	IF ll_saleslength > 0 and  ll_saleslength < 5 THEN
//			gnv_app.inv_error.of_Message ( gnv_app.iapp_object.Displayname, 'The Sales ID assigned cannot be less than 5 digits'+ ".", &
//											 + Exclamation!,Ok!)
//	END IF
//END IF					
//
//
////Added for Region Validation. 
//
//IF IsNull(ll_areaidnum) THEN
//		gnv_app.inv_error.of_Message (gnv_app.iapp_object.Displayname, 'Please enter a valid  Region', &
//											 + Exclamation!,Ok!)
//	Return -1											 
//	
//END IF
//
//ll_len = Len ( Trim ( ls_fax ) )
//IF ll_len > 0 AND ll_len < 10 THEN
//	ls_msg = 'fax'
//END IF
//
//ll_len = Len ( Trim ( ls_phone ) )
//IF ll_len > 0 AND ll_len < 10  THEN
//	ls_msg = 'phone'
//END IF
//
//
//IF Trim ( ls_msg ) <> '' THEN
//	gnv_app.inv_error.of_Message ( gnv_app.iapp_object.Displayname, 'The'+' ' +ls_msg+' '+'number assigned cannot be less than 10 digits'+ ".", &
//											 + Exclamation!,Ok!)
//	Return -1											 
//END IF

// 10/26/02 AMCP End.


Return 1
end event

event editchanged;ib_dirty = TRUE
end event

event buttonclicked;s_manager lstr_manager
long ll_persidnum, ll_classidnum, ll_return, ll_areaidnum
string ls_messageid
string ls_message[]
String ls_phhlogonid,ls_personid,ls_phonenbr,ls_faxnbr

if Date(this.object.endeffdate[row]) <= today() then
//?? Is this message appropriate.		
		ls_messageid = 'pfc_managerdeleted'	// Id of appropriate message.
		ls_message[1] = is_desc // Substitution value. Typically header/label.

		gnv_app.inv_error.of_message ( ls_messageid, ls_message )

		return -1	
		
end if

ll_persidnum		= this.object.persidnum[row]
ll_classidnum	= this.object.classidnum[row]
ll_areaidnum 	= this.object.areaidnum[row]
ls_phhlogonid	= this.object.phhlogonid[row]
ls_personid		= this.object.salespersonid[row]
ls_phonenbr		= this.object.phonenbr[row]
ls_faxnbr			= this.object.faxnbr[row]


lstr_manager.parentid		= il_parentid
lstr_manager.chldid		= il_childid
lstr_manager.persidnum	= ll_persidnum
lstr_manager.classidnum = ll_classidnum
lstr_manager.areaidnum	= ll_areaidnum
lstr_manager.phhlogonid = ls_phhlogonid
lstr_manager.salespersonid = ls_personid
lstr_manager.phonenbr = ls_phonenbr
lstr_manager.faxnbr = ls_faxnbr

OpenWithParm(w_add_managers,lstr_manager)

this.Event pfc_retrieve()



end event

