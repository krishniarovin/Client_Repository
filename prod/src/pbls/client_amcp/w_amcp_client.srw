$PBExportHeader$w_amcp_client.srw
forward
global type w_amcp_client from w_client_sheet
end type
type dw_selected_client from u_dw within w_amcp_client
end type
type tab_1 from u_tab_client within w_amcp_client
end type
type tab_1 from u_tab_client within w_amcp_client
end type
type dw_client_list from u_dw within w_amcp_client
end type
type dw_client_search_criteria from u_dw within w_amcp_client
end type
type st_client_list from statictext within w_amcp_client
end type
type st_client_search_critieria from statictext within w_amcp_client
end type
type st_client_signed_office_history from statictext within w_amcp_client
end type
type dw_client_signed_office_history from u_dw within w_amcp_client
end type
type st_client_account_manager_history from statictext within w_amcp_client
end type
type dw_client_account_manager_history from u_dw within w_amcp_client
end type
type st_client_business_consultant_history from statictext within w_amcp_client
end type
type dw_client_business_consultant_history from u_dw within w_amcp_client
end type
type dw_override_entry from u_dw within w_amcp_client
end type
type dw_override_entry_comment from u_dw within w_amcp_client
end type
type dw_override_history from u_dw within w_amcp_client
end type
type st_override_comment from statictext within w_amcp_client
end type
type st_override_heading_1 from statictext within w_amcp_client
end type
type st_override_history from statictext within w_amcp_client
end type
end forward

global type w_amcp_client from w_client_sheet
integer width = 3685
integer height = 2016
string title = "Client AMCP Maintenance"
string menuname = "m_update_amcp"
event type integer ue_clearcriteria ( )
dw_selected_client dw_selected_client
tab_1 tab_1
dw_client_list dw_client_list
dw_client_search_criteria dw_client_search_criteria
st_client_list st_client_list
st_client_search_critieria st_client_search_critieria
st_client_signed_office_history st_client_signed_office_history
dw_client_signed_office_history dw_client_signed_office_history
st_client_account_manager_history st_client_account_manager_history
dw_client_account_manager_history dw_client_account_manager_history
st_client_business_consultant_history st_client_business_consultant_history
dw_client_business_consultant_history dw_client_business_consultant_history
dw_override_entry dw_override_entry
dw_override_entry_comment dw_override_entry_comment
dw_override_history dw_override_history
st_override_comment st_override_comment
st_override_heading_1 st_override_heading_1
st_override_history st_override_history
end type
global w_amcp_client w_amcp_client

type variables
// Drag-drop logic.
string is_dragicon_unassigned
string is_dragicon_assigned
end variables

event ue_clearcriteria;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Triggered by Clear Criteria menu.  Reset/insert a row.
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Success
//	 0 = No action
//	-1 = Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////


IF	tab_1.SelectedTab = 1 THEN
	dw_client_search_criteria.Event ue_clearcriteria ()
END IF

Return 1
end event

on w_amcp_client.create
int iCurrent
call super::create
if this.MenuName = "m_update_amcp" then this.MenuID = create m_update_amcp
this.dw_selected_client=create dw_selected_client
this.tab_1=create tab_1
this.dw_client_list=create dw_client_list
this.dw_client_search_criteria=create dw_client_search_criteria
this.st_client_list=create st_client_list
this.st_client_search_critieria=create st_client_search_critieria
this.st_client_signed_office_history=create st_client_signed_office_history
this.dw_client_signed_office_history=create dw_client_signed_office_history
this.st_client_account_manager_history=create st_client_account_manager_history
this.dw_client_account_manager_history=create dw_client_account_manager_history
this.st_client_business_consultant_history=create st_client_business_consultant_history
this.dw_client_business_consultant_history=create dw_client_business_consultant_history
this.dw_override_entry=create dw_override_entry
this.dw_override_entry_comment=create dw_override_entry_comment
this.dw_override_history=create dw_override_history
this.st_override_comment=create st_override_comment
this.st_override_heading_1=create st_override_heading_1
this.st_override_history=create st_override_history
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_selected_client
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_client_list
this.Control[iCurrent+4]=this.dw_client_search_criteria
this.Control[iCurrent+5]=this.st_client_list
this.Control[iCurrent+6]=this.st_client_search_critieria
this.Control[iCurrent+7]=this.st_client_signed_office_history
this.Control[iCurrent+8]=this.dw_client_signed_office_history
this.Control[iCurrent+9]=this.st_client_account_manager_history
this.Control[iCurrent+10]=this.dw_client_account_manager_history
this.Control[iCurrent+11]=this.st_client_business_consultant_history
this.Control[iCurrent+12]=this.dw_client_business_consultant_history
this.Control[iCurrent+13]=this.dw_override_entry
this.Control[iCurrent+14]=this.dw_override_entry_comment
this.Control[iCurrent+15]=this.dw_override_history
this.Control[iCurrent+16]=this.st_override_comment
this.Control[iCurrent+17]=this.st_override_heading_1
this.Control[iCurrent+18]=this.st_override_history
end on

