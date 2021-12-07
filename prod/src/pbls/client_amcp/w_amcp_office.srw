$PBExportHeader$w_amcp_office.srw
forward
global type w_amcp_office from w_client_sheet
end type
type dw_selected_office from u_dw within w_amcp_office
end type
type tab_1 from u_tab_client within w_amcp_office
end type
type tab_1 from u_tab_client within w_amcp_office
end type
type dw_office_list from u_dw within w_amcp_office
end type
type dw_office_search_criteria from u_dw within w_amcp_office
end type
type st_office_list from statictext within w_amcp_office
end type
type st_office_search_critieria from statictext within w_amcp_office
end type
type cb_assign_manager from commandbutton within w_amcp_office
end type
type st_account_manager_list from statictext within w_amcp_office
end type
type st_account_manager_list_header from statictext within w_amcp_office
end type
type st_account_manager_search_criteria_head from statictext within w_amcp_office
end type
type st_account_manager_search_critieria from statictext within w_amcp_office
end type
type st_assigned_unsigned_office_header from statictext within w_amcp_office
end type
type st_assigned_unsigned_office_list from statictext within w_amcp_office
end type
type dw_office_assignment_history from u_dw within w_amcp_office
end type
type st_office_assignment_history from statictext within w_amcp_office
end type
type cb_end_assignment from commandbutton within w_amcp_office
end type
type st_override_heading_2 from statictext within w_amcp_office
end type
type st_override_heading_1 from statictext within w_amcp_office
end type
type dw_override_entry from u_dw within w_amcp_office
end type
type st_override_comment from statictext within w_amcp_office
end type
type dw_override_entry_comment from u_dw within w_amcp_office
end type
type st_override_history from statictext within w_amcp_office
end type
type dw_override_history from u_dw within w_amcp_office
end type
type dw_account_manager_list from u_dw within w_amcp_office
end type
type dw_account_manager_search_criteria from u_dw within w_amcp_office
end type
type dw_assigned_unsigned_office_list from u_dw within w_amcp_office
end type
end forward

global type w_amcp_office from w_client_sheet
integer width = 3685
integer height = 2016
string title = "Office AMCP Maintenance"
string menuname = "m_update_amcp"
event type integer ue_clearcriteria ( )
dw_selected_office dw_selected_office
tab_1 tab_1
dw_office_list dw_office_list
dw_office_search_criteria dw_office_search_criteria
st_office_list st_office_list
st_office_search_critieria st_office_search_critieria
cb_assign_manager cb_assign_manager
st_account_manager_list st_account_manager_list
st_account_manager_list_header st_account_manager_list_header
st_account_manager_search_criteria_head st_account_manager_search_criteria_head
st_account_manager_search_critieria st_account_manager_search_critieria
st_assigned_unsigned_office_header st_assigned_unsigned_office_header
st_assigned_unsigned_office_list st_assigned_unsigned_office_list
dw_office_assignment_history dw_office_assignment_history
st_office_assignment_history st_office_assignment_history
cb_end_assignment cb_end_assignment
st_override_heading_2 st_override_heading_2
st_override_heading_1 st_override_heading_1
dw_override_entry dw_override_entry
st_override_comment st_override_comment
dw_override_entry_comment dw_override_entry_comment
st_override_history st_override_history
dw_override_history dw_override_history
dw_account_manager_list dw_account_manager_list
dw_account_manager_search_criteria dw_account_manager_search_criteria
dw_assigned_unsigned_office_list dw_assigned_unsigned_office_list
end type
global w_amcp_office w_amcp_office

type variables
// Drag-drop logic.
string is_dragicon_unassigned
string is_dragicon_assigned

n_ds ids_clientfranchise
n_ds ids_officeacctmanager
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

CHOOSE CASE tab_1.SelectedTab
	CASE 1
		dw_office_search_criteria.Event ue_clearcriteria ()
	CASE 2
		dw_account_manager_search_criteria.Event ue_clearcriteria ()
	CASE ELSE
END CHOOSE		

Return 1
end event

on w_amcp_office.create
int iCurrent
call super::create
if this.MenuName = "m_update_amcp" then this.MenuID = create m_update_amcp
this.dw_selected_office=create dw_selected_office
this.tab_1=create tab_1
this.dw_office_list=create dw_office_list
this.dw_office_search_criteria=create dw_office_search_criteria
this.st_office_list=create st_office_list
this.st_office_search_critieria=create st_office_search_critieria
this.cb_assign_manager=create cb_assign_manager
this.st_account_manager_list=create st_account_manager_list
this.st_account_manager_list_header=create st_account_manager_list_header
this.st_account_manager_search_criteria_head=create st_account_manager_search_criteria_head
this.st_account_manager_search_critieria=create st_account_manager_search_critieria
this.st_assigned_unsigned_office_header=create st_assigned_unsigned_office_header
this.st_assigned_unsigned_office_list=create st_assigned_unsigned_office_list
this.dw_office_assignment_history=create dw_office_assignment_history
this.st_office_assignment_history=create st_office_assignment_history
this.cb_end_assignment=create cb_end_assignment
this.st_override_heading_2=create st_override_heading_2
this.st_override_heading_1=create st_override_heading_1
this.dw_override_entry=create dw_override_entry
this.st_override_comment=create st_override_comment
this.dw_override_entry_comment=create dw_override_entry_comment
this.st_override_history=create st_override_history
this.dw_override_history=create dw_override_history
this.dw_account_manager_list=create dw_account_manager_list
this.dw_account_manager_search_criteria=create dw_account_manager_search_criteria
this.dw_assigned_unsigned_office_list=create dw_assigned_unsigned_office_list
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_selected_office
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_office_list
this.Control[iCurrent+4]=this.dw_office_search_criteria
this.Control[iCurrent+5]=this.st_office_list
this.Control[iCurrent+6]=this.st_office_search_critieria
this.Control[iCurrent+7]=this.cb_assign_manager
this.Control[iCurrent+8]=this.st_account_manager_list
this.Control[iCurrent+9]=this.st_account_manager_list_header
this.Control[iCurrent+10]=this.st_account_manager_search_criteria_head
this.Control[iCurrent+11]=this.st_account_manager_search_critieria
this.Control[iCurrent+12]=this.st_assigned_unsigned_office_header
this.Control[iCurrent+13]=this.st_assigned_unsigned_office_list
this.Control[iCurrent+14]=this.dw_office_assignment_history
this.Control[iCurrent+15]=this.st_office_assignment_history
this.Control[iCurrent+16]=this.cb_end_assignment
this.Control[iCurrent+17]=this.st_override_heading_2
this.Control[iCurrent+18]=this.st_override_heading_1
this.Control[iCurrent+19]=this.dw_override_entry
this.Control[iCurrent+20]=this.st_override_comment
this.Control[iCurrent+21]=this.dw_override_entry_comment
this.Control[iCurrent+22]=this.st_override_history
this.Control[iCurrent+23]=this.dw_override_history
this.Control[iCurrent+24]=this.dw_account_manager_list
this.Control[iCurrent+25]=this.dw_account_manager_search_criteria
this.Control[iCurrent+26]=this.dw_assigned_unsigned_office_list
end on

on w_amcp_office.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_selected_office)
destroy(this.tab_1)
destroy(this.dw_office_list)
destroy(this.dw_office_search_criteria)
destroy(this.st_office_list)
destroy(this.st_office_search_critieria)
destroy(this.cb_assign_manager)
destroy(this.st_account_manager_list)
destroy(this.st_account_manager_list_header)
destroy(this.st_account_manager_search_criteria_head)
destroy(this.st_account_manager_search_critieria)
destroy(this.st_assigned_unsigned_office_header)
destroy(this.st_assigned_unsigned_office_list)
destroy(this.dw_office_assignment_history)
destroy(this.st_office_assignment_history)
destroy(this.cb_end_assignment)
destroy(this.st_override_heading_2)
destroy(this.st_override_heading_1)
destroy(this.dw_override_entry)
destroy(this.st_override_comment)
destroy(this.dw_override_entry_comment)
destroy(this.st_override_history)
destroy(this.dw_override_history)
destroy(this.dw_account_manager_list)
destroy(this.dw_account_manager_search_criteria)
destroy(this.dw_assigned_unsigned_office_list)
end on

event pfc_preopen;call super::pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Description: Set up tab pages for AMCP Office view.
//		Rules:		Only AMCP users may view tab pages with Compensation data.
//						
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

// Disable the AMCP menu unless this is an AMCP user.
m_client lm_client
IF	gnv_app.ib_amcp_update THEN
ELSE
	lm_client = This.MenuID
	lm_client.m_amcp.visible = False
END IF

tab_1.Event ue_settabcontrol ()

This.ids_clientfranchise = Create n_ds
This.ids_clientfranchise.dataobject = 'd_office_clntfranchise_hidden'
This.ids_clientfranchise.of_SetTransObject ( SQLCA )

This.ids_officeacctmanager = Create n_ds
This.ids_officeacctmanager.dataobject = 'd_office_officeaccountmanager_hidden'
This.ids_officeacctmanager.of_SetTransObject ( SQLCA )



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