on w_amcp_client.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_selected_client)
destroy(this.tab_1)
destroy(this.dw_client_list)
destroy(this.dw_client_search_criteria)
destroy(this.st_client_list)
destroy(this.st_client_search_critieria)
destroy(this.st_client_signed_office_history)
destroy(this.dw_client_signed_office_history)
destroy(this.st_client_account_manager_history)
destroy(this.dw_client_account_manager_history)
destroy(this.st_client_business_consultant_history)
destroy(this.dw_client_business_consultant_history)
destroy(this.dw_override_entry)
destroy(this.dw_override_entry_comment)
destroy(this.dw_override_history)
destroy(this.st_override_comment)
destroy(this.st_override_heading_1)
destroy(this.st_override_history)
end on

event pfc_preopen;call super::pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Description: Set up tab pages for AMCP Client view.
//		Rules:		Only AMCP users may view tab pages with Compensation data.
//						
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	Description.
//
//////////////////////////////////////////////////////////////////////////////

// Disable the AMCP menu unless this is an AMCP user.
m_client lm_client
IF	gnv_app.ib_amcp_update THEN
ELSE
	lm_client = This.MenuID
	lm_client.m_amcp.visible = False
END IF

tab_1.Event ue_settabcontrol ()



end event

event pfe_postsave;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Fix this so that it NEVER returns a null value.
//						Instead return the value we were passed by the pfc_save ()
//						event.
//
//						Otherwise, the fact that the update was sucessful or
//						unsuccessful is lost.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

Return ai_save_rc
end event

type dw_selected_client from u_dw within w_amcp_client
integer x = 14
integer y = 4
integer width = 3470
integer height = 188
integer taborder = 10
string dataobject = "d_search_client_selected"
boolean vscrollbar = false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Be sure we are displaying a blank row.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.Reset ()
This.InsertRow ( 0 )

This.tag = ''


end event

type tab_1 from u_tab_client within w_amcp_client
event type integer ue_enabletabpages ( )
event type integer ue_disabletabpages ( )
integer x = 14
integer y = 188
integer width = 3639
integer height = 1660
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event ue_enabletabpages;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Enable tab pages 2 thru 3.
//						Trigger this event when an client is selected.
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Success
//	 0 = No action
//	-1 = Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

integer li_idx

FOR li_idx = 2 to 3
	This.Control[li_idx].enabled = True
NEXT

Return 1

end event

event ue_disabletabpages;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Disable tab pages 2 thru 3.
//						Reset all datawindows for an client.
//						Trigger this event when an client is deselected.
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Success
//	 0 = No action
//	-1 = Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

datawindow ldw_temp

integer li_idx
integer li_max

// Disable the tabs.
FOR li_idx = 2 to 3
	This.Control[li_idx].enabled = False
NEXT

// Reset all the datawindows retrieved using client's ClntID as
// an arguement.  Identify controls to be reset using the tag.
li_max = UpperBound ( Parent.Control )
FOR li_idx = 1 TO li_max
	
	CHOOSE CASE Parent.Control[li_idx].TypeOf ()
			
		CASE datawindow!
			
			ldw_temp = Parent.Control[li_idx]
			IF	Lower ( Left ( ldw_temp.tag, 2 ) ) = 'am' THEN
				ldw_temp.Reset ()
			END IF
			
		CASE ELSE
			
	END CHOOSE	
	
NEXT

Return 1

end event

event type integer ue_settabcontrol();call super::ue_settabcontrol;///////////////////////////////////////////////////////////////////////
//
// Description:	Use this event to call the of_createtab () function.
//						Use this event to call the of_wiretab () function.
//
//		Rules:		Only AMCP users may view tab pages with Compensation data.
//
//	Returns:	Integer	1 Success
//							-1 Failure
//
//////////////////////////////////////////////////////////////////////////////	
//
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

integer li_idx
integer li_max
string ls_tabs[]
graphicobject lgo_tabs[]
graphicobject lgo_null[]

// Start by making everything invisible.
li_max = UpperBound ( Parent.Control )
FOR li_idx = 1 to li_max
	Parent.Control[li_idx].visible = False
NEXT
// Make the tab and the header dw visible.
tab_1.visible 								= True
dw_selected_client.visible	= True

// Enforce Security.
IF	gnv_app.ib_amcp_update THEN
	// User may view and update pretty much everything.
	
	// Pass a string array containing a label for each tab page.
	ls_tabs[1]	= 'Select Client'
	ls_tabs[2]	= 'Override BCS, Leads, Closed Loans'
	ls_tabs[3]	= 'View Assignment History'
	
	This.of_createtabs ( ls_tabs )
	
	// Call of_wiretab for each tab page identifying each control
	// to be visible when the tab page is selected.
	
	// Select Client tab page.
	lgo_tabs[1]	= dw_client_search_criteria
	lgo_tabs[2]	= dw_client_list
	lgo_tabs[3]	= st_client_search_critieria
	lgo_tabs[4]	= st_client_list
	This.of_wiretab ( 1, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// Override BCS, Leads, Closed Loans tab page.
	lgo_tabs[1]	= dw_override_entry
	lgo_tabs[2]	= dw_override_entry_comment
	lgo_tabs[3]	= dw_override_history
	lgo_tabs[4]	= st_override_heading_1
	lgo_tabs[5]	= st_override_comment
	lgo_tabs[6]	= st_override_history
	This.of_wiretab ( 2, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// View Assignment History tab page.
	lgo_tabs[1]	= dw_client_signed_office_history
	lgo_tabs[2]	= dw_client_account_manager_history
	lgo_tabs[3]	= dw_client_business_consultant_history
	lgo_tabs[4]	= st_client_signed_office_history
	lgo_tabs[5]	= st_client_account_manager_history
	lgo_tabs[6]	= st_client_business_consultant_history
	This.of_wiretab ( 3, lgo_tabs )
	lgo_tabs		= lgo_null
	
ELSE
	// User is not allowed to view or update AMCP data
	
	// Pass a string array containing a label for each tab page.
	ls_tabs[1]	= 'Select Client'
	ls_tabs[2]	= 'View Assignment History'
	
	This.of_createtabs ( ls_tabs )
	
	// Call of_wiretab for each tab page identifying each control
	// to be visible when the tab page is selected.
	
	// Select Client tab page.
	lgo_tabs[1]	= dw_client_search_criteria
	lgo_tabs[2]	= dw_client_list
	lgo_tabs[3]	= st_client_search_critieria
	lgo_tabs[4]	= st_client_list
	This.of_wiretab ( 1, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// View Assignment History tab page.
	lgo_tabs[1]	= dw_client_signed_office_history
	lgo_tabs[2]	= dw_client_account_manager_history
	lgo_tabs[3]	= dw_client_business_consultant_history
	lgo_tabs[4]	= st_client_signed_office_history
	lgo_tabs[5]	= st_client_account_manager_history
	lgo_tabs[6]	= st_client_business_consultant_history
	This.of_wiretab ( 2, lgo_tabs )
	lgo_tabs		= lgo_null	
	
END IF

// Be sure we do not obsure the view.
This.BringToTop = False

// Disable tab pages until an client is selected.
This.Event ue_disabletabpages ()

// Force selection of the first tab page.
This.SelectedTab = 1

Return 1
end event

event selectionchanging;call super::selectionchanging;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Save any prior updates.
//						Check to be sure we have the right stuff to open the tab.
//						Call the function to display the corresponding datawindows.
//						Retrievals are done in the selectionchanged event.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

integer li_idx
integer li_max
integer li_return

string ls_clntid

// Check for updates.
li_return = Parent.Event pfc_save ()
IF li_return < 0 THEN
	Return 1
END IF

// Trap requests to return to search tab.
CHOOSE CASE	newindex
	CASE 1
		// Make the controls associated with the newly selected tab visible.
		This.of_setwiredobjectvisibility ( newindex )
		Return 0
END CHOOSE

// Be sure we have a selected client.
ls_clntid = dw_selected_client.GetItemString ( 1, 'client_clntid' )
IF	IsNull ( ls_clntid ) THEN
	CHOOSE CASE newindex
		CASE 2,3
			MessageBox ( 'Client', 'Please select a Client.', Information!, OK! )
			Return 1
	END CHOOSE
END IF

// Make the controls associated with the newly selected tab visible.
This.of_setwiredobjectvisibility ( newindex )

Return 0
end event

event selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Retrieve data for the new tab.
//						SetFocus to the appropriate control.
//						Enable/Disable Edit and View menu items.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_month
long ll_year
m_update_amcp lm_update_amcp
string ls_clntid
string ls_filterstring
window lw_parent

// Get a reference to our parent window's menu.
This.of_getparentwindow ( lw_parent )
lm_update_amcp = lw_parent.MenuID

// Get the ClntID of the Selected Client.
ls_clntid = dw_selected_client.GetItemString ( 1, 'client_clntid' )

// Do the necessary retrievals for the newly selected tab.
// Enable/disable menu items.
CHOOSE CASE newindex
		
	CASE 1
		// Select Client
		// No action required.
		
		// No updates.
		lm_update_amcp.m_edit.enabled = False
		lm_update_amcp.m_edit.m_delete.enabled 	= False
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = False
		lm_update_amcp.m_edit.m_save.enabled 		= False
		
		// Lists can be sorted and filtered.
		lm_update_amcp.m_view.enabled 						= True
		lm_update_amcp.m_view.m_clearcriteria.enabled 	= True
		
	CASE 2
		// Override BCS, Leads, Closed Loans.
		dw_override_entry.Retrieve ( ls_clntid )
		dw_override_entry.SetFocus ()
		dw_override_history.Retrieve ( ls_clntid )
		IF	dw_override_entry.RowCount () > 0 THEN			
			// Filter the history display.			
			ll_month = dw_override_entry.GetItemNumber ( 1, 'month' )
			ll_year	= dw_override_entry.GetItemNumber ( 1, 'year' )
			ls_filterstring = 'month=' + String (ll_month ) &
				+ ' and year=' + String ( ll_year )
			dw_override_history.SetFilter ( ls_filterstring )
			dw_override_history.Filter ()	
		END IF	
		
		// We do not delete or undelete.
		lm_update_amcp.m_edit.enabled 				= True
		lm_update_amcp.m_edit.m_delete.enabled 	= False
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = True
		lm_update_amcp.m_edit.m_save.enabled 		= True
		
		// Lists cannot be sorted or filtered.
		lm_update_amcp.m_view.enabled = False
		
	CASE 3
		// Assignment History.		
		dw_client_signed_office_history.Retrieve ( ls_clntid )
		dw_client_signed_office_history.SetFocus ()
		dw_client_account_manager_history.Retrieve ( ls_clntid )
		dw_client_business_consultant_history.Retrieve ( ls_clntid )
		
		// No updates.
		lm_update_amcp.m_edit.enabled = False
		lm_update_amcp.m_edit.m_delete.enabled 	= False
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = False
		lm_update_amcp.m_edit.m_save.enabled 		= False
		
		// Lists can be sorted and filtered.
		lm_update_amcp.m_view.enabled 						= True
		lm_update_amcp.m_view.m_clearcriteria.enabled 	= False
	
		
END CHOOSE

Return 0
end event

type dw_client_list from u_dw within w_amcp_client
integer x = 41
integer y = 724
integer width = 3575
integer height = 1108
integer taborder = 10
string dataobject = "d_search_client"
boolean hsplitscroll = true
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Set up standard list functionality using pfc services.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

This.of_setrowselect ( True )

This.tag = ''

end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	If the clicked row is  selected (highlighted), then
//						copy the row to the Selected Client header
//						and enable tabs.
//
//						If the clicked row is NOT selected, then reset the
//						Selected Client header and disable tabs.
//
//						Note: The ancestor event selects the row.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

IF	This.IsSelected ( row ) THEN
	dw_selected_client.Reset ()
	This.RowsCopy ( row, row, Primary!, dw_selected_client, 1, Primary! )
	tab_1.Event ue_enabletabpages ()
ELSE	
	dw_selected_client.Reset ()
	dw_selected_client.InsertRow ( 1 )
	tab_1.Event ue_disabletabpages ()
END IF

Return AncestorReturnValue


end event

event retrieveend;call super::retrieveend;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Force the user to select a row.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.SelectRow ( 0, False )
end event

type dw_client_search_criteria from u_dw within w_amcp_client
event type integer ue_search ( )
event type integer ue_clearcriteria ( )
integer x = 37
integer y = 368
integer width = 3575
integer height = 284
integer taborder = 10
string dataobject = "d_search_client_criteria"
boolean vscrollbar = false
end type

event ue_search;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Capture user entered critieria.  Retrieve list.
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Success
//	 0 = No action
//	-1 = Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_classidnum
long ll_return

string ls_am_lastname
string ls_clntid
string ls_tollfreenumber
string ls_clientshortname

window lw_frame

dw_client_list.Reset ()
dw_client_list.SetFilter ( '' )
dw_client_list.Filter ()

IF	This.RowCount () < 1 THEN
	Return -1
END IF

ls_clntid = This.GetItemString ( 1, 'client_clntid' )
IF	IsNull ( ls_clntid ) &
OR	Len ( Trim ( ls_clntid ) ) < 1 THEN
	ls_clntid = '%'
ELSE
	ls_clntid = Trim ( ls_clntid ) + '%'
END IF

ls_am_lastname = This.GetItemString ( 1, 'am_perslastname' )
IF	IsNull ( ls_am_lastname ) &
OR	Len ( Trim ( ls_am_lastname ) ) < 1 THEN
	ls_am_lastname = '%'
ELSE
	ls_am_lastname = Trim ( ls_am_lastname ) + '%'
END IF

ls_tollfreenumber = This.GetItemString ( 1, 'tollfreenumber' )
IF	IsNull ( ls_tollfreenumber ) &
OR	Len ( Trim ( ls_tollfreenumber ) ) < 1 THEN
	ls_tollfreenumber = '%'
ELSE
	ls_tollfreenumber = Trim ( ls_tollfreenumber ) + '%'
END IF

ls_clientshortname = This.GetItemString ( 1, 'company_compshortname' )
IF	IsNull ( ls_clientshortname ) &
OR	Len ( Trim ( ls_clientshortname ) ) < 1 THEN
	ls_clientshortname = '%'
ELSE
	ls_clientshortname = Trim ( ls_clientshortname ) + '%'
END IF

// Require more than one criteria.
IF	ls_clntid = '%' &
	AND IsNull ( ll_classidnum ) &
	AND ls_clientshortname = '%' &
	AND ls_am_lastname = '%' &
	AND ls_tollfreenumber = '%' THEN
	MessageBox ( 'AMCP Client', 'Please enter at least one search criteria.' )
	Return -1
END IF

// Handle search by Business Source ( ll_classidnum ).
ll_classidnum = This.GetItemNumber ( 1, 'classification_classidnum' )
//IF	IsNull ( ll_classidnum ) THEN
//	// Use only other criteria. Do not use ClassIDNum.
//	dw_client_list.dataobject = 'd_search_client'
//	dw_client_list.of_settransobject ( SQLCA )
//	ll_return =	dw_client_list.Retrieve ( &
//		ls_clntid, &
//		ls_clientshortname, & 
//		ls_am_lastname, &
//		ls_tollfreenumber )
//ELSE
//	// Use the selected ClassIDNum.
//	dw_client_list.dataobject = 'd_search_client_businesssource'
//	dw_client_list.of_settransobject ( SQLCA )
//	ll_return =	dw_client_list.Retrieve ( &
//		ls_clntid, &
//		ll_classidnum, &
//		ls_clientshortname, & 
//		ls_am_lastname, &
//		ls_tollfreenumber )
//END IF

// Use the stored procedure.
dw_client_list.dataobject = 'd_proc_amcp_clientsearch'
dw_client_list.of_settransobject ( SQLCA )
ll_return =	dw_client_list.Retrieve ( &
	ls_clntid, &
	ls_clientshortname, & 
	ls_am_lastname, &
	ls_tollfreenumber, & 
	ll_classidnum )

CHOOSE CASE ll_return
	CASE is < 0
		//?? Database error.
		Return -1
	CASE 0
		lw_frame = gnv_app.of_getframe ()
		lw_frame.SetMicroHelp ( 'No Clients for your criteria.' )
		Return 0
	CASE ELSE
END CHOOSE
	

Return 1
end event

event ue_clearcriteria;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Triggered by Clear Criteria menu.  Reset/insert a row.
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Success
//	 0 = No action
//	-1 = Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.Reset ()

This.InsertRow ( 0 )

Return 1
end event

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  React to click of Search button.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

CHOOSE CASE dwo.name
		
	CASE 'b_search'
		// Trigger the event to retrieve Client list.
		IF	This.AcceptText () < 0 THEN
		ELSE
			This.Event ue_search ()
		END IF
		
	CASE ELSE
		
END CHOOSE

Return 0
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Not updateable.  Insert a row.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////


datawindowchild ldw_temp
long ll_rowcount
n_ds lds_temp

This.ib_isupdateable = False

// If we can find the cached list of business sources, copy the rows.
// Otherwise retrieve.  We need to insert a blank row so that users
// can undo the dropdown selection.
This.GetChild ( 'classification_classidnum', ldw_temp )
IF	gnv_app.inv_dwcache.of_getRegistered ( 'clntbussrce', lds_temp ) < 1 THEN
	ldw_temp.Retrieve ( )
ELSE
	ll_rowcount = lds_temp.RowCount ()
	IF	ll_rowcount < 1 THEN
		ldw_temp.Retrieve ( )
	ELSE
		ll_rowcount = lds_temp.RowsCopy ( 1, ll_rowcount, Primary!, ldw_temp, 1, Primary! )
	END IF
END IF
ldw_temp.InsertRow ( 1 )

// Now we can insert a new row.
This.Event ue_clearcriteria ()

This.tag = ''
end event

type st_client_list from statictext within w_amcp_client
integer x = 41
integer y = 668
integer width = 3378
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Highlight a single Client on the List to view/update.  The Selected Client Field will prefill and tabs will enable."
boolean focusrectangle = false
end type

type st_client_search_critieria from statictext within w_amcp_client
integer x = 37
integer y = 308
integer width = 3387
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enter Client ID for faster search.  Select Business Source from the drop down box.   Case sensitive. Partial entries supported. No wild card (~'%~') needed."
boolean focusrectangle = false
end type

type st_client_signed_office_history from statictext within w_amcp_client
integer x = 50
integer y = 308
integer width = 3378
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "SIGNED Office (Franchise) Assignment History for the Selected Client"
boolean focusrectangle = false
end type

type dw_client_signed_office_history from u_dw within w_amcp_client
string tag = "am_3"
integer x = 50
integer y = 368
integer width = 3378
integer height = 508
integer taborder = 20
string dataobject = "d_client_assigned_signed_office_history"
boolean hsplitscroll = true
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Set up standard list functionality using pfc services.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

// We are setting the sort here because this datawindow object is used in many places.
This.SetSort ( 'clntfranchise_begineffdate D, clntfranchise_endeffdate D, office_franchisenum A' )
This.Sort ()

This.tag = 'am_client'


end event

type st_client_account_manager_history from statictext within w_amcp_client
integer x = 50
integer y = 892
integer width = 3378
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Account Manager Assignment History for the Selected Client"
boolean focusrectangle = false
end type

type dw_client_account_manager_history from u_dw within w_amcp_client
string tag = "am_6"
integer x = 50
integer y = 944
integer width = 3378
integer height = 412
integer taborder = 20
string dataobject = "d_client_assigned_acct_manager_history"
boolean hsplitscroll = true
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Set up standard list functionality using pfc services.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

// We are setting the sort here because this datawindow object is used in many places.
This.SetSort ( 'officeacctmanager_begineffdate D, officeacctmanager_endeffdate D, office_franchisenum A' )
This.Sort ()

This.tag = 'am_office_history'

end event

type st_client_business_consultant_history from statictext within w_amcp_client
integer x = 50
integer y = 1372
integer width = 3378
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Business Consultant Assignment History for the Selected Client"
boolean focusrectangle = false
end type

type dw_client_business_consultant_history from u_dw within w_amcp_client
string tag = "am_3"
integer x = 50
integer y = 1424
integer width = 3378
integer height = 412
integer taborder = 30
string dataobject = "d_client_assigned_bus_consultant_history"
boolean hsplitscroll = true
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Set up standard list functionality using pfc services.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // Simple a=b.

// We are setting the sort here because this datawindow object is used in many places.
This.SetSort ( 'clntfranchise_begineffdate D, clntfranchise_endeffdate D, office_franchisenum A' )
This.Sort ()

This.tag = 'am_client'


end event

type dw_override_entry from u_dw within w_amcp_client
event type long ue_recalculate_ytd ( )
string tag = "am_4"
integer x = 37
integer y = 368
integer width = 2149
integer height = 860
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_client_amcp_override"
end type

event ue_recalculate_ytd;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Recalculate the YTD values.
//						Note: We could use a computed column on the dwo except that 
//								we are sorted in the wrong order.
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Success
//	 0 = No action
//	-1 = Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_bcs
long ll_bcsytd
long ll_column
long ll_currentmonth
long ll_currentyear
long ll_leadscreated
long ll_leadscreatedytd
long ll_loansclosed
long ll_loansclosedytd
long ll_month
long ll_row
long ll_rowcount
string ls_findstring

// Save enough information to find the current row.
ll_row				= GetRow ()
IF	ll_row < 1 THEN
	Return 1
END IF
ll_currentmonth 	= This.GetItemNumber ( ll_row, 'month' )
ll_currentyear 	= This.GetItemNumber ( ll_row, 'year' )

ll_column	= This.GetColumn ()

// Be sure we are sorted in the right order.
This.Sort ()

ll_rowcount = This.RowCount ()

// Loop from last to first row.
FOR ll_row = ll_rowcount to 1 Step -1
	ll_month 			= This.GetItemNumber ( ll_row, 'month' )
	ll_bcs				= This.GetItemNumber ( ll_row, 'bcs' )
	ll_leadscreated 	= This.GetItemNumber ( ll_row, 'leadscreated' )
	ll_loansclosed		= This.GetItemNumber ( ll_row, 'loansclosed' )
	
	// Be careful of null values.
	IF	IsNull ( ll_bcs ) THEN
		ll_bcs = 0
	END IF
	IF	IsNull ( ll_leadscreated ) THEN
		ll_leadscreated = 0
	END IF
	IF	IsNull ( ll_loansclosed ) THEN
		ll_loansclosed = 0
	END IF
	
	// Restart the accumulation on the first month of a year.
	IF	ll_month = 1 THEN
		ll_bcsytd 				= ll_bcs
		ll_leadscreatedytd 	= ll_leadscreated
		ll_loansclosedytd		= ll_loansclosed
	ELSE
		ll_bcsytd 				= ll_bcsytd + ll_bcs
		ll_leadscreatedytd 	= ll_leadscreatedytd + ll_leadscreated
		ll_loansclosedytd		= ll_loansclosedytd + ll_loansclosed
	END IF
	
	// Display the YTD value.  Avoid unnecessary updates.
	This.SetItem ( ll_row, 'bcsytd', ll_bcsytd )
	This.SetItem ( ll_row, 'leadscreatedytd', ll_leadscreatedytd )
	This.SetItem ( ll_row, 'loansclosedytd', ll_loansclosedytd )
	
	This.SetItemStatus ( ll_row, 'bcsytd', Primary!, NotModified! )
	This.SetItemStatus ( ll_row, 'leadscreatedytd', Primary!, NotModified! )
	This.SetItemStatus ( ll_row, 'loansclosedytd', Primary!, NotModified! )
	
NEXT

// Put us back on the original row and column.
ls_findstring = &
	'year=' + string ( ll_currentyear ) + ' and month=' + string ( ll_currentmonth )
ll_row = This.Find ( ls_findstring, 1, ll_rowcount )
This.SetRow ( ll_row )
This.ScrollToRow ( ll_row )
This.SetColumn ( ll_column )

This.SetFocus ()

Return 1
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Share data with the comments display.
//						Turn on required column service.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ShareData ( dw_override_entry_comment )

This.of_SetReqColumn ( True )

This.SetRowFocusIndicator ( Hand! )

This.tag = 'am_override'

end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Scroll the comment datawindow to the same row.
//						Filter the history datawindow.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_month
long ll_year
string ls_filterstring

IF currentrow < 1 THEN
	Return AncestorReturnValue
END IF

dw_override_entry_comment.ScrollToRow ( currentrow )

ll_month = This.GetItemNumber ( currentrow, 'month' )
ll_year	= This.GetItemNumber ( currentrow, 'year' )

IF	IsNull ( ll_month ) &
OR IsNull ( ll_year ) THEN
	ll_month = 0
	ll_year = 0
END IF

ls_filterstring = 'month=' + String (ll_month ) &
	+ ' and year=' + String ( ll_year )
dw_override_history.SetFilter ( ls_filterstring )
dw_override_history.Filter ()	

Return AncestorReturnValue
end event

event pfc_validation;call super::pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Add the ClntID of the Selected Client.
//
//						Verify that the Year/Month key has no duplicates.
//						
//						Note that required data is checked by the ancestor script.
//
//						Insert a row in the history datawindow for each modification.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

// Be sure to stop if the ancestor script has trapped errors.
IF	AncestorReturnValue < 0 THEN
	Return AncestorReturnValue
END IF

datetime ldt_datemdfd
dwitemstatus le_itemstatus

long ll_month
long ll_year
long ll_month_priorrow
long ll_year_priorrow
long ll_row
long ll_rowcount
long ll_rowhistory

string ls_clntid
string ls_filterstring

ldt_datemdfd = DateTime ( Today(), Now() )

// Be sure we have a selected manager key.
IF	dw_selected_client.RowCount () <> 1 THEN
	MessageBox ( 'Programmer Error Override BCS, etc.', &
		'ParentWindow.Title - dw_override_entry:pfc_validation.  ' &
		+ 'Wrong number of Selected Clients.', StopSign!, OK! )
	Return -1
END IF

// Sort the display so that we can verify that dates have no gaps.
This.SetSort ( 'year D, month D' )
This.Sort ()

ls_clntid = dw_selected_client.GetItemString ( 1, 'client_clntid' )

ll_rowcount = This.RowCount ()

FOR ll_row = 1 TO ll_rowcount
	
	// Be sure that new rows have a ClntID.		
	le_itemstatus 			= This.GetItemStatus ( ll_row, 0, Primary! )
		
	CHOOSE CASE le_itemstatus
		CASE NewModified!
			This.SetItem ( ll_row, 'clntid', ls_clntid )
			
		CASE DataModified!
	END CHOOSE
	
	CHOOSE CASE ll_row
			
		CASE 1
			ll_month_priorrow = This.GetItemNumber ( 1, 'month' )
			ll_year_priorrow 	= This.GetItemNumber ( 1, 'year' )
			
		CASE ELSE
			// Rule:  No duplicates.
			ll_year 		= This.GetItemNumber ( ll_row, 'year' )
			ll_month 	= This.GetItemNumber ( ll_row, 'month' )	

			IF	ll_year = ll_year_priorrow &
			AND ll_month = ll_month_priorrow THEN
				MessageBox ( 'Client Overrides', &
					'The Year/Month cannot the same as that on the prior row.  Please correct.', Information!, OK! )
				This.SetRow ( ll_row )
				This.SetColumn ( 'year' )
				This.SetFocus ()
				Return -1
			END IF
			
			ll_year_priorrow	= ll_year
			ll_month_priorrow	= ll_month
			
	END CHOOSE
			
NEXT

// If all of the validation is successful, then insert rows in the history control.
// Note: DO NOT do this if there is any possibility of an error.  We are not
// prepared to run this script twice without saving.
long ll_sequencenum

// Verify that history is predictably sorted.
dw_override_history.SetSort ( 'year D, month D, sequencenum D' )
dw_override_history.Sort ()

// Loop thru user entries.
FOR ll_row = 1 TO ll_rowcount
	
	// Find modified rows.
	le_itemstatus 			= This.GetItemStatus ( ll_row, 0, Primary! )
	
	CHOOSE CASE le_itemstatus
			
		CASE NewModified!, DataModified!
			
			// Flag this row as 'saved' so we protect year/month.
			This.SetItem ( ll_row, 'cc_saved', 1 )
			This.SetItem ( ll_row, 'datemdfd', ldt_datemdfd )
						
			// Set the history filter.  It's just easier.
			ll_year 	= This.GetItemNumber ( ll_row, 'year' )
			ll_month	= This.GetItemNumber ( ll_row, 'month' )
			
			// Calculate the yearmonth.			
			This.SetItem ( ll_row, 'yearmonth', &
				( ll_year * 100 ) + ll_month )
			
			ls_filterstring = 'year=' + String ( ll_year ) &
				+ ' and month=' + String ( ll_month )
			dw_override_history.SetFilter ( ls_filterstring )
			dw_override_history.Filter ()
			
			// Establish the new sequence number.
			IF	dw_override_history.RowCount () > 0 THEN
				ll_sequencenum = dw_override_history.GetItemNumber ( 1, 'sequencenum' )
			ELSE
				ll_sequencenum = 0
			END IF
			ll_sequencenum = ll_sequencenum + 1
			
			// Insert a new row.
			ll_rowhistory = dw_override_history.InsertRow ( 1 )
			dw_override_history.SetItem ( ll_rowhistory, 'clntid', ls_clntid )
			dw_override_history.SetItem ( ll_rowhistory, 'sequencenum', ll_sequencenum )
			dw_override_history.SetItem ( ll_rowhistory, 'year', ll_year )
			dw_override_history.SetItem ( ll_rowhistory, 'month', ll_month )
			dw_override_history.SetItem ( ll_rowhistory, 'yearmonth', &
				( ll_year * 100 ) + ll_month )
			dw_override_history.SetItem ( ll_rowhistory, 'datemdfd', ldt_datemdfd )
			
			// Get the current and prior values.
			dw_override_history.SetItem ( ll_rowhistory, 'frombcs', &
				This.GetItemNumber ( ll_row, 'bcs', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'tobcs', &
				This.GetItemNumber ( ll_row, 'bcs' ) )
			dw_override_history.SetItem ( ll_rowhistory, 'fromleadscreated', &
				This.GetItemNumber ( ll_row, 'leadscreated', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'toleadscreated', &
				This.GetItemNumber ( ll_row, 'leadscreated' ) )
			dw_override_history.SetItem ( ll_rowhistory, 'fromloansclosed', &
				This.GetItemNumber ( ll_row, 'loansclosed', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'toloansclosed', &
				This.GetItemNumber ( ll_row, 'loansclosed' ) )
				
			// Copy the current comment.	
			dw_override_history.SetItem ( ll_rowhistory, 'comment', &
				This.GetItemString ( ll_row, 'comment' ) )

	END CHOOSE	
	
NEXT

// Set the filter back to show changes for the current row.
ll_row = This.GetRow ()
ll_year 	= This.GetItemNumber ( ll_row, 'year' )
ll_month	= This.GetItemNumber ( ll_row, 'month' )

ls_filterstring = 'year=' + String ( ll_year ) &
	+ ' and month=' + String ( ll_month )
dw_override_history.SetFilter ( ls_filterstring )
dw_override_history.Filter ()

Return 1
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Be sure we have a valid month and year.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

integer ll_test

// We'll check required fields on Save.
IF	Len ( Trim ( data ) ) < 1 THEN
	Return 0
END IF

// Check field entered only. See pfc_validation for data relationship checks.
CHOOSE CASE dwo.name
		
	CASE 'year'
		ll_test = Integer ( data )
		IF	ll_test > 2099 &
		OR ll_test < 2000 THEN
			MessageBox ( 'AMCP Overrides', 'Year must be between 2000 and 2099.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
	CASE 'month'
		ll_test = Integer ( data )
		IF	ll_test > 12 &
		OR ll_test < 1 THEN
			MessageBox ( 'AMCP Override', 'Month must be between 1 and 12.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
END CHOOSE

This.Event Post ue_recalculate_ytd ()

Return 0
end event

event pfc_insertrow;call super::pfc_insertrow;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	EXTEND the ancestor script to default the Begin Year/Month.
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_month
long ll_year

// Skip errors.
IF	AncestorReturnValue < 1 THEN
	Return AncestorReturnValue
END IF

CHOOSE CASE	AncestorReturnValue 
	CASE This.RowCount ()
		// There is no prior row.  
		// Default Year/Month to today.
		ll_year 	= Year ( Today () )
		ll_month = Month ( Today () )
		
	CASE ELSE
		// There is a previous Year/Month.
		// Set Begin Year/Month to previous end plus one month.
		ll_year	= This.GetItemNumber ( AncestorReturnValue + 1, 'year' )
		ll_month	= This.GetItemNumber ( AncestorReturnValue + 1, 'month' )
		IF	ll_month = 12 THEN
			ll_year = ll_year + 1 
			ll_month	= 1
		ELSE
			ll_month = ll_month + 1
		END IF

END CHOOSE

This.SetItem ( AncestorReturnValue, 'year', ll_year )
This.SetItem ( AncestorReturnValue, 'month', ll_month )
This.SetColumn ( 'year' )
This.SetRow ( AncestorReturnValue )

Return AncestorReturnValue

end event

event retrieveend;call super::retrieveend;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Recalculate the YTD values.
//						Note: We could use a computed column on the dwo except that 
//								we are sorted in the wrong order.
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = Success
//	 0 = No action
//	-1 = Error
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.Event Post ue_recalculate_ytd ()

Return AncestorReturnValue
end event

event pfc_update;call super::pfc_update;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	EXTEND the ancestor script to update the override history.
//						We need to update it AFTER we update this table.
//						Since we make it modified in this datawindow's pfc_validation
//						event, it will not be in the window's list of objects to
//						update.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

IF	AncestorReturnValue < 0 THEN
	Return AncestorReturnValue
ELSE
	Return dw_override_history.Event pfc_update ( ab_accepttext, ab_resetflag )
END IF
end event

type dw_override_entry_comment from u_dw within w_amcp_client
integer x = 2203
integer y = 368
integer width = 1253
integer height = 768
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_client_amcp_override_comment"
boolean vscrollbar = false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = False

This.of_setreqcolumn ( True )

This.tag = ''


end event

event ue_dwnkey;call super::ue_dwnkey;//////////////////////////////////////////////////////////////////////////////
//
//!!	Description:  Placeholder event to be used to control scrolling.
//
//	Arguments:  keycode		key
//					unsignedlog	keyflags
//
//	Returns:  long
//	 1 = Success
//	 0 = No action
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

//Example script:
long ll_current_row

CHOOSE CASE key
	CASE	KeyPageUp!, &
			KeyPageDown!, &
			KeyEnd!, &
			KeyHome!, &
			KeyLeftArrow!, &
			KeyUpArrow!, &
			KeyRightArrow!, &
			KeyDownArrow!, &
			KeyTab!
		
		// We cannot stop the action from being performed.
		// We can only scroll back to the current row.
		ll_current_row = This.GetRow ()
		This.Post ScrollToRow ( ll_current_row )
		
	CASE ELSE
		
END CHOOSE

Return 0


end event

type dw_override_history from u_dw within w_amcp_client
event type long ue_retrieveafterupdate ( )
string tag = "am_5"
integer x = 37
integer y = 1312
integer width = 3410
integer height = 496
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_client_amcp_override_history"
boolean hsplitscroll = true
end type

event type long ue_retrieveafterupdate();//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Retrieve after an update.  Reset the filter.
//
//	Arguments:  none
//
//	Returns:  long	Count of rows retrieved.
//		
//	
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

long ll_month
long ll_row
long ll_rowcount
long ll_year

string ls_clntid

ls_clntid 	= dw_selected_client.GetItemString ( 1, 'client_clntid' )

ll_rowcount 	= This.Retrieve ( ls_clntid )

// Set the filter back to show changes for the current row.
ll_row 	= dw_override_entry.GetRow ()
IF	ll_row > 0 THEN
	ll_year 	= dw_override_entry.GetItemNumber ( ll_row, 'year' )
	ll_month	= dw_override_entry.GetItemNumber ( ll_row, 'month' )	
	This.SetFilter ( 'year=' + String ( ll_year ) &
		+ ' and month=' + String ( ll_month ) )
	This.Filter ()
END IF

Return ll_rowcount
end event

event updateend;call super::updateend;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Post an event to retrieve after update.
//						We need to do this because the database sets the
//						Modified On field.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.Event Post ue_retrieveafterupdate ()

Return AncestorReturnValue

end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	We are updateable.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = True

This.tag = 'am_override_history'
end event

type st_override_comment from statictext within w_amcp_client
integer x = 2203
integer y = 308
integer width = 1253
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Comment for selected Year/Month"
boolean focusrectangle = false
end type

type st_override_heading_1 from statictext within w_amcp_client
integer x = 41
integer y = 308
integer width = 1591
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "BCS, Leads and Closed Loans for Selected Client"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_override_history from statictext within w_amcp_client
integer x = 37
integer y = 1248
integer width = 2011
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "BCS, Leads and Closed Loan Overrides for the selected Year/Month"
boolean focusrectangle = false
end type