event close;call super::close;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Tidy up.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

IF	IsValid ( This.ids_clientfranchise ) THEN
	Destroy ( This.ids_clientfranchise )
END IF

IF	IsValid ( This.ids_officeacctmanager ) THEN
	Destroy ( This.ids_officeacctmanager )
END IF
end event

type dw_selected_office from u_dw within w_amcp_office
integer x = 14
integer y = 12
integer width = 3639
integer height = 188
integer taborder = 10
string dataobject = "d_search_office_selected"
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

This.Tag = ''

end event

type tab_1 from u_tab_client within w_amcp_office
event type integer ue_enabletabpages ( )
event type integer ue_disabletabpages ( )
integer x = 14
integer y = 204
integer width = 3639
integer height = 1652
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event ue_enabletabpages;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Enable tab pages 2 thru 5.
//						Trigger this event when an Office is selected.
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

FOR li_idx = 2 to 5
	This.Control[li_idx].enabled = True
NEXT

Return 1

end event

event ue_disabletabpages;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Disable tab pages 2 thru 5.
//						Reset all datawindows for an Office.
//						Trigger this event when an Office is deselected.
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
FOR li_idx = 2 to 5
	This.Control[li_idx].enabled = False
NEXT

// Reset all the datawindows retrieved using Office's officeidnum as
// an arguement.  Identify controls to be reset using the tag.
li_max = UpperBound ( Parent.Control )
FOR li_idx = 1 TO li_max
	
	CHOOSE CASE Parent.Control[li_idx].TypeOf ()
			
		CASE datawindow!
			
			ldw_temp = Parent.Control[li_idx]
			IF	Lower ( Left ( ldw_temp.tag, 2 ) ) = 'of' THEN
				ldw_temp.Reset ()
			END IF
			
		CASE ELSE
			
	END CHOOSE	
	
NEXT

Return 1

end event

event ue_settabcontrol;call super::ue_settabcontrol;///////////////////////////////////////////////////////////////////////
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
tab_1.visible 					= True
dw_selected_office.visible	= True

// Enforce Security.
IF	gnv_app.ib_amcp_update THEN
	// User may view and update pretty much everything.
	
	// Pass a string array containing a label for each tab page.
	ls_tabs[1]	= 'Select Office'
	ls_tabs[2]	= 'Assign Account Manager'
	ls_tabs[3]	= 'View Assignment History'
	ls_tabs[4]	= 'Override Corporate BCS'
	
	This.of_createtabs ( ls_tabs )
	
	// Call of_wiretab for each tab page identifying each control
	// to be visible when the tab page is selected.
	
	// Select Office tab page.
	lgo_tabs[1]	= dw_office_search_criteria
	lgo_tabs[2]	= dw_office_list
	lgo_tabs[3]	= st_office_search_critieria
	lgo_tabs[4]	= st_office_list
	This.of_wiretab ( 1, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// Assign Account Manager tab page.
	lgo_tabs[1]		= dw_account_manager_search_criteria
	lgo_tabs[2]		= st_account_manager_search_critieria
	lgo_tabs[3]		= st_account_manager_search_criteria_head
	lgo_tabs[4]		= dw_account_manager_list
	lgo_tabs[5]		= st_account_manager_list
	lgo_tabs[6]		= st_account_manager_list_header
	lgo_tabs[7]		= dw_assigned_unsigned_office_list
	lgo_tabs[8]		= st_assigned_unsigned_office_header
	lgo_tabs[9]		= st_assigned_unsigned_office_list
	lgo_tabs[10]	= cb_assign_manager
	lgo_tabs[11]	= cb_end_assignment
	This.of_wiretab ( 2, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// View Assignment History tab page.
	lgo_tabs[1]	= dw_office_assignment_history
	lgo_tabs[2]	= st_office_assignment_history
	This.of_wiretab ( 3, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// Override Corporate BCS tab page.
	lgo_tabs[1]	= dw_override_entry
	lgo_tabs[2]	= dw_override_entry_comment
	lgo_tabs[3]	= dw_override_history
	lgo_tabs[4]	= st_override_heading_1
	lgo_tabs[5]	= st_override_heading_2
	lgo_tabs[6]	= st_override_comment
	lgo_tabs[7]	= st_override_history
	This.of_wiretab ( 4, lgo_tabs )
	lgo_tabs		= lgo_null
		
ELSE
	// User is not allowed to view or update AMCP data.

	// Pass a string array containing a label for each tab page.
	ls_tabs[1]	= 'Select Office'
	ls_tabs[2]	= 'Assign Offices'
	ls_tabs[3]	= 'View Assignment History'
	
	This.of_createtabs ( ls_tabs )
	
	// Call of_wiretab for each tab page identifying each control
	// to be visible when the tab page is selected.
	
	// Select Office tab page.
	lgo_tabs[1]	= dw_office_search_criteria
	lgo_tabs[2]	= dw_office_list
	lgo_tabs[3]	= st_office_search_critieria
	lgo_tabs[4]	= st_office_list
	This.of_wiretab ( 1, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// Assign Account Manager tab page.
	lgo_tabs[1]		= dw_account_manager_search_criteria
	lgo_tabs[2]		= st_account_manager_search_critieria
	lgo_tabs[3]		= st_account_manager_search_criteria_head
	lgo_tabs[4]		= dw_account_manager_list
	lgo_tabs[5]		= st_account_manager_list
	lgo_tabs[6]		= st_account_manager_list_header
	lgo_tabs[7]		= dw_assigned_unsigned_office_list
	lgo_tabs[8]		= st_assigned_unsigned_office_header
	lgo_tabs[9]		= st_assigned_unsigned_office_list
	lgo_tabs[10]	= cb_assign_manager
	lgo_tabs[11]	= cb_end_assignment
	This.of_wiretab ( 2, lgo_tabs )
	lgo_tabs		= lgo_null
	
	// View Assignment History tab page.
	lgo_tabs[1]	= dw_office_assignment_history
	lgo_tabs[2]	= st_office_assignment_history
	This.of_wiretab ( 3, lgo_tabs )
	lgo_tabs		= lgo_null
	
END IF

// Be sure we do not obsure the view.
This.BringToTop = False

// Disable tab pages until an Office is selected.
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

integer li_return
long ll_officeidnum

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

// Be sure we have a selected Office.
ll_officeidnum = dw_selected_office.GetItemNumber ( 1, 'office_officeidnum' )
IF	IsNull ( ll_officeidnum ) THEN
	CHOOSE CASE newindex
		CASE 2,3,4
			MessageBox ( 'Offices', 'Please select an Office.', Information!, OK! )
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

string ls_filterstring
long ll_officeidnum

window lw_parent

// Get a reference to our parent window's menu.
This.of_getparentwindow ( lw_parent )
lm_update_amcp = lw_parent.MenuID

// Get the officeidnum of the Selected Office.
ll_officeidnum = dw_selected_office.GetItemNumber ( 1, 'office_officeidnum' )

// Do the necessary retrievals for the newly selected tab.
// Enable/disable menu items.
CHOOSE CASE newindex
		
	CASE 1
		// Select Office.
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
		// Assign Account Managers.
		dw_account_manager_search_criteria.Event ue_clearcriteria ()
		dw_account_manager_list.Reset ()
		dw_assigned_unsigned_office_list.Reset ()
		dw_account_manager_search_criteria.Event ue_findassignedmanager ()
		
		// We only want Save enabled.
		lm_update_amcp.m_edit.enabled 				= True
		lm_update_amcp.m_edit.m_delete.enabled 	= False
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = False
		lm_update_amcp.m_edit.m_save.enabled 		= True
		
		// Lists can be sorted and filtered.
		lm_update_amcp.m_view.enabled 						= True
		lm_update_amcp.m_view.m_clearcriteria.enabled 	= True
		
	CASE 3
		// Assignment History.		
		dw_office_assignment_history.Retrieve ( ll_officeidnum )
		dw_office_assignment_history.SetFocus ()
		
		// No updates.
		lm_update_amcp.m_edit.enabled = False		
		lm_update_amcp.m_edit.m_delete.enabled 	= False
		lm_update_amcp.m_edit.m_undelete.enabled 	= False
		lm_update_amcp.m_edit.m_insertrow.enabled = False
		lm_update_amcp.m_edit.m_save.enabled 		= False
		
		
		// Lists can be sorted and filtered.
		lm_update_amcp.m_view.enabled 						= True
		lm_update_amcp.m_view.m_clearcriteria.enabled 	= False
		
	CASE 4
		// Override BCS.
		dw_override_entry.Retrieve ( ll_officeidnum )
		dw_override_entry.SetFocus ()
		dw_override_history.Retrieve ( ll_officeidnum )
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
		
END CHOOSE

Return 0
end event

type dw_office_list from u_dw within w_amcp_office
integer x = 37
integer y = 716
integer width = 3579
integer height = 1116
integer taborder = 10
string dataobject = "d_search_office_list"
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

// Sort by column header.
This.of_setsort ( True )
This.inv_sort.of_setcolumnheader ( True )

// PFC Extended Filter dialog.
This.of_setfilter ( True )
This.inv_filter.of_setstyle ( 2 ) // 2= Simple a=b.

// Single row select.
This.of_setrowselect ( True )

This.Tag = ''

end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	If the clicked row is  selected (highlighted), then
//						copy the row to the Selected Office header
//						and enable tabs.
//
//						If the clicked row is NOT selected, then reset the
//						Selected Office header and disable tabs.
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
	dw_selected_office.Reset ()
	This.RowsCopy ( row, row, Primary!, dw_selected_office, 1, Primary! )
	tab_1.Event ue_enabletabpages ()
ELSE	
	dw_selected_office.Reset ()
	dw_selected_office.InsertRow ( 1 )
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

type dw_office_search_criteria from u_dw within w_amcp_office
event type integer ue_search ( )
event type integer ue_clearcriteria ( )
integer x = 37
integer y = 372
integer width = 3579
integer height = 272
integer taborder = 10
string dataobject = "d_search_office_criteria"
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

long ll_return

string ls_clntfranchise_clntid
string ls_office_brand
string ls_office_city
string ls_office_franchisenum
string ls_office_officename
string ls_office_region
string ls_office_state
string ls_office_zip

window lw_frame

dw_office_list.Reset ()
dw_office_list.SetFilter ( '' )
dw_office_list.Filter ()

IF	This.RowCount () < 1 THEN
	Return -1
END IF

ls_clntfranchise_clntid = This.GetItemString ( 1, 'clntfranchise_clntid' )
IF	Upper ( ls_clntfranchise_clntid ) = 'UNSIGNED' THEN
	SetNull ( ls_clntfranchise_clntid )
ELSE
	IF	IsNull ( ls_clntfranchise_clntid ) &
	OR	Len ( Trim ( ls_clntfranchise_clntid ) ) < 1 THEN
		ls_clntfranchise_clntid = '%'
	ELSE
		ls_clntfranchise_clntid = Trim ( ls_clntfranchise_clntid ) + '%'
	END IF
END IF

ls_office_brand = This.GetItemString ( 1, 'office_brand' )
IF	IsNull ( ls_office_brand ) &
OR	Len ( Trim ( ls_office_brand ) ) < 1 THEN
	ls_office_brand = '%'
ELSE
	ls_office_brand = Trim ( ls_office_brand ) + '%'
END IF

ls_office_city = This.GetItemString ( 1, 'office_city' )
IF	IsNull ( ls_office_city ) &
OR	Len ( Trim ( ls_office_city ) ) < 1 THEN
	ls_office_city = '%'
ELSE
	ls_office_city = Trim ( ls_office_city ) + '%'
END IF

ls_office_franchisenum = This.GetItemString ( 1, 'office_franchisenum' )
IF	IsNull ( ls_office_franchisenum ) &
OR	Len ( Trim ( ls_office_franchisenum ) ) < 1 THEN
	ls_office_franchisenum = '%'
ELSE
	ls_office_franchisenum = Trim ( ls_office_franchisenum ) + '%'
END IF

ls_office_officename = This.GetItemString ( 1, 'office_officename' )
IF	IsNull ( ls_office_officename ) &
OR	Len ( Trim ( ls_office_officename ) ) < 1 THEN
	ls_office_officename = '%'
ELSE
	ls_office_officename = Trim ( ls_office_officename ) + '%'
END IF

ls_office_region = This.GetItemString ( 1, 'office_region' )
IF	IsNull ( ls_office_region ) &
OR	Len ( Trim ( ls_office_region ) ) < 1 THEN
	ls_office_region = '%'
ELSE
	ls_office_region = Trim ( ls_office_region ) + '%'
END IF

ls_office_state = This.GetItemString ( 1, 'office_state' )
IF	IsNull ( ls_office_state ) &
OR	Len ( Trim ( ls_office_state ) ) < 1 THEN
	ls_office_state = '%'
ELSE
	ls_office_state = Trim ( ls_office_state ) + '%'
END IF

ls_office_zip = This.GetItemString ( 1, 'office_zip' )
IF	IsNull ( ls_office_zip ) &
OR	Len ( Trim ( ls_office_zip ) ) < 1 THEN
	ls_office_zip = '%'
ELSE
	ls_office_zip = Trim ( ls_office_zip ) + '%'
END IF

// Require more than one criteria.
IF	ls_clntfranchise_clntid = '%' &
	AND ls_office_brand = '%' &
	AND ls_office_city = '%' &
	AND ls_office_franchisenum = '%' &
	AND ls_office_officename = '%' &
	AND ls_office_region = '%' &
	AND ls_office_state = '%' &
	AND ls_office_zip = '%' THEN
	MessageBox ( 'AMCP Office', 'Please enter at least one search criteria.' )
	Return -1
END IF

ll_return =	&
	dw_office_list.Retrieve ( &
		ls_clntfranchise_clntid, &
		ls_office_brand, &
		ls_office_city, &
		ls_office_franchisenum, &
		ls_office_officename, &
		ls_office_region, &
		ls_office_state, &
		ls_office_zip &
		)

CHOOSE CASE ll_return
	CASE is < 0
		lw_frame = gnv_app.of_getframe ()
		lw_frame.SetMicroHelp ( 'No Offices.  Database error has occurred.' )
	CASE 0
		lw_frame = gnv_app.of_getframe ()
		lw_frame.SetMicroHelp ( 'No Offices for your criteria.' )
	CASE ELSE
		Return 1
END CHOOSE	

Return 1
end event

event ue_clearcriteria;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  Clear any entered criteria.
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
		// Trigger the event to retrieve Office list.
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

This.ib_isupdateable = False

This.Event ue_clearcriteria ()

This.Tag = ''
end event

type st_office_list from statictext within w_amcp_office
integer x = 37
integer y = 656
integer width = 3433
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Highlight a single Office on the List to view/update.  The Selected Office Field will prefill and tabs will enable.  Scroll list to the right to view Office Begin/End Dates."
boolean focusrectangle = false
end type

type st_office_search_critieria from statictext within w_amcp_office
integer x = 37
integer y = 316
integer width = 3383
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enter Brand or Franchise Number, etc., for a list of Offices.  Case sensitive. Partial entries supported. No wild card (~'%~') needed."
boolean focusrectangle = false
end type

type cb_assign_manager from commandbutton within w_amcp_office
integer x = 2866
integer y = 652
integer width = 389
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Assign Manager"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Trigger the event to assign an Unassigned UNSIGNED Office 
//						to the selected Account Manager.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

dw_assigned_unsigned_office_list.Event ue_assignoffices ()

end event

type st_account_manager_list from statictext within w_amcp_office
integer x = 55
integer y = 700
integer width = 2775
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "To assign the selected Office, highlight the Account Manager row and click Assign Manager button to save the assignment."
boolean focusrectangle = false
end type

type st_account_manager_list_header from statictext within w_amcp_office
integer x = 55
integer y = 652
integer width = 3387
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Account Manager List"
boolean focusrectangle = false
end type

type st_account_manager_search_criteria_head from statictext within w_amcp_office
integer x = 55
integer y = 316
integer width = 3387
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected Office is Unassigned."
boolean focusrectangle = false
end type

type st_account_manager_search_critieria from statictext within w_amcp_office
integer x = 55
integer y = 364
integer width = 3392
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enter Area or Last Name, etc., for a list of Account Managers.  Case sensitive. Partial entries supported. No wild card (~'%~') needed.  Click Search to retrieve list."
boolean focusrectangle = false
end type

type st_assigned_unsigned_office_header from statictext within w_amcp_office
integer x = 55
integer y = 1232
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
string text = "Assigned UNSIGNED Offices for the highlighted Account Manager"
boolean focusrectangle = false
end type

type st_assigned_unsigned_office_list from statictext within w_amcp_office
integer x = 55
integer y = 1284
integer width = 2615
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "To end an Office assignment, highlight the Office row and click the End Assignment button to save Effective End date."
boolean focusrectangle = false
end type

type dw_office_assignment_history from u_dw within w_amcp_office
string tag = "am_6"
integer x = 37
integer y = 380
integer width = 3575
integer height = 1452
integer taborder = 20
string dataobject = "d_office_assignment_history"
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

This.Tag = 'office_unsigned'

end event

type st_office_assignment_history from statictext within w_amcp_office
integer x = 37
integer y = 316
integer width = 3406
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Account Managers Assigned to the Selected Office (SIGNED and UNSIGNED)."
boolean focusrectangle = false
end type

type cb_end_assignment from commandbutton within w_amcp_office
integer x = 2866
integer y = 1236
integer width = 389
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "End Assignment"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Trigger the event to unassign an Assigned UNSIGNED Office 
//						for the selected Account Manager.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

dw_assigned_unsigned_office_list.Event ue_endassignment ()
end event

type st_override_heading_2 from statictext within w_amcp_office
integer x = 37
integer y = 348
integer width = 3685
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 255
long backcolor = 67108864
string text = "Office BCS Overrides are not reflected in Reports.  Exception: Overrides for Offices WILL appear on Market Share Reports."
boolean focusrectangle = false
end type

type st_override_heading_1 from statictext within w_amcp_office
integer x = 37
integer y = 408
integer width = 1591
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "BCS for Selected Office"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_override_entry from u_dw within w_amcp_office
event type long ue_recalculate_ytd ( )
string tag = "am_4"
integer x = 37
integer y = 472
integer width = 2149
integer height = 768
integer taborder = 10
string dataobject = "d_office_bcs_override"
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
	
	// Be careful of null values.
	IF	IsNull ( ll_bcs ) THEN
		ll_bcs = 0
	END IF
	
	// Restart the accumulation on the first month of a year.
	IF	ll_month = 1 THEN
		ll_bcsytd 				= ll_bcs
	ELSE
		ll_bcsytd 				= ll_bcsytd + ll_bcs
	END IF
	
	// Display the YTD value.  Avoid unnecessary updates.
	IF This.GetItemNumber ( ll_row, 'bcsytd' ) = ll_bcsytd THEN
		// No change required.
	ELSE
		This.SetItem ( ll_row, 'bcsytd', ll_bcsytd )
	END IF
		
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

This.Tag = 'office_override'

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
//	Description:  	Add the officeidnum of the Selected Office.
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
long ll_officeidnum
long ll_row
long ll_rowcount
long ll_rowhistory

string ls_filterstring

ldt_datemdfd = DateTime ( Today(), Now() )

// Be sure we have a selected manager key.
IF	dw_selected_office.RowCount () <> 1 THEN
	MessageBox ( 'Programmer Error BCS Override', &
		+ Parent.Title + ' - dw_account_manager_bcs_override:pfc_validation.  ' &
		+ 'Wrong number of Selected Offices.', StopSign!, OK! )
	Return -1
END IF

// Sort the display so that we can verify that dates have no gaps.
This.SetSort ( 'year D, month D' )
This.Sort ()

ll_officeidnum = dw_selected_office.GetItemNumber  ( 1, 'office_officeidnum' )

ll_rowcount = This.RowCount ()

FOR ll_row = 1 TO ll_rowcount
	
	// Be sure that new rows have a officeidnum.		
	le_itemstatus 			= This.GetItemStatus ( ll_row, 0, Primary! )
		
	CHOOSE CASE le_itemstatus
		CASE NewModified!
			This.SetItem ( ll_row, 'officeidnum', ll_officeidnum )
			
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
				MessageBox ( 'Office Overrides', &
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

// If we are going to do this, then we must recalculate YTD values.
This.Event ue_recalculate_ytd ()

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
			dw_override_history.SetItem ( ll_rowhistory, 'officeidnum', ll_officeidnum )
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
			dw_override_history.SetItem ( ll_rowhistory, 'frombcsytd', &
				This.GetItemNumber ( ll_row, 'bcsytd', Primary!, True ) )
			dw_override_history.SetItem ( ll_rowhistory, 'tobcsytd', &
				This.GetItemNumber ( ll_row, 'bcsytd' ) )
				
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
			MessageBox ( 'BCS Overrides', 'Year must be between 2000 and 2099.  Please correct.', Information!, OK! )
			This.ib_itemchangedmessage = True
			Return 1
		END IF
		
	CASE 'month'
		ll_test = Integer ( data )
		IF	ll_test > 12 &
		OR ll_test < 1 THEN
			MessageBox ( 'BCS Override', 'Month must be between 1 and 12.  Please correct.', Information!, OK! )
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
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

//?? Skip this for now. This.Event Post ue_recalculate_ytd ()

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

type st_override_comment from statictext within w_amcp_office
integer x = 2203
integer y = 408
integer width = 1253
integer height = 60
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

type dw_override_entry_comment from u_dw within w_amcp_office
integer x = 2203
integer y = 472
integer width = 1253
integer height = 768
integer taborder = 10
string dataobject = "d_office_bcs_override_comment"
boolean vscrollbar = false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	We share data and so are not updateable.
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

This.Tag = ''
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

type st_override_history from statictext within w_amcp_office
integer x = 37
integer y = 1292
integer width = 2011
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "BCS Overrides for the selected Year/Month"
boolean focusrectangle = false
end type

type dw_override_history from u_dw within w_amcp_office
event type long ue_retrieveafterupdate ( )
string tag = "am_5"
integer x = 37
integer y = 1356
integer width = 3410
integer height = 460
integer taborder = 20
string dataobject = "d_office_bcs_override_history"
end type

event ue_retrieveafterupdate;//////////////////////////////////////////////////////////////////////////////
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
long ll_officeidnum
long ll_row
long ll_rowcount
long ll_year

ll_officeidnum 	= dw_selected_office.GetItemNumber ( 1, 'office_officeidnum' )

ll_rowcount 	= This.Retrieve ( ll_officeidnum )

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
//	Description:	We update.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

This.ib_isupdateable = True

This.Tag = 'office_override_history'
end event

type dw_account_manager_list from u_dw within w_amcp_office
integer x = 55
integer y = 764
integer width = 3557
integer height = 452
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_search_accountmanager"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Set up standard list functionality using pfc services.
//						Do our own row selection so we can enabled buttons.
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

This.tag = ''

end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	If the clicked row is  selected (highlighted), then
//						retrieve the list of Assigned UNSIGNED Offices for
//						the selected Account Manager.
//
//						If the clicked row is NOT selected, then reset the
//						selected Account Manager list.
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

long ll_persidnum

// Do our own row selection.
IF	This.IsSelected ( row ) THEN
	This.SelectRow ( row, False )
ELSE
	This.SelectRow ( 0, False )
	This.SelectRow ( row, True )
END IF

IF	This.IsSelected ( row ) THEN
	
	// Retrieve current assignments for the selected Account Manager.
	ll_persidnum = This.GetItemNumber ( row, 'am_id' )
	dw_assigned_unsigned_office_list.Retrieve ( ll_persidnum )
	
	// Do not select the first row.
	dw_assigned_unsigned_office_list.SelectRow ( 0, False )
	
	// Do not allow users to Assign a SIGNED Office.
	IF	st_account_manager_search_criteria_head.Tag	= 'SIGNED' THEN
	ELSE
		cb_assign_manager.enabled = True
	END IF

ELSE	
	dw_assigned_unsigned_office_list.Reset ()
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
cb_assign_manager.Enabled 	= False
end event

type dw_account_manager_search_criteria from u_dw within w_amcp_office
event type integer ue_search ( )
event type integer ue_clearcriteria ( )
event type integer ue_findassignedmanager ( )
integer x = 55
integer y = 428
integer width = 3557
integer height = 204
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_search_accountmanager_criteria"
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

long ll_am_persidnum
long ll_return

string ls_am_lastname
string ls_rm_lastname
string ls_areadesc

window lw_frame

IF	This.RowCount () < 1 THEN
	Return -1
END IF

cb_end_assignment.Enabled	= False

ll_am_persidnum = This.GetItemNumber ( 1, 'am_persidnum' )
IF	IsNull ( ll_am_persidnum ) THEN
	// Use other criteria. See below.
	dw_account_manager_list.dataobject = 'd_search_accountmanager'
	dw_account_manager_list.of_settransobject ( SQLCA )
ELSE
	// Use only the entered Account Manager ID.
	dw_account_manager_list.dataobject = 'd_search_accountmanager_persidnum'
	dw_account_manager_list.of_settransobject ( SQLCA )
	ll_return =	dw_account_manager_list.Retrieve ( ll_am_persidnum )
	CHOOSE CASE ll_return
		CASE is < 0
			//?? Database error.
			Return -1
		CASE 0
			lw_frame = gnv_app.of_getframe ()
			lw_frame.SetMicroHelp ( 'No Account Manager with Account Manager ID = ' &
				+ String ( ll_am_persidnum) + '.' )
			Return 0
		CASE ELSE			
			cb_end_assignment.Enabled	= True
			Return ll_return
	END CHOOSE
END IF

ls_am_lastname = This.GetItemString ( 1, 'am_perslastname' )
IF	IsNull ( ls_am_lastname ) &
OR	Len ( Trim ( ls_am_lastname ) ) < 1 THEN
	ls_am_lastname = '%'
ELSE
	ls_am_lastname = Trim ( ls_am_lastname ) + '%'
END IF

ls_rm_lastname = This.GetItemString ( 1, 'rm_perslastname' )
IF	IsNull ( ls_rm_lastname ) &
OR	Len ( Trim ( ls_rm_lastname ) ) < 1 THEN
	ls_rm_lastname = '%'
ELSE
	ls_rm_lastname = Trim ( ls_rm_lastname ) + '%'
END IF

ls_areadesc = This.GetItemString ( 1, 'area_areadesc' )
IF	IsNull ( ls_areadesc ) &
OR	Len ( Trim ( ls_areadesc ) ) < 1 THEN
	ls_areadesc = '%'
ELSE
	ls_areadesc = Trim ( ls_areadesc ) + '%'
END IF

ll_return =	dw_account_manager_list.Retrieve ( ls_am_lastname, ls_areadesc, ls_rm_lastname )

CHOOSE CASE ll_return
	CASE is < 0
		//?? Database error.
		Return -1
	CASE 0
		lw_frame = gnv_app.of_getframe ()
		lw_frame.SetMicroHelp ( 'No Account Managers for your criteria.' )
		Return 0
	CASE ELSE
		cb_end_assignment.Enabled	= True
END CHOOSE
	
Return ll_return
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

event ue_findassignedmanager;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	Display the Assigned Manager Name for the Selected Office.
//
//						If the Selected Office is currently SIGNED, then no action
//						is required.  We don't assign SIGNED Offices.
//
//						If the UNSIGNED Selected Office is Assigned, then
//						retrieve the Account Manager's Name and ID.
//						Display the information on the text header.
//						Prefill the search criteria with the Last Name and ID.
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

date ld_temp

datetime ldt_officeacctmanager_begineffdate
datetime ldt_officeacctmanager_endeffdate
datetime ldt_startcurrentmonth

long ll_acctmanager_id
long ll_office_officeidnum[]
long ll_row
long ll_rowcount

string ls_clntfranchise_clntid
string ls_findstring
string ls_franchisenum
string ls_person_acctmgrfullname
string ls_person_acctmgrlastname	


// Set a default value.  Set the Tag so we don't have to go thru this logic again.
st_account_manager_search_criteria_head.Tag	= ''
st_account_manager_search_criteria_head.Text = 'Selected Office is Unassigned.'
cb_assign_manager.Enabled 	= True
cb_end_assignment.Enabled	= True

// Is the Office SIGNED?
ld_temp = &
	Date ( String ( Month ( Today () ) ) + '/1/' + String ( Year ( Today () ) ) )
ldt_startcurrentmonth = DateTime ( ld_temp, Time ( '00:00:00' ) )
ls_franchisenum = &
	dw_selected_office.GetItemString ( 1, 'office_franchisenum' )
gnv_app.ids_work.dataobject = 'd_office_signed_hidden'
gnv_app.ids_work.of_SetTransObject ( SQLCA )
ll_rowcount = gnv_app.ids_work.Retrieve ( ls_franchisenum, ldt_startcurrentmonth )
IF	ll_rowcount < 1 THEN
	// The Selected Office is UNSIGNED.  We can continue.
ELSE
	// A Client ID exists.  We won't modify this assignment here.
	ls_clntfranchise_clntid = gnv_app.ids_work.GetItemString ( 1, 'clntfranchise_clntid' ) 
	st_account_manager_search_criteria_head.Text = 'Selected Office is SIGNED.' &
		  + '  Use the Update by Client ID window to change SIGNED dates for Client ID ' &
		  + ls_clntfranchise_clntid + '.'
	st_account_manager_search_criteria_head.Tag	= 'SIGNED'
	cb_assign_manager.Enabled 	= False
	cb_end_assignment.Enabled	= True
	Return 1
END IF

// Is the UNSIGNED Office Assigned?
// Get the Account Manager Last Name and ID.
ll_office_officeidnum[1] = dw_selected_office.GetItemNumber ( 1, 'office_officeidnum' )
ll_rowcount = ids_officeacctmanager.Retrieve ( ll_office_officeidnum )
CHOOSE CASE ll_rowcount
	CASE is < 0
		//?? DB Error.
		Return -1
	CASE 0
		// The Selected Office is Unassigned.  We can continue.
		st_account_manager_search_criteria_head.Text = &
			'Selected Office is Unassigned.'
		cb_assign_manager.Enabled 	= False
		cb_end_assignment.Enabled	= False
		Return 1
	CASE ELSE
		// There is at least one row in assignment history.
		ids_officeacctmanager.SetSort ( 'endeffdate D' )
		ids_officeacctmanager.Sort ()
		
		ldt_officeacctmanager_begineffdate = &
			ids_officeacctmanager.GetItemDateTime ( 1, 'begineffdate' )
		ldt_officeacctmanager_endeffdate = &
			ids_officeacctmanager.GetItemDateTime ( 1, 'endeffdate' )
		
		IF	Date ( ldt_officeacctmanager_begineffdate ) <= Today () &
		AND Date ( ldt_officeacctmanager_endeffdate  ) >= Today () THEN
			// The Selected Office is Assigned.  We need to do more work.
		ELSE
			// The Selected Office is Unassigned.  We can continue.
			st_account_manager_search_criteria_head.Text = &
				'Selected Office is Unassigned.'
			cb_assign_manager.Enabled 	= False
			cb_end_assignment.Enabled	= False
			Return 1
		END IF
END CHOOSE

// The user has selected an Assigned UNSIGNED Office.
cb_assign_manager.Enabled 	= False
cb_end_assignment.Enabled	= True

// Since the display is sorted most recent assignment first, we should be able
// to use the first row.  
ll_acctmanager_id = &
	ids_officeacctmanager.GetItemNumber ( 1, 'persidnum' )
ls_person_acctmgrfullname = &	
	ids_officeacctmanager.GetItemString ( 1, 'person_persfullname' )
ls_person_acctmgrlastname = &	
	ids_officeacctmanager.GetItemString ( 1, 'person_perslastname' )

// Tell the user and force retrieval of the Account Manager's stuff.
st_account_manager_search_criteria_head.Text = &
	ls_person_acctmgrfullname &
	+ ' is assigned to the Selected Office.' &
  + '  Please click End Assignment before reassigning the Selected Office.'

This.SetItem ( 1, 'am_perslastname', ls_person_acctmgrlastname )
This.SetItem ( 1, 'am_persidnum', ll_acctmanager_id )

IF	This.Event ue_search () = 1 THEN	
	dw_account_manager_list.SelectRow ( 0, False )
	dw_account_manager_list.SelectRow ( 1, True )
	dw_assigned_unsigned_office_list.Retrieve ( ll_acctmanager_id )
	cb_assign_manager.Enabled 	= True	
	// Do not select the first row.
	ls_findstring = "office_franchisenum='" + ls_franchisenum + "'"
	ll_row = &
		dw_assigned_unsigned_office_list.Find ( ls_findstring, 1, &
		dw_assigned_unsigned_office_list.RowCount () )
	IF	ll_row > 0 THEN
		dw_assigned_unsigned_office_list.ScrollToRow ( ll_row )
	END IF
	dw_assigned_unsigned_office_list.SelectRow ( 0, False )
ELSE	
	dw_account_manager_list.SelectRow ( 0, False )
	dw_assigned_unsigned_office_list.Reset ()
END IF

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
		// Trigger the event to retrieve Account Manager list.
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

This.ib_isupdateable = False

This.Event ue_clearcriteria ()

This.tag = ''
end event

type dw_assigned_unsigned_office_list from u_dw within w_amcp_office
event type long ue_assignoffices ( )
event ue_mousemove pbm_mousemove
event type integer ue_endassignment ( )
string tag = "am_2"
integer x = 55
integer y = 1356
integer width = 3547
integer height = 480
integer taborder = 10
string dragicon = "APPTL.ICO"
boolean bringtotop = true
string dataobject = "d_offices_assigned_unsigned"
boolean hsplitscroll = true
end type

event ue_assignoffices;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Assign an Unassigned UNSIGNED Office to the
//						selected Account Manager.
//
//						Verify that the selected Office is UNSIGNED.
//						If it is SIGNED, then warn the user the Office
//						must first be UNSIGNED.
//
// 					Verify that the Selected Office is Unassigned.
//						If it is Assigned, then warn the user that the
//						Office must first be Unassigned from its current
//						Account Manager.
//
//						If everything is OK, fill in the OfficeAcctManager
//						information.
//
//						The OfficeAcctManager Begin and End dates will
//						default.  Users may want to modify them later.
//
//	Arguments:  none
//
//	Returns:  long
//	 >0 	= Count of assigned rows.
//	 0 	= No action
//	-1 	= Error
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

datetime ldt_assignbegineffdate
datetime ldt_assignendeffdate
datetime ldt_begineffdate
datetime ldt_endeffdate

long ll_officeidnum[]
long ll_persidnum
long ll_row
long ll_rowcount
long ll_rowcountmgr
long ll_rowfound

string ls_endeffdate
string ls_filterstring
string ls_findstring
string ls_franchisenum[]

// Be sure we have a Selected Office's officeidnum.
IF	dw_selected_office.RowCount () <> 1 THEN
	MessageBox ( 'Assign Offices', 'Programmer Error: ' &
		+ This.Title + ' dw_assign_unsigned_office_list::ue_assignoffices.' &
		+ ' Cannot find Selected Office officeidnum.' )
	Return -1
END IF

// Get the Account Manager the user selected.
ll_row = dw_account_manager_list.GetSelectedRow ( 0 )
IF	ll_row < 1 THEN
	MessageBox ( 'Assign Offices', &
		'Please select an Account Manager to assign to the Selected Office.' &
		+ ' Highlight a row on the Account Manager List.' )
	Return -1

END IF

ll_persidnum = dw_account_manager_list.GetItemNumber ( ll_row, 'am_id' )

ll_officeidnum[1] 	= dw_selected_office.GetItemNumber ( 1, 'office_officeidnum' )
ls_franchisenum[1]	= dw_selected_office.GetItemString ( 1, 'office_franchisenum' )

// Default the assignment dates.
ldt_begineffdate 	= DateTime ( Today(), Time ( '00:00:00' ) )
ls_endeffdate		= '12/31/2099'
ldt_endeffdate		= DateTime ( Date ( ls_endeffdate ), Time ( '00:00:00' ) )
	
ids_clientfranchise.Reset ()
ll_rowcount = ids_clientfranchise.Retrieve ( ls_franchisenum )

ids_officeacctmanager.Reset ()
ll_rowcountmgr = ids_officeacctmanager.Retrieve ( ll_officeidnum )

// Check for any other saved OfficeAcctManager rows.
// Find any OfficeAcctManager row for this OfficeIDNum where the 
// default BeginEffDate falls between an OfficeAcctManager
// BeginEffDate and EndEffDate.
ls_findstring = &
	'officeidnum=' + String ( ll_officeidnum[1] ) &
	+ ' and Date ( endeffdate ) > ' &
	+ ' Date ( "' &
	+ String ( Date ( ldt_begineffdate ), 'mm/dd/yyyy' ) &
	+ ' ")' &
	+ ' and Date ( begineffdate ) <= ' &
	+ ' Date ( "' &
	+ String ( Date ( ldt_begineffdate ), 'mm/dd/yyyy' ) &
	+ ' ")' 
ll_rowfound = ids_officeacctmanager.Find ( ls_findstring, 1, ll_rowcount )
IF	ll_rowfound > 0 THEN
	ldt_assignbegineffdate = ids_officeacctmanager.GetItemDateTime ( ll_rowfound, 'endeffdate' )
ELSE
	ldt_assignbegineffdate = ldt_begineffdate
END IF

// Check for Offices about to be Assigned.
// Find any OfficeAcctManager row for this OfficeIDNum where the 
// default EndEffDate falls between an OfficeAcctManager
// BeginEffDate and EndEffDate.
// Note: We are using a string for the end effective date.  Otherwise PB's string
// function turns 2099 into 1999.  (This can be fixed by setting the WinNT Short date
// to the four digit year format.)
ls_findstring = &
	'officeidnum=' + String ( ll_officeidnum[1] ) &
	+ ' and Date ( endeffdate ) >= ' &
	+ ' Date ( "' &
	+ ls_endeffdate &
	+ ' ")' &
	+ ' and Date ( begineffdate ) < ' &
	+ ' Date ( "' &
	+ ls_endeffdate &
	+ ' ")'
ll_rowfound = ids_officeacctmanager.Find ( ls_findstring, 1, ll_rowcount )
IF	ll_rowfound > 0 THEN
	ldt_assignendeffdate = ids_officeacctmanager.GetItemDateTime ( ll_rowfound, 'begineffdate' )
ELSE		
	ldt_assignendeffdate = ldt_endeffdate
END IF

// Check for recently UNSIGNED Offices.
// Find any ClntFranchise row for this FranchiseNum where the 
// default BeginEffDate falls between a ClntFranchise
// BeginEffDate and EndEffDate.
ls_findstring = &
	'clntfranchisenum="' + ls_franchisenum[1] &
	+ '" and Date ( endeffdate ) > ' &
	+ ' Date ( "' &
	+ String ( Date ( ldt_begineffdate ), 'mm/dd/yyyy' ) &
	+ ' ")' &
	+ ' and Date ( begineffdate ) <= ' &
	+ ' Date ( "' &
	+ String ( Date ( ldt_begineffdate ), 'mm/dd/yyyy' ) &
	+ ' ")' 
ll_rowfound = ids_clientfranchise.Find ( ls_findstring, 1, ll_rowcount )
IF	ll_rowfound > 0 THEN
	ldt_assignbegineffdate = ids_clientfranchise.GetItemDateTime ( ll_rowfound, 'endeffdate' )
ELSE
	ldt_assignbegineffdate = ldt_begineffdate
END IF

// Check for Offices about to be SIGNED.
// Find any ClntFranchise row for this FranchiseNum where the 
// default EndEffDate falls between a ClntFranchise
// BeginEffDate and EndEffDate.
// Note: We are using a string for the end effective date.  Otherwise PB's string
// function turns 2099 into 1999.
ls_findstring = &
	'clntfranchisenum="' + ls_franchisenum[1] &
	+ '" and Date ( endeffdate ) >= ' &
	+ ' Date ( "' &
	+ ls_endeffdate &
	+ ' ")' &
	+ ' and Date ( begineffdate ) < ' &
	+ ' Date ( "' &
	+ ls_endeffdate &
	+ ' ")'
ll_rowfound = ids_clientfranchise.Find ( ls_findstring, 1, ll_rowcount )
IF	ll_rowfound > 0 THEN
	ldt_assignendeffdate = ids_clientfranchise.GetItemDateTime ( ll_rowfound, 'begineffdate' )
ELSE		
	ldt_assignendeffdate = ldt_endeffdate
END IF
	
// Finally, move the rows.
This.SetRedraw ( False )
ls_filterstring = This.object.datawindow.table.filter
This.SetFilter ( '' )
This.Filter ()
	
// Check to see if we already have a row with that date.  If so,
// just reset the End Effective Date.
ls_findstring = "string ( date ( officeacctmanager_begineffdate ), 'mm/dd/yyyy'  ) = '" &
	+ String ( Date ( ldt_begineffdate ), 'mm/dd/yyyy' ) + "'" &
	+ " and officeacctmanager_officeidnum=" &
	+ String ( ll_officeidnum[1] )
ll_row = This.Find ( ls_findstring, 1, This.RowCount () )
IF	ll_row > 0 THEN		
	This.SetItem ( ll_row, 'officeacctmanager_endeffdate', ldt_endeffdate )
	
ELSE
	// We need a "New" row.
	ll_row = This.InsertRow ( 1 )
	
	// Populate the OfficeAcctManager fields.	This makes the row "NewModified".
	This.SetItem ( ll_row, 'officeacctmanager_persidnum', ll_persidnum )
	This.SetItem ( ll_row, 'officeacctmanager_begineffdate', ldt_begineffdate )
	This.SetItem ( ll_row, 'officeacctmanager_endeffdate', ldt_endeffdate )
	This.SetItem ( ll_row, 'officeacctmanager_officeidnum', ll_officeidnum[1] )

	// For display only, populate the visible office fields.
	This.SetItem ( ll_row, 'office_brand', &
		dw_selected_office.GetItemString ( 1, 'office_brand' ) )
	This.SetItem ( ll_row, 'office_state', &
		dw_selected_office.GetItemString ( 1, 'office_state' ) )
	This.SetItem ( ll_row, 'office_region', &
		dw_selected_office.GetItemString ( 1, 'office_region' ) )
	This.SetItem ( ll_row, 'office_city', &
		dw_selected_office.GetItemString ( 1, 'office_city' ) )
	This.SetItem ( ll_row, 'office_officename', &
		dw_selected_office.GetItemString ( 1, 'office_officename' ) )
	This.SetItem ( ll_row, 'office_franchisenum', &
		dw_selected_office.GetItemString ( 1, 'office_franchisenum' ) )
	
END IF

// Tidy up.
This.SetFilter ( ls_filterstring )
This.Filter ()

This.Sort ()

This.SetRedraw ( True )

// Save.
Parent.Event pfe_save ()

Return 0
end event

event ue_endassignment;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Unassign an Assigned UNSIGNED Office.
//
//						Fill in the EndEffDate OfficeAcctManager field, and save.
//
//
//	Arguments:  none
//
//	Returns:  long
//	 >0 	= Count of unassigned rows.
//	 0 	= No action
//	-1 	= Error
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

datetime	ldt_begineffdate
datetime ldt_endeffdate

dwitemstatus le_itemstatus

long ll_row
long ll_officeidnum
long ll_officeidnum_selected
long ll_selectedrow

ll_officeidnum_selected = dw_selected_office.GetItemNumber ( 1, 'office_officeidnum' )

// Be sure there is at least one row selected.
ll_selectedrow = This.GetSelectedRow ( 0 )
IF	ll_selectedrow <= 0 THEN
	MessageBox ( 'Assign Offices', 'To End Assignment, an Assigned Office row must be selected.',&
	Information!, OK! )
	Return -1
END IF

// Default the End Effective Date to last night.
ldt_endeffdate		= DateTime ( Today(), Time ( '00:00:00' ) )

// Update the selected rows.
DO WHILE ll_selectedrow > 0
		
	// Populate the OfficeAcctManager End Effective Date.
	// Avoid errors because the row might be "New".
	This.SetItemStatus 	( ll_selectedrow, 0, Primary!, DataModified! )
	le_itemstatus 		= This.GetItemStatus ( ll_selectedrow, 0, Primary! )
	This.SetItemStatus 	( ll_selectedrow, 0, Primary!, NotModified! )
	le_itemstatus 		= This.GetItemStatus ( ll_selectedrow, 0, Primary! )
	
	// If the user is correcting an assignment made today, we want to be sure that
	// the End Effective Date is the same as the Begin Effective Date.
	// Otherwise, the End Effective Date is yesterday.
	ldt_begineffdate =  This.GetItemDateTime ( ll_selectedrow, 'officeacctmanager_begineffdate' )
	IF	Date ( ldt_begineffdate ) = Today () THEN
		This.SetItem ( ll_selectedrow, 'officeacctmanager_endeffdate', ldt_begineffdate )
	ELSE
		This.SetItem ( ll_selectedrow, 'officeacctmanager_endeffdate', ldt_endeffdate )
	END IF
	
	// Update the Selected Office header to 'Unassigned'.
	// Allow the user to Assign the Selected Office.
	ll_officeidnum 	= This.GetItemNumber ( ll_selectedrow, 'office_officeidnum' )
	IF	ll_officeidnum = ll_officeidnum_selected THEN
		dw_selected_office.SetItem ( 1, 'officeacctmanager_endeffdate', ldt_endeffdate )		
		cb_assign_manager.Enabled 	= True
	END IF		
	
	// Get the next selected row.
	ll_selectedrow = dw_assigned_unsigned_office_list.GetSelectedRow ( ll_selectedrow )
	
LOOP

// Save.
Parent.Event pfe_save ()

// Tidy up.
dw_assigned_unsigned_office_list.SelectRow ( 0, False )
dw_office_list.Reset ()

This.Filter ()

This.Sort ()

Return 1
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Set up the standard list stuff.
//						We are going to drag/drop so multirow selection.
//						We will update the OfficeAcctManager table.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

date ld_currentmonthstart
string ls_filterstring

This.ib_isupdateable = True

This.SetSort ( 'office_franchisenum A officeacctmanager_endeffdate D' )

This.of_SetSort ( True )
This.inv_sort.of_setcolumnheader ( True )

// Allow multirow selection for 'unassigning' offices.
This.of_setrowselect ( True )
This.inv_rowselect.of_setstyle ( 2 )

// Set the filter so we only display rows that have dates in the current month.
// We need the filter buffer to check conflicting dates.
// We are setting the filter here because this datawindow object is used in many places.
ld_currentmonthstart = &
	Date ( String ( Month ( Today () ) ) + '/1/' + String ( Year ( Today () ) ) )
	
ls_filterstring = 'Date ( OfficeAcctManager_EndEffDate ) >= ' &
  + " Date ( '" + String ( ld_currentmonthstart, 'mm/dd/yyyy' ) + "' )" 
This.SetFilter ( ls_filterstring )
This.Filter ()

This.of_SetDropDownCalendar ( True )
This.iuo_calendar.of_Register ( 'officeacctmanager_begineffdate', &
  	This.iuo_calendar.DDLB_WITHARROW )
This.iuo_calendar.of_Register ( 'officeacctmanager_endeffdate', &
	This.iuo_calendar.DDLB_WITHARROW )

This.Tag = ''


end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	Users can only modify dates in the current month.
//						However, if they set the unprotected date to a prior
//						month, they will be unable to fix it without clicking
//						save.  So we will reset the cc_saved flag to zero
//						when they change a date.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

CHOOSE CASE dwo.name
	CASE 'officeacctmanager_begineffdate', 'officeacctmanager_endeffdate'
		This.SetItem ( row, 'cc_saved', 0 )
END CHOOSE

Return 0
end event

event pfc_validation;call super::pfc_validation;//////////////////////////////////////////////////////////////////////////////
//
//	Description:  	If the USER has MODIFIED a OfficeAcctManager.BeginEffDate
//						or EndEffDate, we need to be sure that the user hasn't
//						stepped on dates when the Office was SIGNED to a Client.
//						I.e. there is no overlap with ClientFranchise.BeginEffDate
//						and EndEffDate for this Office.
//
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

date ld_begineffdate
date ld_officeacctmanager_begineffdate[]
date ld_original_begineffdate[]
date ld_endeffdate
date ld_officeacctmanager_endeffdate[]
date ld_original_endeffdate[]

datetime ldt_temp
datetime ldt_tempbegin
datetime ldt_tempend

dwitemstatus le_dwitemstatus
dwitemstatus le_dwitemstatus_row

long	ll_idx
long	ll_max
long 	ll_modifiedrow[]
long	ll_officeidnum[]
long 	ll_row
long 	ll_rowcount

string ls_findstring
string ls_franchisenum[]

// Reset the datastore.
ids_clientfranchise.Reset ()

ll_rowcount = This.RowCount ()

FOR ll_row = 1 TO ll_rowcount
	
	// We only want to check dates on changed rows.  NewModified rows are
	// saved using default dates.
	le_dwitemstatus_row = This.GetItemStatus ( ll_row, 0, Primary! )
	CHOOSE CASE le_dwitemstatus_row
		CASE DataModified!
		CASE ELSE
			Continue
	END CHOOSE
	// Something has changed.
	ld_begineffdate 	= Date ( This.GetItemDateTime ( ll_row, 'officeacctmanager_begineffdate' ) )
	ld_endeffdate		= Date ( This.GetItemDateTime ( ll_row, 'officeacctmanager_endeffdate' ) )
	
	// Rule: Both Start and End dates are required.
	IF	IsNull ( ld_begineffdate ) &
	OR IsNull ( ld_endeffdate ) THEN
		MessageBox ( 'Assigned Offices', &
			'Both Start and End Effective dates are required.  Please correct.',&
			Information!, OK! )
		This.SetFocus ()	
		SetRow ( ll_row )
		ScrollToRow ( ll_row )
		SetColumn ( 'officeacctmanager_begineffdate' )
		Return -1
	END IF
	
	// Rule: Both Start date cannot be later than End date.
	IF	ld_begineffdate > ld_endeffdate THEN
		MessageBox ( 'Assigned Offices', &
			'Assignment Start date cannot be later than Assignment End date.  Please correct.',&
			Information!, OK! )
		SetRow ( ll_row )
		ScrollToRow ( ll_row )
		SetColumn ( 'officeacctmanager_begineffdate' )
		Return -1
	END IF	
	
	// Rule: Both Start and End date cannot be earlier than the current Year/Month.
	//			We check modified to be sure we are not editing a date entered in a prior month.
	le_dwitemstatus =	This.GetItemStatus ( ll_row, 'officeacctmanager_begineffdate', Primary! )	
	IF	( Year ( ld_begineffdate ) * 100 ) + Month ( ld_begineffdate ) &
		< ( Year ( Today () ) * 100 ) + Month ( Today () ) &
	AND le_dwitemstatus = DataModified! THEN
		IF	ld_begineffdate = &
				Date ( This.GetItemDateTime ( ll_row, &
				'officeacctmanager_begineffdate', Primary!, True ) ) THEN
		ELSE		
			MessageBox ( 'Assigned Offices', &
				'Assignment Start date cannot be earlier than the current Year/Month.  Please correct.',&
				Information!, OK! )
			This.SetItem ( ll_row, 'cc_saved', 0 )	
			SetRow ( ll_row )
			ScrollToRow ( ll_row )
			SetColumn ( 'officeacctmanager_begineffdate' )
			Return -1
		END IF
	END IF
	le_dwitemstatus =	This.GetItemStatus ( ll_row, 'officeacctmanager_endeffdate', Primary! )	
	IF	( Year ( ld_endeffdate ) * 100 ) + Month ( ld_endeffdate ) &
		< ( Year ( Today () ) * 100 ) + Month ( Today () ) &
	AND le_dwitemstatus = DataModified! THEN
		MessageBox ( 'Assigned Offices', &
			'Assignment End date cannot be earlier than the current Year/Month.  Please correct.',&
			Information!, OK! )
		This.SetItem ( ll_row, 'cc_saved', 0 )	
		SetRow ( ll_row )
		ScrollToRow ( ll_row )
		SetColumn ( 'officeacctmanager_endeffdate' )
		Return -1
	END IF
	
	// Dates are valid.  Add this Office to the array of ClientFranchise and 
	// OfficeAcctManager assignment dates to be verified/modified.
	ll_max = ll_max + 1
	ll_modifiedrow[ll_max] 							= ll_row
	ld_officeacctmanager_begineffdate[ll_max] = ld_begineffdate
	ld_officeacctmanager_endeffdate[ll_max] 	= ld_endeffdate
	ls_franchisenum[ll_max] 			= This.GetItemString ( ll_row, 'office_franchisenum' )
	ll_officeidnum[ll_max]				= This.GetItemNumber ( ll_row, 'office_officeidnum' )
	ld_original_begineffdate[ll_max] = &
		Date ( This.GetItemDateTime ( ll_row, 'officeacctmanager_begineffdate', Primary!, True ) )
	ld_original_endeffdate[ll_max] = &
		Date ( This.GetItemDateTime ( ll_row, 'officeacctmanager_endeffdate', Primary!, True ) )
	
NEXT

// If we got here because a row was added, we do NOT want to reset the
// Office List.  We only want to go forward if the user actually modified
// a date on a previously saved row.
IF	ll_max < 1 THEN
	Return 1
END IF

// OK. Check for conflicting Assigned UNSIGNED Office dates.
// Retrieve the OfficeAcctManager table in the invisible datawindow control.
ll_rowcount = ids_officeacctmanager.Retrieve ( ll_officeidnum )

// Remember that the Offices we are looking for may NOT have been assigned to an
// Account Manager.
IF	ll_rowcount > 0 THEN
	FOR ll_idx = 1 TO ll_max
		// Find any OfficeAcctManager row for this FranchiseNum where the 
		// EndEffDate on the modified row is within an OfficeAcctManager
		// BeginEffDate/EndEffDate AND IS NOT THE ROW WE ARE VALIDATING.
		ls_findstring = &
			'officeidnum=' + String ( ll_officeidnum[ll_idx] ) &
			+ ' and Date ( begineffdate ) < ' &
			+ ' Date ( "' &
			+ String ( ld_officeacctmanager_endeffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")' &
			+ ' and Date ( endeffdate ) >= ' &
			+ ' Date ( "' &
			+ String ( ld_officeacctmanager_endeffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")' &			
			+ ' and ' &
			+ ' Date ( endeffdate ) <> ' &
			+ ' Date ( "' &
			+ String ( ld_original_endeffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")' &
			+ ' and Date ( begineffdate ) <> ' &
			+ ' Date ( "' &
			+ String ( ld_original_begineffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")'
			
		ll_row = ids_officeacctmanager.Find ( ls_findstring, 1, ll_rowcount )
		IF	ll_row > 0 THEN
			// We have a row with an inappropriate end date.  We need to display a message.
			ldt_tempbegin 	= ids_officeacctmanager.GetItemDateTime ( ll_row, 'begineffdate' )
			ldt_tempend 	= ids_officeacctmanager.GetItemDateTime ( ll_row, 'endeffdate' )
			MessageBox ( 'Assigned Offices', 'Franchise Number ' + ls_franchisenum[ll_idx] &
				+ ' Assignment End date cannot be within the date range ' &
				+ String ( ldt_tempbegin, 'mm/dd/yyyy' ) &
				+ ' thru ' &
				+ String ( ldt_tempend, 'mm/dd/yyyy' ) &
				+ '. This Office has another Account Manager Assignment.  Please correct.', &
				Information!, OK! )
			This.ScrollToRow ( ll_modifiedrow[ll_idx] )
			This.SetRow ( ll_modifiedrow[ll_idx] )
			This.SetColumn ( 'officeacctmanager_endeffdate' )
			This.SetFocus ()
			Return -1
		END IF	
		
		// Find any OfficeAcctManager row for this FranchiseNum where the 
		// BeginEffDate that the user entered is earlier than an OfficeAcctManager
		// EndEffDate AND IS NOT THE ROW WE ARE VALIDATING.
		ls_findstring = &
			'officeidnum=' + String ( ll_officeidnum[ll_idx] ) &
			+ ' and Date ( endeffdate ) > ' &
			+ ' Date ( "' &
			+ String ( ld_officeacctmanager_begineffdate[ll_idx] ) &
			+ ' ")' &			
			+ ' and Date ( begineffdate ) <= ' &
			+ ' Date ( "' &
			+ String ( ld_officeacctmanager_begineffdate[ll_idx] ) &
			+ ' ")' &
			+ ' and ( ' &
			+ ' Date ( endeffdate ) <> ' &
			+ ' Date ( "' &
			+ String ( ld_original_endeffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ")' &
			+ ' and Date ( begineffdate ) <> ' &
			+ ' Date ( "' &
			+ String ( ld_original_begineffdate[ll_idx], 'mm/dd/yyyy' ) &
			+ ' ") )'
		ll_row = ids_officeacctmanager.Find ( ls_findstring, 1, ll_rowcount )
		IF	ll_row > 0 THEN
			// We have a row with an inappropriate begin date.  We need to display a message.
			ldt_tempbegin 	= ids_officeacctmanager.GetItemDateTime ( ll_row, 'begineffdate' )
			ldt_tempend 	= ids_officeacctmanager.GetItemDateTime ( ll_row, 'endeffdate' )
			MessageBox ( 'Assigned Offices', 'Franchise Number ' + ls_franchisenum[ll_idx] &
				+ ' Assignment Begin date cannot be within the date range ' &
				+ String ( ldt_tempbegin, 'mm/dd/yyyy' ) &
				+ ' thru ' &
				+ String ( ldt_tempend, 'mm/dd/yyyy' ) &
				+ '. This Office has another Account Manager Assignment.  Please correct.',&
				Information!, OK! )
			This.ScrollToRow ( ll_modifiedrow[ll_idx] )
			This.SetRow ( ll_modifiedrow[ll_idx] )
			This.SetColumn ( 'officeacctmanager_begineffdate' )
			This.SetFocus ()
			Return -1
		END IF	
	NEXT
END IF

// OK. Check for conflicting SIGNED Office dates.
// Retrieve the ClntFranchise table in the invisible datawindow control.
ll_rowcount = ids_clientfranchise.Retrieve ( ls_franchisenum )

// Remember that the Offices we are looking for may NOT have been SIGNED to any
// Client.
IF	ll_rowcount > 0 THEN
ELSE
	Return 1
END IF

FOR ll_idx = 1 TO ll_max
	// Find any ClntFranchise row for this FranchiseNum where the 
	// BeginEffDate that the user entered falls between a ClntFranchise
	// BeginEffDate and EndEffDate.
	ls_findstring = &
		'clntfranchisenum="' + ls_franchisenum[ll_idx] &
		+ '" and Date ( endeffdate ) > ' &
		+ ' Date ( "' &
		+ String ( ld_officeacctmanager_begineffdate[ll_idx], 'mm/dd/yyyy' ) &
		+ ' ")' &
		+ ' and Date ( begineffdate ) <= ' &
		+ ' Date ( "' &
		+ String ( ld_officeacctmanager_begineffdate[ll_idx], 'mm/dd/yyyy' ) &
		+ ' ")' 
	ll_row = ids_clientfranchise.Find ( ls_findstring, 1, ll_rowcount )
	IF	ll_row > 0 THEN
		// We have a row with an inappropriate end date.  We need to display a message.
		ldt_temp = ids_clientfranchise.GetItemDateTime ( ll_row, 'endeffdate' )
		MessageBox ( 'Assigned Offices', 'Franchise Number ' + ls_franchisenum[ll_idx] &
			+ ' Assignment Start date cannot be earlier than ' &
			+ String ( ldt_temp, 'mm/dd/yyyy' ) &
			+ '. This Office was previously SIGNED.  Please correct.',&
			Information!, OK! )
		This.ScrollToRow ( ll_modifiedrow[ll_idx] )
		This.SetRow ( ll_modifiedrow[ll_idx] )
		This.SetColumn ( 'officeacctmanager_begineffdate' )
		This.SetFocus ()
		Return -1
	END IF	
	
	// Find any ClntFranchise row for this FranchiseNum where the 
	// EndEffDate that the user entered falls between a ClntFranchise
	// BeginEffDate and EndEffDate.
	ls_findstring = &
		'clntfranchisenum="' + ls_franchisenum[ll_idx] &
		+ '" and Date ( endeffdate ) >= ' &
		+ ' Date ( "' &
		+ String ( ld_officeacctmanager_endeffdate[ll_idx] ) &
		+ ' ")' &
		+ ' and Date ( begineffdate ) < ' &
		+ ' Date ( "' &
		+ String ( ld_officeacctmanager_endeffdate[ll_idx] ) &
		+ ' ")'
	ll_row = ids_clientfranchise.Find ( ls_findstring, 1, ll_rowcount )
	IF	ll_row > 0 THEN
		// We have a row with an inappropriate end date.  We need to display a message.
		ldt_temp = ids_clientfranchise.GetItemDateTime ( ll_row, 'begineffdate' )
		MessageBox ( 'Assigned Offices', 'Franchise Number ' + ls_franchisenum[ll_idx] &
			+ ' Assignment End date cannot be later than ' &
			+ String ( ldt_temp, 'mm/dd/yyyy' ) &
			+ '. This Office is set up to be SIGNED.  Please correct.',&
			Information!, OK! )
		This.ScrollToRow ( ll_modifiedrow[ll_idx] )
		This.SetRow ( ll_modifiedrow[ll_idx] )
		This.SetColumn ( 'officeacctmanager_endeffdate' )
		This.SetFocus ()
		Return -1
	END IF	
NEXT
	
Return 1
end event

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Description:	If a row is selected, it can be unassigned.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//	AMCP	LANelson	10/26/2002	New.
//
//////////////////////////////////////////////////////////////////////////////

IF	This.GetSelectedRow ( 0 ) > 0 THEN
	cb_end_assignment.enabled = True
END IF
end event

